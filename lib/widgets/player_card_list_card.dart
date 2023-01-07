import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class PlayerCardListCard extends StatelessWidget {
  final dynamic snapshot;
  const PlayerCardListCard({
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                snapshot.displayName.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width < 1000 ? 13 : 18
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: Dimensions.height10,),
              Image.network(
                snapshot.largeArt, 
                width: Dimensions.width120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
