import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/theme/hex_color.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final bool? showVisibility;
  final VoidCallback? onTap;
  final bool? enable;
  final bool keyboardNumber;
  final bool isDate;
  final int maxLines; // Changed to int and set a default value

  const   CustomTextField(
      {super.key,
        this.keyboardNumber = false,
        this.enable = true,
        this.labelText,
        this.isDate = false,
        required this.controller,
        this.onTap,
        this.hintText,
        this.showVisibility = false,
        this.maxLines = 1,
        this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText ?? "", style: context.bodyMedium),
          SizedBox(
            height: widget.maxLines > 1 ? 100.h : 45.h,
            child: TextFormField(
              readOnly: widget.isDate ? true : false,
              enabled: widget.enable,
              onTap: widget.onTap,
              obscureText: widget.showVisibility! ? !obscure : false,
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.keyboardNumber ? TextInputType.number : null,
              style: context.bodyMedium!.copyWith(color: Colors.black54),
              decoration: InputDecoration(
                hintText: widget.hintText ?? "",
                contentPadding: const EdgeInsets.all(8).r,
                suffixIcon: widget.isDate
                    ? GestureDetector(
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1960),
                        lastDate: DateTime.now())
                        .then((value) {
                      if (value != null) {
                        widget.controller.text =
                            value.toString().substring(0, 10);
                      }
                    });
                  },
                  child: const Icon(
                    Icons.arrow_drop_down_circle,
                    color: HexColor.secondaryColor,
                  ),
                )
                    : widget.showVisibility!
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    !obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 27,
                  ),
                )
                    : null,
              ),
              validator: widget.validator,
              maxLines: widget.showVisibility! ? 1 : widget.maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
