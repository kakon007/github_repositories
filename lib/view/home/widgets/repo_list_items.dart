import 'package:flutter/material.dart';

import '../../../configs/colors_utils.dart';

class RepoListItem extends StatelessWidget {
  const RepoListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade100,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        color: ColorUtils.blue25,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: ColorUtils.blue50)),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: ColorUtils.blue700,
                      size: 15,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Flutter makes it easy and fast to build beautiful apps for mobile and beyond",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: ColorUtils.blue700,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Jahid",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.fork_right_sharp,
                    color: ColorUtils.blue700,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "1000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.star,
                    color: ColorUtils.blue700,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "10000",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    "21-09-2021",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
