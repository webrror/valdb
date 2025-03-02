import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_view/gallery_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valdb/models/agents_model.dart';
import 'package:valdb/utils/color_util.dart';

class AgentDetails extends StatefulWidget {
  final AgentDetailModel agent;
  final int index;
  const AgentDetails({
    super.key,
    required this.agent,
    this.index = 0,
  });
  static const String routeName = '/agent-detail';

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  late bool abilityBoxIsVisible;
  int abilityBoxIndex = 0;

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
        forceMaterialTransparency: true,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: "agent${widget.agent.uuid}_bg",
                  child: Container(
                    padding: EdgeInsets.zero,
                    height: screenHeight / 2.5,
                    width: screenWidth,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.bottomLeft,
                        end: FractionalOffset.topRight,
                        colors: convertHexToColorList(widget.agent.backgroundGradientColors ?? []),
                        stops: const [0.15, 1.0],
                      ),
                      //color: const Color.fromRGBO(253, 69, 86, 1),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(widget.agent.background ?? ""),
                      ),
                    ),
                  ),
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
                            Expanded(
                              child: Hero(
                                tag: "agent${widget.agent.uuid}",
                                flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                                  return DefaultTextStyle(
                                    style: DefaultTextStyle.of(toHeroContext).style,
                                    child: toHeroContext.widget,
                                  );
                                },
                                child: Text(
                                  widget.agent.displayName.toString().toUpperCase(),
                                  style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
                                ),
                              ),
                            ),
                            Tooltip(
                              message: widget.agent.role?.displayName ?? "",
                              child: InkResponse(
                                splashColor: Colors.black12,
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Image.network(
                                      widget.agent.role?.displayIcon ?? "",
                                      width: screenWidth * 0.045,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      widget.agent.role?.displayName ?? "",
                                      style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 17),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 0.02,
                        ),
                        Text(
                          "Bio".toUpperCase(),
                          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: screenWidth * 0.02,
                        ),
                        Text(
                          widget.agent.description.toString(),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: screenWidth * 0.03,
                        ),
                        Text(
                          "Abilities".toUpperCase(),
                          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: screenWidth * 0.04,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 10, mainAxisExtent: 70),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: FractionalOffset.bottomLeft,
                                      end: FractionalOffset.topRight,
                                      colors: convertHexToColorList(widget.agent.backgroundGradientColors ?? []),
                                      stops: const [
                                        0.3,
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
                                      widget.agent.abilities?[index].displayIcon ?? "",
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
                                              colors: convertHexToColorList(widget.agent.backgroundGradientColors ?? []),
                                              stops: const [
                                                0.2,
                                                1.0,
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(100)),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                                  child: Column(
                                    children: [
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: widget.agent.abilities?[abilityBoxIndex].displayName,
                                          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                                        ),
                                        abilityBoxIndex == 3
                                            ? TextSpan(
                                                text: ' (${widget.agent.abilities?[abilityBoxIndex].slot.toString().split('.').last})',
                                                style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20),
                                              )
                                            : const WidgetSpan(child: SizedBox()),
                                      ])),
                                      SizedBox(
                                        height: screenWidth * 0.03,
                                      ),
                                      Text(
                                        (widget.agent.abilities?[abilityBoxIndex].description ?? "").toString(),
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
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
                          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20),
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
                              colors: convertHexToColorList(widget.agent.backgroundGradientColors ?? []),
                              stops: const [0.15, 1.0],
                            ),
                          ),

                          child: GalleryView(
                            crossAxisCount: 3,
                            imageUrlList: [
                              widget.agent.fullPortrait ?? "",
                              widget.agent.background ?? "",
                              widget.agent.displayIcon ?? "",
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 0.04,
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CachedNetworkImage(
                  imageUrl: widget.agent.fullPortrait ?? "",
                  height: screenHeight / 2.1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
