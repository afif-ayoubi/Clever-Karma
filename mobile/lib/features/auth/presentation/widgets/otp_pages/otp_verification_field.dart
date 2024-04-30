import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpVerificationField extends StatefulWidget {
  final ValueChanged<String>? onOtpEntered;

  const OtpVerificationField({super.key, this.onOtpEntered});

  @override
  State<OtpVerificationField> createState() => _OtpVerificationFieldState();
}

class _OtpVerificationFieldState extends State<OtpVerificationField> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 45.w,
          height: 45.h,
          margin: EdgeInsets.only(right: 30.r),
          child: TextFormField(
            style: theme.bodyLarge,
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < 3) {
                  _focusNodes[index + 1].requestFocus();
                  String otp =
                      _controllers.map((controller) => controller.text).join();
                  widget.onOtpEntered?.call(otp);
                } else {
                  String otp =
                      _controllers.map((controller) => controller.text).join();
                  widget.onOtpEntered?.call(otp);
                  _focusNodes[index].unfocus();

                }
              } else {
                if (index > 0) {
                  _focusNodes[index - 1].requestFocus();
                }
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8).r,
            ),
          ),
        );
      }),
    );
  }
}
