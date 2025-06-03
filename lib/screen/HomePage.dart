import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';
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
    videoPlayerController = VideoPlayerController.asset("assets/user.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
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
              child: Column(
                children: [
                  LayoutBuilder(builder: (context, constraint) {
                    if (constraint.maxWidth < 600) {
                      return Row(
                        children: [
                          Text(
                            "emondd4",
                            style: GoogleFonts.pacifico(
                                fontSize: 18.0, color: AppColors.textBlueColor),
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
                                            color: AppColors.textLightBlueColor
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
                                fontSize: 22.0, color: AppColors.textBlueColor),
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
                  LayoutBuilder(builder: (context,constraint){
                    if(constraint.maxWidth < 600){
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
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
                                Text(
                                  "I Love to Develop Applications in Different Language,\nAnd I Love What I Do",
                                  style: GoogleFonts.outfit(
                                      fontSize: 12.0,
                                      color: AppColors.textBlueColor),
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Text(
                                      "4",
                                      style: GoogleFonts.outfit(
                                          fontSize: 46.0,
                                          color: AppColors.textBlueColor),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          videoPlayerController.value.isInitialized
                              ? SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              width: MediaQuery.sizeOf(context).height * 0.5,
                              child: VideoPlayer(videoPlayerController))
                              : SizedBox()
                        ],
                      );
                    }else{
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
                                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),
                                Text(
                                  "I Love to Develop Applications in Different Language,\nAnd I Love What I Do",
                                  style: GoogleFonts.outfit(
                                      fontSize: 16.0,
                                      color: AppColors.textBlueColor),
                                ),
                                const SizedBox(height: 20.0,),
                                Row(
                                  children: [
                                    Text(
                                      "4",
                                      style: GoogleFonts.outfit(
                                          fontSize: 50.0,
                                          color: AppColors.textBlueColor),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          videoPlayerController.value.isInitialized
                              ? SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.6,
                              width: MediaQuery.sizeOf(context).height * 0.5,
                              child: VideoPlayer(videoPlayerController))
                              : SizedBox()
                        ],
                      );
                    }
                  }),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.10,
                  ),
                  Center(
                    child: Text("SERVICES",style: GoogleFonts.outfit(fontSize: 32.0,fontWeight: FontWeight.bold,textStyle:TextStyle(letterSpacing: 1.5,decoration: TextDecoration.underline)),),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
