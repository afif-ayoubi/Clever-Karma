import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  const CustomTextField(
      {super.key,
      this.keyboardNumber = false,
      this.enable = true,
      this.labelText,
      required this.controller,
      this.onTap,
        this.hintText,
      this.showVisibility = false,
      this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText ?? "", style: theme.bodyMedium),
          SizedBox(
            height: 45.h,
            child: TextFormField(
              enabled: widget.enable,
              onTap: widget.onTap,
              obscureText: widget.showVisibility! ? !obscure : obscure,
              controller: widget.controller,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.keyboardNumber ? TextInputType.number : null,
              style: theme.bodyMedium!.copyWith(color: HexColor.textInputColor),
              decoration: InputDecoration(
                hintText: widget.hintText??"",
                contentPadding: const EdgeInsets.all(8).r,
                suffixIcon: widget.showVisibility!
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
            ),
          ),
        ],
      ),
    );
  }
}
