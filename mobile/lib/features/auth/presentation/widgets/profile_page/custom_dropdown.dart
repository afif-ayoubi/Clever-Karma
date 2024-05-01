import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.value,
    this.hint,
    required this.list,
    this.bankCardStyle = false,
    required this.width,
    this.lockIcon = false,
    required this.isDate,
    this.textCenter=false,
  });
  final String? value;
  final List<String> list;
  final double width;
  final bool isDate;
  final bool lockIcon;
  final bool textCenter;
  final bool bankCardStyle;
  final String? hint;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: SizedBox(
        width: widget.width,
        height: 45.h,
        child: DropdownButtonFormField<String>(
          menuMaxHeight: 200.h,

          validator: (value) {
            if (value == null) {
              return null;
            }
            return null;
          },


          // iconSize: 17.r,
          // iconEnabledColor: HexColor.primaryColor,
          // iconDisabledColor: HexColor.primaryColor,
          // icon: iconStyle(false),
          value: widget.value,
          items: widget.list.map<DropdownMenuItem<String>>((String? value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text('\t ${value!}'),
            );
          }).toList(),
          onChanged: (value) => setState(() {
            widget.value != value;
          }),
        ),
      ),
    );
  }
}
