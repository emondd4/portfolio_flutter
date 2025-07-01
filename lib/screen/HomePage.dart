import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/HomeController.dart';
import 'package:portfolio/screen/CardItem.dart';
import 'package:portfolio/screen/JobTimeline.dart';
import 'package:portfolio/utils/AppColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return _HomeView();
  }
}

class _HomeView extends GetView<HomeController> {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowBackground,
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.035),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.offWhiteBackground,
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.035),
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    _buildAppBar(context),
                    _buildIntro(context),
                    _buildServices(context),
                    _buildSkills(context),
                    _buildWorkings(context),
                    _buildExperience(context),
                    _buildContact(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 900) {
          return Row(
            children: [
              Text("emondd4", style: GoogleFonts.pacifico(fontSize: 18.0, color: AppColors.textBlueColor)),
              const Spacer(),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.menu, color: AppColors.textBlueColor, size: 24.0),
                  items: [
                    _buildDropdownItem('services', 'SERVICES'),
                    _buildDropdownItem('works', 'WORKS'),
                    _buildDropdownItem('experience', 'EXPERIENCE'),
                    _buildDropdownItem('contact', 'CONTACT ME'),
                  ],
                  onChanged: (value) => controller.scrollToTarget({
                    'services': controller.serviceKey,
                    'works': controller.workKey,
                    'experience': controller.experienceKey,
                    'contact': controller.contactKey,
                  }[value]!),
                ),
              ),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.035),
              _buildCallButton(context),
            ],
          );
        }
        return Row(
          children: [
            Text("emondd4", style: GoogleFonts.pacifico(fontSize: 22.0, color: AppColors.textBlueColor)),
            const Spacer(),
            ...['SERVICES', 'SKILLS', 'WORKS', 'EXPERIENCE', 'CONTACT ME'].asMap().entries.map((entry) {
              final keys = [controller.serviceKey, controller.skillsKey, controller.workKey, controller.experienceKey, controller.contactKey];
              return Padding(
                padding: EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.015),
                child: GestureDetector(
                  onTap: () => controller.scrollToTarget(keys[entry.key]),
                  child: Text(entry.value, style: GoogleFonts.outfit(fontSize: 14.0, color: AppColors.textBlueColor, letterSpacing: 1.5)),
                ),
              );
            }),
            const Spacer(),
            Row(
              children: [
                Text("+8801676079239", style: GoogleFonts.outfit(fontSize: 14.0, color: AppColors.textBlueColor, letterSpacing: 1.5)),
                const SizedBox(width: 10.0),
                _buildCallButton(context),
              ],
            ),
          ],
        );
      },
    );
  }

  DropdownMenuItem<String> _buildDropdownItem(String value, String text) {
    return DropdownMenuItem(
      value: value,
      child: Text(text, style: GoogleFonts.outfit(fontSize: 12.0, color: AppColors.textBlueColor, letterSpacing: 1.5)),
    );
  }

  Widget _buildCallButton(BuildContext context) {
    return Obx(() => InkWell(
          onHover: (value) => controller.isCallHovered.value = value,
          onTap: () => controller.launchSocialUrl("tel://+8801676079239"),
          child: AnimatedContainer(
            height: controller.isCallHovered.value ? 40 : 25,
            width: controller.isCallHovered.value ? 40 : 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: controller.isCallHovered.value ? AppColors.textLightBlueColor : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: controller.isCallHovered.value ? AppColors.textLightBlueColor.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            duration: const Duration(milliseconds: 300),
            child: Icon(
              Icons.phone_forwarded_rounded,
              size: 16.0,
              color: controller.isCallHovered.value ? Colors.white : AppColors.textLightBlueColor,
            ),
          ),
        ));
  }

  Widget _buildIntro(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        LayoutBuilder(builder: (context, constraint) {
          final isSmallScreen = constraint.maxWidth < 600;
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isSmallScreen ? "Hey There,\nI'm Emon" : "Hey There,\nI'm Hossain Emon",
                      style: GoogleFonts.permanentMarker(fontSize: isSmallScreen ? 36.0 : 40.0, color: AppColors.textBlueColor),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                    Text(
                      "I Love to Develop Applications in Different Language,\nAnd I Love What I Do",
                      style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Text("4", style: GoogleFonts.outfit(fontSize: isSmallScreen ? 46.0 : 50.0, color: AppColors.textBlueColor)),
                        const SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Years", style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor)),
                            Text("Experience", style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (isSmallScreen) const SizedBox(width: 15.0),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: isSmallScreen ? MediaQuery.sizeOf(context).width * 0.3 : MediaQuery.sizeOf(context).height * 0.5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                child: ClipRRect(borderRadius: BorderRadius.circular(8.0), child: Image.asset("assets/picofme.png")),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildServices(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Center(
          key: controller.serviceKey,
          child: Text(
            "SERVICES",
            style: GoogleFonts.outfit(fontSize: 32.0, fontWeight: FontWeight.bold, textStyle: const TextStyle(letterSpacing: 1.5, decoration: TextDecoration.underline)),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        LayoutBuilder(builder: (context, constraints) {
          final isSmallScreen = constraints.maxWidth < 600;
          final services = [
            {'title': 'Website Design', 'count': '1 Projects'},
            {'title': 'Mobile Application', 'count': '12 Projects'},
            {'title': 'Web Application', 'count': 'Learning Phase'},
          ];

          return isSmallScreen
              ? Column(
                  children: [
                    ...services
                        .asMap()
                        .entries
                        .map((entry) => Padding(
                              padding: EdgeInsets.only(bottom: entry.key < services.length - 1 ? MediaQuery.sizeOf(context).height * 0.03 : 0),
                              child: _buildServiceCard(context, services[entry.key]['title']!, services[entry.key]['count']!),
                            ))
                        .toList(),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                    ),
                    _buildServiceDescription(context, isSmallScreen),
                  ],
                )
              : Row(
                  children: [
                    Column(
                      children: services
                          .asMap()
                          .entries
                          .map((entry) => Padding(
                                padding: EdgeInsets.only(bottom: entry.key < services.length - 1 ? MediaQuery.sizeOf(context).height * 0.03 : 0),
                                child: _buildServiceCard(context, services[entry.key]['title']!, services[entry.key]['count']!, width: MediaQuery.sizeOf(context).width * 0.4),
                              ))
                          .toList(),
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width * 0.03,),
                    Expanded(child: _buildServiceDescription(context, isSmallScreen)),
                  ],
                );
        }),
      ],
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, String count, {double? width}) {
    return Container(
      width: width ?? MediaQuery.sizeOf(context).width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(radius: 25.0, backgroundColor: AppColors.textBlueColor, child: const Icon(Icons.web, color: Colors.white)),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(count, style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.normal)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDescription(BuildContext context, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("What do I help?", style: GoogleFonts.outfit(fontSize: 32.0, color: AppColors.textBlueColor, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10.0),
          Text(
            "As a passionate Software Developer, I specialize in building world-class applications that blend performance, scalability, and intuitive design. With professional experience in Flutter (Mobile & Web) and Kotlin, I help businesses and teams craft seamless cross-platform experiences that users love.",
            style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10.0),
          Text(
            "Currently expanding my backend expertise with Node.js, I aim to become a full-stack problem-solver who can take an idea from concept to production-ready application.",
            style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatColumn("15+", "Project Completed", isSmallScreen),
              _buildStatColumn("700+", "Happy Clients", isSmallScreen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String number, String label, bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(number, style: GoogleFonts.outfit(fontSize: isSmallScreen ? 28.0 : 32.0, color: AppColors.textBlueColor, fontWeight: FontWeight.bold)),
        Text(label, style: GoogleFonts.outfit(fontSize: isSmallScreen ? 12.0 : 16.0, color: AppColors.textBlueColor, fontWeight: FontWeight.normal)),
      ],
    );
  }

  Widget _buildSkills(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Center(
          key: controller.skillsKey,
          child: Text(
            "SKILLS",
            style: GoogleFonts.outfit(fontSize: 32.0, fontWeight: FontWeight.bold, textStyle: const TextStyle(letterSpacing: 1.5, decoration: TextDecoration.underline)),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: controller.skills.entries.map((entry) => Chip(
                avatar: SvgPicture.asset(
                  entry.value,
                  width: 36,
                  height: 36,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.white, size: 36),
                ),
                label: Text(entry.key, style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textBlueColor)),
                backgroundColor: AppColors.yellowBackground,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )).toList(),
        ),
      ],
    );
  }

  Widget _buildWorkings(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Center(
          key: controller.workKey,
          child: Text(
            "WORKINGS",
            style: GoogleFonts.outfit(fontSize: 32.0, fontWeight: FontWeight.bold, textStyle: const TextStyle(letterSpacing: 1.5, decoration: TextDecoration.underline)),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(builder: (context, constraint) {
                return constraint.maxWidth < 600
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.items.value.data?.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CardItem(item: controller.items.value.data![index]),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.items.value.data?.length,
                        itemBuilder: (context, index) => CardItem(item: controller.items.value.data![index]),
                      );
              })),
      ],
    );
  }

  Widget _buildExperience(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Center(
          key: controller.experienceKey,
          child: Text(
            "EXPERIENCE",
            style: GoogleFonts.outfit(fontSize: 32.0, fontWeight: FontWeight.bold, textStyle: const TextStyle(letterSpacing: 1.5, decoration: TextDecoration.underline)),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        const JobTimeLine(),
      ],
    );
  }

  Widget _buildContact(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        Center(
          key: controller.contactKey,
          child: Text(
            "CONTACT WITH ME",
            style: GoogleFonts.outfit(fontSize: 32.0, fontWeight: FontWeight.bold, textStyle: const TextStyle(letterSpacing: 1.5, decoration: TextDecoration.underline)),
          ),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
        LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth > 600
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildSocialIcons(context,constraints)),
                      const VerticalDivider(width: 32, thickness: 1, color: Colors.grey),
                      Expanded(flex: 2, child: _buildContactForm(context)),
                    ],
                  )
                : Column(
                    children: [
                      _buildSocialIcons(context,constraints),
                      const Divider(height: 32, thickness: 1, color: Colors.grey),
                      _buildContactForm(context),
                    ],
                  );
          },
        ),
      ],
    );
  }

  Widget _buildSocialIcons(BuildContext context, BoxConstraints constraints) {
    final socialLinks = [
      {'icon': FontAwesomeIcons.linkedin, 'url': 'https://www.linkedin.com/in/emondd4/'},
      {'icon': FontAwesomeIcons.facebook, 'url': 'https://www.facebook.com/emon.dd4/'},
      {'icon': FontAwesomeIcons.instagram, 'url': 'https://www.instagram.com/emon.dd4/'},
      {'icon': FontAwesomeIcons.hackerrank, 'url': 'https://www.hackerrank.com/profile/emondd4'},
      {'icon': FontAwesomeIcons.code, 'url': 'https://leetcode.com/u/emondd4/'},
      {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/emondd4'},
      {'icon': FontAwesomeIcons.stackOverflow, 'url': 'https://stackoverflow.com/users/13304913/emon-hossain-munna'},
    ];

    return constraints.maxWidth > 600
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialLinks
                .asMap()
                .entries
                .map((entry) => Padding(
                      padding: EdgeInsets.only(bottom: entry.key < socialLinks.length - 1 ? 20 : 0),
                      child: _buildSocialIcon(entry.value['icon'] as IconData, entry.value['url'] as String),
                    ))
                .toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: socialLinks.map((link) => _buildSocialIcon(link['icon']! as IconData, link['url']! as String)).toList(),
          );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    final isHovered = false.obs;
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: () => controller.launchSocialUrl(url),
        child: Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(8),
              transform: isHovered.value ? Matrix4.identity().scaled(1.2) : Matrix4.identity(),
              transformAlignment: Alignment.center,
              child: FaIcon(
                icon,
                size: isHovered.value ? 38 : 28,
                color: isHovered.value ? AppColors.textLightBlueColor : AppColors.textBlueColor,
              ),
            )),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Get in Touch', style: GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textBlueColor)),
        const SizedBox(height: 16),
        Text(
          'Feel free to send me a message! I\'ll get back to you as soon as possible.',
          style: GoogleFonts.outfit(fontSize: 12, color: AppColors.textLightBlueColor),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: controller.nameController,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2)),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller.emailController,
          decoration: const InputDecoration(
            labelText: 'Your Email',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2)),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller.messageController,
          decoration: const InputDecoration(
            labelText: 'Your Message',
            labelStyle: TextStyle(color: AppColors.textLightBlueColor),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.textLightBlueColor, width: 2)),
          ),
          maxLines: 4,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => controller.sendEmail(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textBlueColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(double.infinity, 50),
          ),
          child: const Text('Get Connected', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}