import 'package:flutter/material.dart';
import 'package:valdb/services/fetch_service.dart';
import 'package:valdb/widgets/weapons_list_card.dart';

import '../../models/weapons_model.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_bar.dart';

class Weapons extends StatefulWidget {
  const Weapons({super.key});
  static const String routeName = '/weapons';

  @override
  State<Weapons> createState() => _WeaponsState();
}

class _WeaponsState extends State<Weapons> {
  FetchService fetchService = FetchService();
  ScrollController gridScrollController = ScrollController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.height60),
          child: const AppBarCustom(
              title: 'Weapons',
              bgColor: Color.fromRGBO(253, 69, 86, 1),
              elevation: 0),
        ),
        body: FutureBuilder<Weapon>(
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
                          '${snapshot.data!.data.length.toString()} Weapons',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                            tooltip: 'Go to top',
                            onPressed: () {
                              gridScrollController.animateTo(0, // offset to top
                                  duration: const Duration(
                                      milliseconds:
                                          500), // duration it takes to go top
                                  curve: Curves.linear // animation sort of
                                  );
                            },
                            icon: const Icon(Icons.arrow_upward_rounded))
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 1200
                            ? 3
                            : (MediaQuery.of(context).size.width > 600)
                                ? 2
                                : 1,
                        mainAxisExtent: Dimensions.height100,
                      ),
                      controller: gridScrollController,
                      itemCount: snapshot.data!.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        //return Text(snapshot.data!.data[index].displayName!);
                        return WeaponsListCard(
                            snapshot: snapshot.data!.data[index]);
                      },
                    ),
                  ),
                ],
              );
            }
          },
          future: fetchService.fetchWeapons(),
        ));
  }
}
