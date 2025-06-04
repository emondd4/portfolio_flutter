import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'JobTimeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool callHover = false;

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Sensometer Ac Monitoring',
      'description': 'This Application Gives Analytics on AC Usage and Give User Full Access to Control Over Assigned ACs.',
      'imageUrl': 'assets/acMonitor.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.sensometer_ac_monitoring',
    },
    {
      'title': 'Agrotrace Tobacco',
      'description': 'This Application is Mainly for Jamil Group Crop Management Where They Can Create Farmer, Give Loan, Purchase, Rehandle, Ship and Factory Feed.',
      'imageUrl': 'assets/agrotrace.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=slodh.aqualink.tobaccotrace.agrotracetobacco',
    },
    {
      'title': 'Bluetooth Sensometer',
      'description': 'This Application is Mainly Used to Take Value of Ammonia, Oxygen, Carbon, Nitrogen of Soil Using Realtime Bluetooth Module.',
      'imageUrl': 'assets/Btmeter.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbangladesh.water_sensor.water_sensor',
    },
    {
      'title': 'Fithub',
      'description': 'This Application is Mainly Used for Gym Management Where Admin can Create Member, Manage Payment, Manage Membership and Many More.',
      'imageUrl': 'assets/fithub.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.fithub_gym_management',
    },
    {
      'title': 'Qpass',
      'description': 'This Application is Mainly Used for Human Resource Management Where Admin can Create Member, Manage Salary, Manage Employee, Manage Holidays and Many More.',
      'imageUrl': 'assets/Hr.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.hrms_mobile_app',
    },
    {
      'title': 'Aquaculture WMS',
      'description': 'This Application is Mainly Used for Aquaculture Where User Can Create Pond, Assign Pond, Get Realtime Sensor Values Like DO,NO3,CO2 Even Users Can Get Analysis too.',
      'imageUrl': 'assets/wmsMonitor.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbd.aquaculture_wms',
    },
  ];


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
                            SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    child: Image.asset("assets/picofme.png"))
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
                                child: Image.asset("assets/picofme.png"))
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

                    /// Workings
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      child: Text(
                        "WORKINGS",
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
                    LayoutBuilder(builder: (context,constraint){
                      return constraint.maxWidth < 600 ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CardItem(item: items[index]),
                          );
                        },
                      )
                          : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CardItem(item: items[index]);
                        },
                      );
                    }),
                    // CarouselSlider.builder(
                    //     itemCount: images.length,
                    //     itemBuilder: (context,itemIndex,pageViewIndex) {
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //           color: Colors.red,
                    //           borderRadius: BorderRadius.circular(10.0)
                    //         ),
                    //         child: Stack(
                    //           children: [
                    //             Positioned(child: ClipRRect(clipBehavior: Clip.antiAlias ,borderRadius: BorderRadius.circular(10.0),child: Image.asset(images[itemIndex],fit: BoxFit.cover,),)),
                    //             Positioned(bottom:10,right:10,child: Align(
                    //               child: Container(
                    //                 width: MediaQuery.sizeOf(context).width * 0.08,
                    //                 decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(8.0),
                    //                   color: AppColors.textLightBlueColor
                    //                 ),
                    //                 child: Padding(
                    //                   padding: const EdgeInsets.fromLTRB(20.0,8.0,20.0,8.0),
                    //                   child: Center(child: Text("Live Link",style: GoogleFonts.outfit(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),)),
                    //                 ),
                    //               ),
                    //             )),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //     options: CarouselOptions(
                    //       height: MediaQuery.sizeOf(context).height * 0.65,
                    //       viewportFraction: 1.0,
                    //       initialPage: 0,
                    //       enableInfiniteScroll: true,
                    //       reverse: false,
                    //       autoPlay: true,
                    //       autoPlayInterval: Duration(seconds: 5),
                    //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                    //       autoPlayCurve: Curves.fastOutSlowIn,
                    //       enlargeCenterPage: true,
                    //       enlargeFactor: 0.2,
                    //       scrollDirection: Axis.horizontal,
                    //     )
                    // ),

                    /// Experience
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
                    JobTimeLine(),
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

class CardItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CardItem({super.key, required this.item});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch URL')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -30 : 0, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? AppColors.textLightBlueColor.withOpacity(0.5) : Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.identity()..scale(_isHovered ? 1.1 : 1.0),
                child: Image.asset(
                  widget.item['imageUrl'],
                  height: MediaQuery.sizeOf(context).height * 0.45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error, size: 50));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item['title'],
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textBlueColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.item['description'],
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      color: AppColors.textBlueColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                  ElevatedButton(
                    onPressed: () => _launchUrl(widget.item['liveUrl']),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textBlueColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Go Live',style: GoogleFonts.outfit(fontSize: 12.0,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


