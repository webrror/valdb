import 'package:flutter/material.dart';
import 'package:valdb/pages/details_pages/agent_details.dart';
import 'package:valdb/services/fetch_service.dart';

import '../../models/agents_model.dart';
import '../../utils/dimensions.dart';
import '../../widgets/agents_list_card.dart';
import '../../widgets/app_bar.dart';

class Agents extends StatefulWidget {
  const Agents({super.key});
  static const String routeName = '/agents';

  @override
  State<Agents> createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  FetchService fetchService = FetchService();
  ScrollController gridScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.height60),
          child: const AppBarCustom(
              title: 'Agents',
              bgColor: Color.fromRGBO(253, 69, 86, 1),
              elevation: 0),
        ),
        body: FutureBuilder<Agent>(
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
                        right: Dimensions.width10,
                        top: Dimensions.height5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${snapshot.data!.data.length.toString()} Agents',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        
                        IconButton(
                            tooltip: 'Go to top',
                            onPressed: () {
                              gridScrollController.animateTo(0, // offset to top
                                  duration: const Duration(
                                      milliseconds:
                                          200), // duration it takes to go top
                                  curve: Curves.linear // animation sort of
                                  );
                            },
                            icon: const Icon(Icons.arrow_upward_rounded))
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 800
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => AgentDetails(snapshot: snapshot.data!.data[index], index: index,),));
                          },
                          child: AgentsListCard(
                              snapshot: snapshot.data!.data[index], index: index,),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
          future: fetchService.fetchAgents(),
        ));
  }
}
