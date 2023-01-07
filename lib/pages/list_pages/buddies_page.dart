import 'package:flutter/material.dart';
import 'package:valdb/models/buddy_model.dart';
import 'package:valdb/services/fetch_service.dart';
import 'package:valdb/widgets/buddy_list_card.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_bar.dart';

class Buddies extends StatefulWidget {
  const Buddies({super.key});
  static const String routeName = '/buddies';

  @override
  State<Buddies> createState() => _BuddiesState();
}

// ! OPTIMISE FOR DESKTOP

class _BuddiesState extends State<Buddies> {
  FetchService fetchService = FetchService();
  ScrollController gridScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.height60),
          child: const AppBarCustom(
            title: 'Buddies',
            bgColor: Color.fromRGBO(253, 69, 86, 1),
            elevation: 0
          ),
        ),
        body: FutureBuilder<Buddy>(
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
                          '${snapshot.data!.data.length.toString()} Gun Buddies',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          tooltip: 'Go to top',
                          onPressed: () {
                            gridScrollController.animateTo(
                              0, // offset to top
                              duration: const Duration(milliseconds: 600), // duration it takes to go top
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:Dimensions.width10),
                      child: GridView.builder(
                        controller: gridScrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width > 1000
                            ? 5
                            : (MediaQuery.of(context).size.width > 600)
                                ? 3
                                : 2,
                          mainAxisExtent: Dimensions.height200,
                        ),
                        itemCount: snapshot.data!.data.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return BuddiesListCard(
                              snapshot: snapshot.data!.data[index]);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
          future: fetchService.fetchBuddies(),
        ));
  }
}

