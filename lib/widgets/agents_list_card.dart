import 'package:flutter/material.dart';
import 'package:valdb/models/agents_model.dart';
import 'package:valdb/utils/color_util.dart';

import '../utils/dimensions.dart';

class AgentsListCard extends StatelessWidget {
  final AgentDetailModel agent;
  final int index;
  const AgentsListCard({super.key, required this.agent, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.height10,
        left: Dimensions.width5,
        right: Dimensions.width5,
      ),
      child: Hero(
        tag: "agent${agent.uuid}_bg",
        flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
          return Material(
            color: Colors.transparent,
            child: toHeroContext.widget,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimensions.radius10),
          ),
          //height: Dimensions.height20,
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      // colors: colors,
                      colors: convertHexToColorList(agent.backgroundGradientColors ?? []),
                      stops: const [0.2, 1.0],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Text(
                  (agent.displayName ?? "-").toUpperCase(),
                  style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w900, fontSize: 20),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius10), bottomRight: Radius.circular(Dimensions.radius10)),
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: Dimensions.width120,
                    child: Image.network(
                      agent.displayIcon ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
