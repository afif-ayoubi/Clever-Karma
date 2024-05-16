import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';

import '../../../../../core/theme/hex_color.dart';
import '../../../../auth/presentation/widgets/common_widgets/custom_btn.dart';
import '../../../../auth/presentation/widgets/common_widgets/custom_textfield.dart';

class OrgProfileDetailWidget extends StatefulWidget {
  const OrgProfileDetailWidget({super.key});

  @override
  State<OrgProfileDetailWidget> createState() => _OrgProfileDetailWidgetState();
}

class _OrgProfileDetailWidgetState extends State<OrgProfileDetailWidget> {
  File? _image;
  final ImagePicker picker = ImagePicker();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _aboutUsController = TextEditingController();
  final TextEditingController _howToVolunteerController =
      TextEditingController();

  Future<void> getImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Red Cross',
                  style: context.displayMedium,
                ),
                CustomBtn(
                  text: "Save",
                  onPressed: () {},
                  width: true,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await getImage();
                  },
                  child: Container(
                    height: 100.h,
                    width: 100.w,
                    margin: EdgeInsets.only(top: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                      border: Border.all(color: HexColor.borderColor),
                    ),
                    child: _image == null
                        ? Icon(
                            CupertinoIcons.person,
                            size: 60.r,
                            color: HexColor.lightColor,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40.0).r,
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                Text(
                  'Blood Donation',
                  style: context.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ),
              ],
            ),
            Gap(25.h),
            _fieldSection()
          ],
        ),
      ),
    );
  }

  Widget _fieldSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
      child: Column(
        children: [
          CustomTextField(
            controller: _firstNameController,
            labelText: 'First Name',
          ),
          Gap(10.h),
          CustomTextField(
            controller: _lastNameController,
            labelText: 'Last Name',
          ),
          Gap(10.h),
          CustomTextField(
            controller: _emailController,
            labelText: 'Email',
          ),
          Gap(10.h),
          CustomTextField(
            controller: _aboutUsController,
            labelText: 'AboutUs',
            maxLines: 4,
          ),
          Gap(10.h),
          CustomTextField(
            controller: _howToVolunteerController,
            labelText: 'How to Volunteer',
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
