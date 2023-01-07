import 'package:flutter/material.dart';
import 'package:gallery_view/gallery_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:valdb/utils/gradient_values.dart';

class AgentDetails extends StatefulWidget {
  final dynamic snapshot;
  final int index;
  const AgentDetails({
    Key? key,
    this.snapshot,
    this.index = 0,
  }) : super(key: key);
  static const String routeName = '/agent-detail';

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  late bool abilityBoxIsVisible;
  int? abilityBoxIndex;

  @override
  void initState() {
    abilityBoxIsVisible = true;
    abilityBoxIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
            colors: [
              gradientValues[widget.index][0],
              gradientValues[widget.index][1],
            ],
            stops: const [
              0.1,
              1.0
            ]
          ),
        ),
        child: SingleChildScrollView(
          
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    height: screenHeight / 2.5,
                    width: screenWidth,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                            colors: [
                              gradientValues[widget.index][0],
                              gradientValues[widget.index][1],
                            ],
                            stops: const [
                              0.1,
                              1.0
                            ]),
                        //color: const Color.fromRGBO(253, 69, 86, 1),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(widget.snapshot.background),
                        )),
                  ),
                  
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20, top: screenHeight * 0.08),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.snapshot.displayName
                                    .toString()
                                    .toUpperCase(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 30),
                              ),
                              InkResponse(
                                splashColor: Colors.black12,
                                onTap: () {
                                  
                                },
                                child: Image.network(
                                    widget.snapshot.role.displayIcon,
                                    width: screenWidth * 0.06,
                                    color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          Text(
                            "Bio".toUpperCase(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          Text(
                            widget.snapshot.description.toString(),
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: screenWidth * 0.03,
                          ),
                          Text(
                            "Abilities".toUpperCase(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: screenWidth * 0.04,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10,
                                    mainAxisExtent: 70),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        begin: FractionalOffset.bottomLeft,
                                        end: FractionalOffset.topRight,
                                        colors: [
                                          gradientValues[widget.index][0],
                                          gradientValues[widget.index][1],
                                        ],
                                        stops: const [
                                          0.0,
                                          1.0,
                                        ],
                                      ).createShader(bounds);
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          abilityBoxIndex = index;
                                          abilityBoxIsVisible = true;
                                        });
                                      },
                                      child: Image.network(
                                        widget
                                            .snapshot.abilities[index].displayIcon,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenWidth * 0.02,
                                  ),
                                  abilityBoxIndex == index && abilityBoxIsVisible
                                      ? Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: FractionalOffset.bottomLeft,
                                                end: FractionalOffset.topRight,
                                                colors: [
                                                  gradientValues[widget.index][0],
                                                  gradientValues[widget.index][1],
                                                ],
                                                stops: const [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          width: 12,
                                          height: 5,
                                        )
                                      : const SizedBox()
                                ],
                              );
                            },
                            itemCount: 4,
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: (!abilityBoxIsVisible)
                                ? null
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 20),
                                    child: Column(
                                      children: [
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: widget
                                                .snapshot
                                                .abilities[abilityBoxIndex]
                                                .displayName,
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                          ),
                                          abilityBoxIndex == 3
                                              ? TextSpan(
                                                  text:
                                                      ' (${widget.snapshot.abilities[abilityBoxIndex].slot.toString().split('.').last})',
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 20),
                                                )
                                              : const WidgetSpan(child: SizedBox()),
                                        ])),
                                        SizedBox(
                                          height: screenWidth * 0.03,
                                        ),
                                        Text(
                                          widget.snapshot.abilities[abilityBoxIndex]
                                              .description
                                              .toString(),
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: screenWidth * 0.02,
                          ),
                          Text(
                            "Gallery".toUpperCase(),
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: screenWidth * 0.04,
                          ),
                          Container(
                            // color: Colors.black12,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    gradientValues[widget.index][0],
                                    gradientValues[widget.index][1],
                                  ],
                                  stops: const [0.1, 1.0],
                                )),
                              
                            child: GalleryView(crossAxisCount: 3, imageUrlList: [
                              widget.snapshot.fullPortrait,
                              widget.snapshot.background,
                              widget.snapshot.displayIcon,
                              //widget.snapshot.displayIconSmall,
                              //widget.snapshot.bustPortrait,
                            ]),
                          ),
                          SizedBox(
                            height: screenWidth * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  widget.snapshot.fullPortrait,
                  height: screenHeight / 2.1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
