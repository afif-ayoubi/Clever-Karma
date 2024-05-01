import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.value,
    required this.list,
    this.lockIcon = false,
    this.textCenter=false,
  });
  final String? value;
  final List<String> list;
  final bool lockIcon;
  final bool textCenter;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: SizedBox(
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
