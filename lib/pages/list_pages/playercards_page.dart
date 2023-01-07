import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:valdb/models/playercards_model.dart';
import 'package:valdb/widgets/player_card_list_card.dart';

import '../../services/fetch_service.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_bar.dart';

class PlayerCards extends StatefulWidget {
  const PlayerCards({super.key});
  static const String routeName = '/player-cards';

  @override
  State<PlayerCards> createState() => _PlayerCardsState();
}

class _PlayerCardsState extends State<PlayerCards> {
  FetchService fetchService = FetchService();
  ScrollController gridScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.height60),
          child: AppBarCustom(
            title: 'Player Cards',
            bgColor: const Color.fromRGBO(253, 69, 86, 1),
            elevation: 0,
            // actions: [
            //   IconButton(
            //     onPressed: (){},
            //     icon: const Icon(Icons.search_rounded)
            //   ),
            // ],
          ),
        ),
        body: FutureBuilder<PlayerCard>(
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
                          '${snapshot.data!.data.length.toString()} Player Cards',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Go to top',
                          onPressed: () {
                            gridScrollController.animateTo(
                              0, // offset to top
                              duration: const Duration(milliseconds: 500), // duration it takes to go top
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
                      controller: gridScrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 1200
                            ? 5
                            : (MediaQuery.of(context).size.width > 600)
                                ? 3
                                : 2,
                        mainAxisExtent: Dimensions.height400,
                      ),
                      itemCount: snapshot.data!.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return PlayerCardListCard(
                            snapshot: snapshot.data!.data[index]);
                      },
                    ),
                  ),
                ],
              );
            }
          },
          future: fetchService.fetchPlayerCards(),
        ));
  }
}
