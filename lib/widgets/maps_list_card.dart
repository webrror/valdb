import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/dimensions.dart';

class MapsListCard extends StatelessWidget {
  final dynamic snapshot;
  const MapsListCard({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height10, left: Dimensions.width5, right:  Dimensions.width5),
      child: Container(
        margin: EdgeInsets.only(bottom: Dimensions.height5),
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
        height: Dimensions.height100,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              child: Image.network(snapshot.listViewIcon, fit: BoxFit.cover,),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius10),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.centerRight,
                    end: FractionalOffset.centerLeft,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Dimensions.width15, top: Dimensions.height15),
              child: Text(
                snapshot.displayName.toString().toUpperCase(), 
                // style: GoogleFonts.archivoBlack(
                //   color: Colors.white,
                //   fontWeight: FontWeight.bold,
                //   fontSize: 22
                // ),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
