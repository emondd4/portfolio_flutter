import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/AppColors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'CardItem.dart';
import 'JobTimeline.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _serviceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  bool callHover = false;

  final List<Map<String, dynamic>> items = const [
    {
      'title': 'Crowd Connect',
      'description': 'This Application is Mainly a Social Gathering Application That Helps Find People Nearby And Get Connect With Them.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/crowdConnect.png',
      'liveUrl': 'https://drive.google.com/file/d/1pQIsivN9BWsHGF3Misyksi2iHzj56u46/view?usp=sharing',
    },
    {
      'title': 'Driver Cashflow',
      'description': 'This Application is Mainly Used For Driver Trip Management and Its Based On Italy.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/driverCashflow.jpg',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.enjoycitytours.cashflow',
    },
    {
      'title': 'Limo Lead (Driver)',
      'description': 'This is Ride Share Application That Only Serves Limo Services. Its Based On Texas.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/limoDriver.png',
      'liveUrl': 'https://drive.google.com/file/d/10b-mh342Y2_T5d05eo6RUlWNfSwz2bWm/view?usp=sharing',
    },
    {
      'title': 'Limo Lead (Passenger)',
      'description': 'This is Ride Share Application That Only Serves Limo Services. Its Based On Texas.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/limoPassenger.png',
      'liveUrl': 'https://drive.google.com/file/d/16fYyiKEvytabTLXLrhCcY93FhV7MBEow/view?usp=sharing',
    },{
      'title': 'Polynet Greenhouse',
      'description': 'Polynet Greenhouse is a modern, IoT-powered mobile application designed for efficient greenhouse management.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/polynet.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.polynet_greenhouse_mobile',
    },
    {
      'title': 'Sensometer Generator Monitoring',
      'description': 'This Application is Mainly For Generator Management System and Let User Know Insights, Status, Report and Control Panel',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/generatorMonitor.jpg',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbangladesh.sensometer_generator_monitoring',
    },
    {
      'title': 'Sensometer EMS',
      'description': 'This Application is Mainly For Energy Management and Let User Know Insights, Status, Report and Control Panel',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/ems.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbd.sensometer_ems',
    },
    {
      'title': 'Sensometer Energy Monitoring',
      'description': 'This Application is Mainly For Energy Management and Let User Know Insights, Status, Report and Control Panel',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/energyMonitor.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbd.sensometer_energy_monitoring',
    },
    {
      'title': 'Sensometer Ac Monitoring',
      'description': 'This Application Gives Analytics on AC Usage and Give User Full Access to Control Over Assigned ACs.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/acMonitor.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.sensometer_ac_monitoring',
    },
    {
      'title': 'Agrotrace Tobacco',
      'description': 'This Application is Mainly for Jamil Group Crop Management Where They Can Create Farmer, Give Loan, Purchase, Rehandle, Ship and Factory Feed.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/agrotrace.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=slodh.aqualink.tobaccotrace.agrotracetobacco',
    },
    {
      'title': 'Bluetooth Sensometer',
      'description': 'This Application is Mainly Used to Take Value of Ammonia, Oxygen, Carbon, Nitrogen of Soil Using Realtime Bluetooth Module.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/Btmeter.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbangladesh.water_sensor.water_sensor',
    },
    {
      'title': 'Fithub',
      'description': 'This Application is Mainly Used for Gym Management Where Admin can Create Member, Manage Payment, Manage Membership and Many More.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/fithub.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.fithub_gym_management',
    },
    {
      'title': 'Qpass',
      'description': 'This Application is Mainly Used for Human Resource Management Where Admin can Create Member, Manage Salary, Manage Employee, Manage Holidays and Many More.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/Hr.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualink.hrms_mobile_app',
    },
    {
      'title': 'Aquaculture WMS',
      'description': 'This Application is Mainly Used for Aquaculture Where User Can Create Pond, Assign Pond, Get Realtime Sensor Values Like DO,NO3,CO2 Even Users Can Get Analysis too.',
      'imageUrl': 'https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/wmsMonitor.png',
      'liveUrl': 'https://play.google.com/store/apps/details?id=com.aqualinkbd.aquaculture_wms',
    },
  ];
  final Map<String, String> skills = const {
    'flutter': 'assets/flutter.svg',
    'dart': 'assets/dart.svg',
    'kotlin': 'assets/kotlin.svg',
    'firebase': 'assets/firebase.svg',
    'c++': 'assets/cpp.svg',
    'nodejs': 'assets/nodejs.svg',
    'mongodb': 'assets/mongodb.svg',
    'docker': 'assets/docker.svg',
    'postgresql': 'assets/postgresql.svg',
    'hive': 'assets/hive.svg',
    'sqlite': 'assets/sqlite.svg',
    'typescript': 'assets/typescript.svg',
    'js': 'assets/javascript.svg',
    'express': 'assets/express.svg',
  };

  Future<void> _sendEmail() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'emondd4@gmail.com',
      queryParameters: {
        'subject': 'Contact Form Submission from $name',
        'body': 'Name: $name\nEmail: $email\nMessage: $message',
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch email client')),
      );
    }
  }

  Future<void> _launchSocialUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void _scrollToTarget(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero).dy;
      final scrollPosition = _scrollController.position;

      _scrollController.animateTo(
        position - scrollPosition.viewportDimension * 0.2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _scrollController.dispose();
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
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    ///AppBar
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth < 900) {
                          return Row(
                            children: [
                              Text(
                                "emondd4",
                                style: GoogleFonts.pacifico(
                                  fontSize: 18.0,
                                  color: AppColors.textBlueColor,
                                ),
                              ),
                              const Spacer(),
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  icon: const Icon(
                                    Icons.menu,
                                    color: AppColors.textBlueColor,
                                    size: 24.0,
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'services',
                                      child: Text(
                                        "SERVICES",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'works',
                                      child: Text(
                                        "WORKS",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'experience',
                                      child: Text(
                                        "EXPERIENCE",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'contact',
                                      child: Text(
                                        "CONTACT ME",
                                        style: GoogleFonts.outfit(
                                          fontSize: 12.0,
                                          color: AppColors.textBlueColor,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    if (value == 'services') {
                                      _scrollToTarget(_serviceKey);
                                    } else if (value == 'works') {
                                      _scrollToTarget(_workKey);
                                    } else if (value == 'experience') {
                                      _scrollToTarget(_experienceKey);
                                    } else if (value == 'contact') {
                                      _scrollToTarget(_contactKey);
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.035),
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
                                  height: callHover ? 40 : 25,
                                  width: callHover ? 40 : 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: callHover ? AppColors.textLightBlueColor : Colors.white,
                                    boxShadow: callHover
                                        ? [
                                      BoxShadow(
                                        color: AppColors.textLightBlueColor.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ]
                                        : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  duration: const Duration(milliseconds: 300),
                                  child: Icon(
                                    size: 16.0,
                                    Icons.phone_forwarded_rounded,
                                    color: callHover ? Colors.white : AppColors.textLightBlueColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Row(
                            children: [
                              Text(
                                "emondd4",
                                style: GoogleFonts.pacifico(
                                  fontSize: 22.0,
                                  color: AppColors.textBlueColor,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  _scrollToTarget(_serviceKey);
                                },
                                child: Text(
                                  "SERVICES",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.0,
                                    color: AppColors.textBlueColor,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.015),
                              GestureDetector(
                                onTap: () {
                                  _scrollToTarget(_workKey);
                                },
                                child: Text(
                                  "SKILLS",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.0,
                                    color: AppColors.textBlueColor,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.015),
                              GestureDetector(
                                onTap: () {
                                  _scrollToTarget(_workKey);
                                },
                                child: Text(
                                  "WORKS",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.0,
                                    color: AppColors.textBlueColor,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.015),
                              GestureDetector(
                                onTap: () {
                                  _scrollToTarget(_experienceKey);
                                },
                                child: Text(
                                  "EXPERIENCE",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.0,
                                    color: AppColors.textBlueColor,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              SizedBox(width: MediaQuery.sizeOf(context).width * 0.015),
                              GestureDetector(
                                onTap: () {
                                  _scrollToTarget(_contactKey);
                                },
                                child: Text(
                                  "CONTACT ME",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.0,
                                    color: AppColors.textBlueColor,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    "+8801676079239",
                                    style: GoogleFonts.outfit(
                                      fontSize: 14.0,
                                      color: AppColors.textBlueColor,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
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
                                      height: callHover ? 55 : 40,
                                      width: callHover ? 55 : 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: callHover ? AppColors.textLightBlueColor : Colors.white,
                                        boxShadow: callHover
                                            ? [
                                          BoxShadow(
                                            color: AppColors.textLightBlueColor.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 0),
                                          ),
                                        ]
                                            : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 1,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      duration: const Duration(milliseconds: 300),
                                      child: Icon(
                                        Icons.phone_forwarded_rounded,
                                        color: callHover ? Colors.white : AppColors.textLightBlueColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      },
                    ),

                    /// Intro
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
                            Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.5,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(8.0),child: Image.asset("assets/picofme.png"),))
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
                            Container(
                                height: MediaQuery.sizeOf(context).height * 0.5,
                                width: MediaQuery.sizeOf(context).height * 0.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: ClipRRect(borderRadius: BorderRadius.circular(8.0),child: Image.asset("assets/picofme.png"),))
                          ],
                        );
                      }
                    }),

                    ///Services
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      key: _serviceKey,
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
                              width: MediaQuery.sizeOf(context).width * 0.8,
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
                              width: MediaQuery.sizeOf(context).width * 0.8,
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
                              width: MediaQuery.sizeOf(context).width * 0.8,
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

                    ///Skills
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      key: _skillsKey,
                      child: Text(
                        "SKILLS",
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
                    Wrap(
                      spacing: 8.0, // Horizontal space between chips
                      runSpacing: 8.0, // Vertical space between rows
                      children: skills.entries.map((entry) => Chip(
                        avatar: SvgPicture.asset(
                          entry.value,
                          width: 36,
                          height: 36,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        label: Text(
                          entry.key,
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textBlueColor,
                          ),
                        ),
                        backgroundColor: AppColors.yellowBackground,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      )).toList(),
                    ),

                    /// Workings
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      key: _workKey,
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
                            child: CardItem(item: items[index],));
                        },
                      )
                          : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return CardItem(item: items[index],);
                        },
                      );
                    }),

                    /// Experience
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      key: _experienceKey,
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

                    /// Contact Me
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.10,
                    ),
                    Center(
                      key: _contactKey,
                      child: Text(
                        "CONTACT WITH ME",
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
                    LayoutBuilder(
                builder: (context, constraints) {
                  return constraints.maxWidth > 600
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Side: Social Media Icons
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon(
                              FontAwesomeIcons.linkedin,
                              'https://www.linkedin.com/in/emondd4/',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.facebook,
                              'https://www.facebook.com/emon.dd4/',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.instagram,
                              'https://www.instagram.com/emon.dd4/',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.hackerrank,
                              'https://www.hackerrank.com/profile/emondd4',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.code,
                              'https://leetcode.com/u/emondd4/',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.github,
                              'https://github.com/emondd4',
                            ),
                            const SizedBox(height: 20),
                            _buildSocialIcon(
                              FontAwesomeIcons.stackOverflow,
                              'https://stackoverflow.com/users/13304913/emon-hossain-munna',
                            ),
                          ],
                        ),
                      ),
                      // Divider
                      const VerticalDivider(
                        width: 32,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      // Right Side: Contact Form
                      Expanded(
                        flex: 2,
                        child: _buildContactForm(),
                      ),
                    ],
                  )
                      : Column(
                    children: [
                      // Social Media Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialIcon(
                            FontAwesomeIcons.linkedin,
                            'https://www.linkedin.com/in/emondd4/',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.facebook,
                            'https://www.facebook.com/emon.dd4/',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.instagram,
                            'https://www.instagram.com/emon.dd4/',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.hackerrank,
                            'https://www.hackerrank.com/profile/emondd4',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.code,
                            'https://www.leetcode.com/u/emondd4/',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.github,
                            'https://github.com/emondd4',
                          ),
                          _buildSocialIcon(
                            FontAwesomeIcons.stackOverflow,
                            'https://stackoverflow.com/users/13304913/emon-hossain-munna',
                          ),
                        ],
                      ),
                      // Divider
                      const Divider(
                        height: 32,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      // Contact Form
                      _buildContactForm(),
                    ],
                  );
                },
              ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    bool isHovered = false; // Track hover state

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: GestureDetector(
            onTap: () => _launchSocialUrl(url),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              transform: isHovered ? Matrix4.identity().scaled(1.2) : Matrix4.identity(),
              transformAlignment: Alignment.center,
              child: FaIcon(
                icon,
                size: isHovered ? 38 : 28, // Size changes on hover
                color: isHovered ? AppColors.textLightBlueColor : AppColors.textBlueColor, // Color changes on hover
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in Touch',
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textBlueColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Feel free to send me a message! I\'ll get back to you as soon as possible.',
          style: GoogleFonts.outfit(
            fontSize: 12,
            color: AppColors.textLightBlueColor,
          ),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Your Email',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _messageController,
          decoration: const InputDecoration(
            labelText: 'Your Message',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2),
            ),
          ),
          maxLines: 4,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _sendEmail,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textBlueColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text(
            'Get Connected',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

}


