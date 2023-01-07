import 'package:flutter/material.dart';
import 'package:valdb/models/maps_model.dart';

import '../../services/fetch_service.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/maps_list_card.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});
  static const String routeName = '/maps';

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  FetchService fetchService = FetchService();
  ScrollController gridScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, Dimensions.height60),
        child: const AppBarCustom(
          title: 'Maps',
          bgColor: Color.fromRGBO(253, 69, 86, 1),
          elevation: 0
        ),
      ),
      body: FutureBuilder<PurpleMap>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width20,
                        right: Dimensions.width5,
                        top: Dimensions.height5),
                    child: Row(
                      children: [
                        Text(
                          '${snapshot.data!.data.length.toString()} Maps',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Go to top',
                          onPressed: () {
                            gridScrollController.animateTo(
                              0, // offset to top
                              duration: const Duration(milliseconds: 200), // duration it takes to go top
                              curve: Curves.linear // animation sort of
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_upward_rounded
                          )
                        )
                      ],
                    ),
                  ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : (MediaQuery.of(context).size.width > 600) ? 2 : 1,
                      mainAxisExtent: Dimensions.height100,
                    ),
                    controller: gridScrollController,
                    itemCount: snapshot.data!.data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return MapsListCard(
                          snapshot: snapshot.data!.data[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
        future: fetchService.fetchMaps(),
      ));
  }
}

