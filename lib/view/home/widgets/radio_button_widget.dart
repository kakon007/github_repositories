import 'package:bs23_flutter_task_101/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class MyRadioButtonBorder extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic groupValue;
  final Color borderColor;
  final EdgeInsets? itemMargin;
  final Function onChanged;

  const MyRadioButtonBorder(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.label,
      this.itemMargin,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onChanged(value);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: itemMargin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor)),
        child: Row(
          children: [
            Radio<dynamic>(
                activeColor: ColorUtils.blue700,
                value: value,
                visualDensity: const VisualDensity(
                  horizontal: 0.5,
                  vertical: 0,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                groupValue: groupValue,
                onChanged: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onChanged(value);
                }),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
