import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valdb/pages/details_pages/agent_details.dart';
import 'package:valdb/services/fetch_service.dart';
import 'package:valdb/valdb_provider.dart';

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DataProvider>().fetchAgents();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = context.watch<DataProvider>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, Dimensions.height60),
        child: const AppBarCustom(title: 'Agents', bgColor: Color.fromRGBO(253, 69, 86, 1), elevation: 0),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<DataProvider>().fetchAgents();
        },
        child: Stack(
          children: [
            ListView(
              physics: const AlwaysScrollableScrollPhysics(),
            ),
            Builder(
              builder: (context) {
                if (dataProvider.isAgentsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (dataProvider.agents.isEmpty) {
                  return const Center(
                    child: Text('No Agents Found'),
                  );
                } else {
                  List<AgentDetailModel> agents = dataProvider.agents;
            
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width10,
                          top: Dimensions.height5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${agents.length.toString()} Agents',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              tooltip: 'Go to top',
                              onPressed: () {
                                gridScrollController.animateTo(
                                  0, // offset to top
                                  duration: const Duration(milliseconds: 200), // duration it takes to go top
                                  curve: Curves.linear, // animation sort of
                                );
                              },
                              icon: const Icon(Icons.arrow_upward_rounded),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.only(bottom: 100, left: 10, right: 10),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).size.width > 800
                                ? 3
                                : (MediaQuery.of(context).size.width > 600)
                                    ? 2
                                    : 1,
                            mainAxisExtent: Dimensions.height100,
                          ),
                          controller: gridScrollController,
                          itemCount: agents.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AgentDetails(
                                      agent: agents[index],
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: AgentsListCard(
                                agent: agents[index],
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
