import 'package:bs23_flutter_task_101/utils/colors_utils.dart';
import 'package:bs23_flutter_task_101/view/home/home_controller.dart';
import 'package:bs23_flutter_task_101/view/home/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({super.key});

  final HomeViewController _homeViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 130,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: MyRadioButtonBorder(
                  value: 0,
                  groupValue: _homeViewController.indexSortBy.value,
                  label: _homeViewController.listofSortingNames[0],
                  borderColor: _homeViewController.indexSortBy.value == 0
                      ? ColorUtils.blue700
                      : ColorUtils.grey200,
                  onChanged: (value) {
                    _homeViewController.indexSortBy.value = value;
                    _homeViewController
                        .getRefreshData()
                        .then((value) => Get.back());
                  },
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: MyRadioButtonBorder(
                  value: 1,
                  groupValue: _homeViewController.indexSortBy.value,
                  label: _homeViewController.listofSortingNames[1],
                  borderColor: _homeViewController.indexSortBy.value == 1
                      ? ColorUtils.blue700
                      : ColorUtils.grey200,
                  onChanged: (value) {
                    _homeViewController.indexSortBy.value = value;

                    _homeViewController
                        .getRefreshData()
                        .then((value) => Get.back());
                  },
                ),
              )
            ],
          ),
        ));
  }
}
