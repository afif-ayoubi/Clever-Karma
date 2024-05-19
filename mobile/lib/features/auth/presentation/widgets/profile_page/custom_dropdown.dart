import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomDropDown extends StatefulWidget {
   CustomDropDown({
    Key? key,
    required this.value,
    required this.list,
    required this.hint,
    required this.labelText,
    this.onChanged,
  }) : super(key: key);

  final String hint;
 String? value;
  final List<String> list;
  final String? labelText;
  final ValueChanged<String?>? onChanged; // Added onChanged parameter

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText ?? "", style: context.bodyMedium),
        DropdownButtonHideUnderline(
          child: SizedBox(
            height: 45.h,
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 200.h,
              validator: (value) {
                if (value == null) {
                  return 'Please select an option';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(6, 10, 13, 10).r,
              ),
              icon: const Icon(
                Icons.arrow_drop_down_circle,
                color: HexColor.secondaryColor,
              ),
              hint: Text(
                widget.hint,
                style: context.bodyMedium!.copyWith(color: HexColor.textInputColor),
              ),
              style: context.bodyMedium!.copyWith(color: Colors.black54),
              value: widget.value,
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  widget.value = value;
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
