import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/AppColors.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool callHover = false;

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    initVideoController();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Future initVideoController() async {
    videoPlayerController = VideoPlayerController.asset("assets/user.mp4")
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          Timer(Duration(seconds: 2), () {
            videoPlayerController.play();
          });
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBackground,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.035),
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.offWhiteBackground,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.sizeOf(context).width * 0.035,
                MediaQuery.sizeOf(context).height * 0.035,
                MediaQuery.sizeOf(context).width * 0.035,
                MediaQuery.sizeOf(context).width * 0.035),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    LayoutBuilder(builder: (context, constraint) {
                      if (constraint.maxWidth < 600) {
                        return Row(
                          children: [
                            Text(
                              "emondd4",
                              style: GoogleFonts.pacifico(
                                  fontSize: 18.0,
                                  color: AppColors.textBlueColor),
                            ),
                            Spacer(),
                            Text(
                              "SERVICES",
                              style: GoogleFonts.outfit(
                                  fontSize: 12.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.035,
                            ),
                            Text(
                              "WORKS",
                              style: GoogleFonts.outfit(
                                  fontSize: 12.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.035,
                            ),
                            Text(
                              "EXPERIENCE",
                              style: GoogleFonts.outfit(
                                  fontSize: 12.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            Spacer(),
                            InkWell(
                              onHover: (value) {
                                setState(() {
                                  callHover = value;
                                });
                              },
                              onTap: () {
                                launchUrlString("tel://+8801676079239");
                              },
                              child: AnimatedContainer(
                                height: callHover != true ? 25 : 40,
                                width: callHover != true ? 25 : 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: callHover != true
                                        ? Colors.white
                                        : AppColors.textLightBlueColor,
                                    boxShadow: callHover != true
                                        ? [
                                            BoxShadow(
                                              color: Colors.grey
                                                  .withValues(alpha: 0.5),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ]
                                        : [
                                            BoxShadow(
                                              color: AppColors
                                                  .textLightBlueColor
                                                  .withValues(alpha: 0.5),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ]),
                                duration: Duration(milliseconds: 300),
                                child: Icon(
                                  size: 16.0,
                                  Icons.phone_forwarded_rounded,
                                  color: callHover != true
                                      ? AppColors.textLightBlueColor
                                      : Colors.white,
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            Text(
                              "emondd4",
                              style: GoogleFonts.pacifico(
                                  fontSize: 22.0,
                                  color: AppColors.textBlueColor),
                            ),
                            Spacer(),
                            Text(
                              "SERVICES",
                              style: GoogleFonts.outfit(
                                  fontSize: 16.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.035,
                            ),
                            Text(
                              "WORKS",
                              style: GoogleFonts.outfit(
                                  fontSize: 16.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.035,
                            ),
                            Text(
                              "EXPERIENCE",
                              style: GoogleFonts.outfit(
                                  fontSize: 16.0,
                                  color: AppColors.textBlueColor,
                                  letterSpacing: 1.5),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  "+8801676079239",
                                  style: GoogleFonts.outfit(
                                      fontSize: 16.0,
                                      color: AppColors.textBlueColor,
                                      letterSpacing: 1.5),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                InkWell(
                                  onHover: (value) {
                                    setState(() {
                                      callHover = value;
                                    });
                                  },
                                  onTap: () {
                                    launchUrlString("tel://+8801676079239");
                                  },
                                  child: AnimatedContainer(
                                    height: callHover != true ? 40 : 55,
                                    width: callHover != true ? 40 : 55,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: callHover != true
                                            ? Colors.white
                                            : AppColors.textLightBlueColor,
                                        boxShadow: callHover != true
                                            ? [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withValues(alpha: 0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ]
                                            : [
                                                BoxShadow(
                                                  color: AppColors
                                                      .textLightBlueColor
                                                      .withValues(alpha: 0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 1,
                                                  offset: Offset(0,
                                                      0), // changes position of shadow
                                                ),
                                              ]),
                                    duration: Duration(milliseconds: 300),
                                    child: Icon(
                                      Icons.phone_forwarded_rounded,
                                      color: callHover != true
                                          ? AppColors.textLightBlueColor
                                          : Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      }
                    }),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    LayoutBuilder(builder: (context, constraint) {
                      if (constraint.maxWidth < 600) {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hey There,\nI'm Emon",
                                    style: GoogleFonts.permanentMarker(
                                        fontSize: 36.0,
                                        color: AppColors.textBlueColor),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                  ),
                                  Text(
                                    "I Love to Develop Applications in Different Language,\nAnd I Love What I Do",
                                    style: GoogleFonts.outfit(
                                        fontSize: 12.0,
                                        color: AppColors.textBlueColor),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "4",
                                        style: GoogleFonts.outfit(
                                            fontSize: 46.0,
                                            color: AppColors.textBlueColor),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Years",
                                            style: GoogleFonts.outfit(
                                                fontSize: 12.0,
                                                color: AppColors.textBlueColor),
                                          ),
                                          Text(
                                            "Experience",
                                            style: GoogleFonts.outfit(
                                                fontSize: 12.0,
                                                color: AppColors.textBlueColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 15.0,),
                            videoPlayerController.value.isInitialized
                                ? SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    child: VideoPlayer(videoPlayerController))
                                : SizedBox()
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hey There,\nI'm Hossain Emon",
                                    style: GoogleFonts.permanentMarker(
                                        fontSize: 40.0,
                                        color: AppColors.textBlueColor),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                  ),
                                  Text(
                                    "I Love to Develop Applications in Different Language,\nAnd I Love What I Do",
                                    style: GoogleFonts.outfit(
                                        fontSize: 16.0,
                                        color: AppColors.textBlueColor),
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "4",
                                        style: GoogleFonts.outfit(
                                            fontSize: 50.0,
                                            color: AppColors.textBlueColor),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Years",
                                            style: GoogleFonts.outfit(
                                                fontSize: 16.0,
                                                color: AppColors.textBlueColor),
                                          ),
                                          Text(
                                            "Experience",
                                            style: GoogleFonts.outfit(
                                                fontSize: 16.0,
                                                color: AppColors.textBlueColor),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.6,
                                width: MediaQuery.sizeOf(context).height * 0.5,
                                child: VideoPlayer(videoPlayerController))
                          ],
                        );
                      }
                    }),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      child: Text(
                        "SERVICES",
                        style: GoogleFonts.outfit(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(
                                letterSpacing: 1.5,
                                decoration: TextDecoration.underline)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    LayoutBuilder(builder: (context, constraints) {
                      if (constraints.maxWidth < 600) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: AppColors.textBlueColor,
                                      child: Icon(
                                        Icons.web,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Website Design",
                                          style: GoogleFonts.outfit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "1 Projects",
                                          style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.03,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: AppColors.textBlueColor,
                                      child: Icon(
                                        Icons.web,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Mobile Application",
                                          style: GoogleFonts.outfit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "12 Projects",
                                          style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.03,
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: AppColors.textBlueColor,
                                      child: Icon(
                                        Icons.web,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Web Application",
                                          style: GoogleFonts.outfit(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Learning Phase",
                                          style: GoogleFonts.outfit(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.06,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "What do I help?",
                                      style: GoogleFonts.outfit(
                                          fontSize: 32.0,
                                          color: AppColors.textBlueColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "As a passionate Software Developer, I specialize in building world-class applications that blend performance, scalability, and intuitive design. With professional experience in Flutter (Mobile & Web) and Kotlin, I help businesses and teams craft seamless cross-platform experiences that users love.",
                                      style: GoogleFonts.outfit(
                                        fontSize: 12.0,
                                        color: AppColors.textBlueColor,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      "Currently expanding my backend expertise with Node.js, I aim to become a full-stack problem-solver who can take an idea from concept to production-ready application.",
                                      style: GoogleFonts.outfit(
                                        fontSize: 12.0,
                                        color: AppColors.textBlueColor,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "15+",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 28.0,
                                                  color:
                                                      AppColors.textBlueColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Project Completed",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 12.0,
                                                  color:
                                                      AppColors.textBlueColor,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "700+",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 28.0,
                                                  color:
                                                      AppColors.textBlueColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Happy Clients",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 12.0,
                                                  color:
                                                      AppColors.textBlueColor,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor:
                                              AppColors.textBlueColor,
                                          child: Icon(
                                            Icons.web,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Website Design",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "1 Projects",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.03,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor:
                                              AppColors.textBlueColor,
                                          child: Icon(
                                            Icons.web,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mobile Application",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "12 Projects",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.03,
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,
                                              0), // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundColor:
                                              AppColors.textBlueColor,
                                          child: Icon(
                                            Icons.web,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Web Application",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Learning Phase",
                                              style: GoogleFonts.outfit(
                                                  fontSize: 12,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "What do I help?",
                                        style: GoogleFonts.outfit(
                                            fontSize: 32.0,
                                            color: AppColors.textBlueColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "As a passionate Software Developer, I specialize in building world-class applications that blend performance, scalability, and intuitive design. With professional experience in Flutter (Mobile & Web) and Kotlin, I help businesses and teams craft seamless cross-platform experiences that users love.",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Currently expanding my backend expertise with Node.js, I aim to become a full-stack problem-solver who can take an idea from concept to production-ready application.",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "15+",
                                                style: GoogleFonts.outfit(
                                                    fontSize: 28.0,
                                                    color:
                                                        AppColors.textBlueColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Project Completed",
                                                style: GoogleFonts.outfit(
                                                    fontSize: 12.0,
                                                    color:
                                                        AppColors.textBlueColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "700+",
                                                style: GoogleFonts.outfit(
                                                    fontSize: 28.0,
                                                    color:
                                                        AppColors.textBlueColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Happy Clients",
                                                style: GoogleFonts.outfit(
                                                    fontSize: 12.0,
                                                    color:
                                                        AppColors.textBlueColor,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    }),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      child: Text(
                        "EXPERIENCE",
                        style: GoogleFonts.outfit(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(
                                letterSpacing: 1.5,
                                decoration: TextDecoration.underline)),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    JobTimeLine()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}

class JobTimeLine extends StatelessWidget {
  const JobTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineItem(
          date: "MAR 2016 - PRESENT",
          title: "AQUALINK BANGLADESH LTD.",
          description:
          "FLUTTER DEVELOPER\nDelivering clean, maintainable, and optimized code, Ensuring pixel-perfect UI across platforms, Shipping production-grade applications with modern tech, Collaborating with teams to bring innovative ideas to life",
          dotColor: Colors.teal,
        ),
        const SizedBox(height: 10.0,),
        TimelineItem(
          date: "AUG 2020 - MAR 2022",
          title: "BDTASK",
          description:
          "KOTLIN DEVELOPER\nImplementing MVVM architecture for clean code separation, Integrating REST APIs and local databases (Room, SQLite), Ensuring performance, scalability, and security best practices",
          dotColor: Colors.yellow,
          isLast: false,
        ),
      ],
    );
  }
}

class TimelineItem extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final Color dotColor;
  final bool isLast;

  const TimelineItem({
    required this.date,
    required this.title,
    required this.description,
    required this.dotColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Date and Title
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        // Center: Dot and Line
        Column(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: dotColor,
            ),
            if (!isLast)
              CustomPaint(
                size: Size(2, 120),
                painter: DashedLinePainter(),
              ),
          ],
        ),
        SizedBox(width: 16),
        // Right side: Description
        Expanded(
          flex: 3,
          child: Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashHeight = 5;
    double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
