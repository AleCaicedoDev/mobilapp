import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperController extends GetxController {
  late PageController pageCobtroller;

  RxInt currentPage = 0.obs;

  goToTab(int page) {
    currentPage.value = page;
    pageCobtroller.jumpToPage(page);
  }

  @override
  void onInit() {
    pageCobtroller = PageController(initialPage: 0);

    super.onInit();
  }

  @override
  void onClose() {
    pageCobtroller.dispose();
    super.onClose();
  }
}
