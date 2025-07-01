
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:portfolio/model/WorkingBaseModel.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  final scrollController = ScrollController();
  final serviceKey = GlobalKey();
  final skillsKey = GlobalKey();
  final workKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();
  final isCallHovered = false.obs;
  Rx<WorkingBaseModel> items = WorkingBaseModel().obs;
  final isLoading = true.obs;
  final dio = Dio();

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

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    scrollController.dispose();
    dio.close();
    super.onClose();
  }

  Future<void> fetchItems() async {
    try {
      isLoading.value = true;
      final response = await dio.get('https://raw.githubusercontent.com/emondd4/portfolio_flutter/refs/heads/master/assets/workings.json');
      if (response.statusCode == 200) {
        //debugPrint("Response data: ${response.data.runtimeType} - ${response.data}");
        if (response.data != null) {
          items.value =  WorkingBaseModel.fromJson(jsonDecode(response.data));
        } else {
          debugPrint("Error: Unexpected JSON structure");
        }
      } else {
        debugPrint("Error: Failed to load Projects - Status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: Failed to load Projects: $e");
      //Get.snackbar('Error', 'Failed to load projects: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendEmail(BuildContext context) async {
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      Get.snackbar('Error', 'Please fill out all fields');
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
      Get.snackbar('Error', 'Could not launch email client');
    }
  }

  Future<void> launchSocialUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not launch $url');
    }
  }

  void scrollToTarget(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero).dy;
      final scrollPosition = scrollController.position;

      scrollController.animateTo(
        position - scrollPosition.viewportDimension * 0.2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}