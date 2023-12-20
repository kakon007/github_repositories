import 'package:bs23_flutter_task_101/view/home/home_controller.dart';
import 'package:bs23_flutter_task_101/view/home/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
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
                  borderColor: Colors.white,
                  onChanged: (value) {
                    _homeViewController.indexSortBy.value = value;
                    setState(() {
                      _homeViewController
                          .getRefreshData()
                          .then((value) => Get.back());
                    });
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
                  borderColor: Colors.white,
                  onChanged: (value) {
                    _homeViewController.indexSortBy.value = value;
                    setState(() {
                      _homeViewController
                          .getRefreshData()
                          .then((value) => Get.back());
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }
}
