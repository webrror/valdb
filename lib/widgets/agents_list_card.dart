import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AgentsListCard extends StatelessWidget {
  final dynamic snapshot;
  const AgentsListCard({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width5, right: Dimensions.width5,),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 9,
              offset:
                  const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        //height: Dimensions.height20,
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                    colors: [
                      Colors.white10,
                      Color.fromRGBO(253, 69, 86, 1),
                    ],
                    stops: [
                      0.1,
                      1.0
                    ])),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                snapshot.displayName.toString().toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius10), bottomRight:Radius.circular(Dimensions.radius10)),
                child: Container(
                  color:  Colors.transparent,
                  height: double.infinity,
                  width: Dimensions.width120,
                  child: Image.network(snapshot.displayIcon, fit: BoxFit.cover,)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
