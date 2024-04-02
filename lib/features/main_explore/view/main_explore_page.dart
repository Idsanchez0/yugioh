import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugioh/features/main_explore/controller/main_explore_controller.dart';
import 'package:yugioh/features/main_explore/widgets/image_widget.dart';

import '../../../core/provider/provider_data.dart';
import '../../../core/services/launch_url_service.dart';
import '../../../core/ui/design/atoms/text_fields/custom_search_field.dart';
import '../../../core/ui/design/templates/loader/loader.dart';
import '../../../core/ui/design/templates/modals/middle_modal_template.dart';
import '../../../core/ui/utils/paths/colors_ui.dart';
import '../../../core/ui/utils/size/size_config.dart';
import '../widgets/card_list_widget.dart';

class MainExplorePage extends StatefulWidget {
  const MainExplorePage({super.key});
  @override
  State<MainExplorePage> createState() => _MainExplorePage();
}

class _MainExplorePage extends State<MainExplorePage> {
  final _globalKey = GlobalKey<ScaffoldState>();
  dynamic dataCards, newDataList, filteredOrderList;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData(context);
  }

  void _onSearchCitiesChanged() {
    setState(() {
      String searchText = _searchController.text.toLowerCase();
      List<Map<String, dynamic>> convertedList =
          List<Map<String, dynamic>>.from(dataCards);
      filteredOrderList = convertedList
          .where((item) => item['name'].toLowerCase().contains(searchText))
          .toList();
    });
  }

  loading() async {
    middleModals.middleModal(
        context, const Loader(), Colors.transparent, 'splash');
  }

  getData(context) async {
    await Future.delayed(Duration.zero);
    var dataProvider = Provider.of<ProviderData>(context, listen: false);
    loading();
    await MainExploreController(context).getCards();
    setState(() {
      newDataList = dataProvider.dataCard;
    });
    await MainExploreController(context).filterCards(cardsList: newDataList);
    setState(() {
      dataCards = dataProvider.dataFilterCard;
      filteredOrderList = dataCards;
    });

    _searchController.addListener(_onSearchCitiesChanged);
    Navigator.pop(context);
  }

  showPhotos({required dynamic images}) async {
    var newList = [];
    newList.clear();
    setState(() {
      newList.add(images['image_url'].toString());
      newList.add(images['image_url_small'].toString());
      newList.add(images['image_url_cropped'].toString());
    });
    middleModals.middleModal(
        context, ImageWidget(listImages: newList), Colors.transparent, 'main');
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => exit(0)));
        return;
      },
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  colors.primary500,
                  colors.secondary300,
                ],
                begin: const FractionalOffset(0.0, 1.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              key: _globalKey,
              body: SafeArea(
                  bottom: false,
                  top: true,
                  child: Column(
                    children: [
                      Container(
                        width: 90 * SizeConfig.widthMultiplier,
                        child: CustomSearchField(
                            controller: _searchController,
                            inputType: TextInputType.text,
                            enable: true,
                            hintText: 'Search ..'),
                      ),
                      SizedBox(
                        height: 3 * SizeConfig.heightMultiplier,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: filteredOrderList == null
                                  ? 0
                                  : filteredOrderList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return CardListWidget(
                                  dataCard: filteredOrderList[index],
                                  showModalPhotos: () => showPhotos(
                                      images: filteredOrderList[index]
                                          ['card_images'][0]),
                                  showMore: () => launchUrlServices.launchPage(
                                      url: filteredOrderList[index]
                                              ['ygoprodeck_url']
                                          .toString()),
                                );
                              }))
                    ],
                  )))),
    );
  }
}
