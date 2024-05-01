import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_btn.dart';
import '../common_widgets/app_bar.dart';
import '../common_widgets/custom_textfield.dart';
import 'custom_dropdown.dart';

class ProfileDetailWidget extends StatefulWidget {
  const ProfileDetailWidget({super.key});

  @override
  State<ProfileDetailWidget> createState() => _ProfileDetailWidgetState();
}

class _ProfileDetailWidgetState extends State<ProfileDetailWidget> {
  File? _image;
  final ImagePicker picker = ImagePicker();
  List<String> genderList = ['male', 'female'];
  String? gender;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

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
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              const Align(alignment: Alignment.topLeft, child: CustomAppBar()),
              Gap(35.h),
              GestureDetector(
                onTap: () async {
                  await getImage();
                },
                child: Container(
                  height: 160.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.r),
                    border: Border.all(color: HexColor.borderColor),
                  ),
                  child: _image == null
                      ? Icon(
                          CupertinoIcons.person,
                          size: 140.r,
                          color: HexColor.lightColor,
                        )
                      : Image.file(_image!), // Changed FaIcon to Icon
                ),
              ),
              Gap(25.h),
              _fieldSection(),
            ],
          ),
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
            hintText: 'John',
            controller: _firstNameController,
            labelText: 'First Name',
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'Doe',
            controller: _lastNameController,
            labelText: 'Last Name',
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'john@gmail.com',
            controller: _emailController,
            labelText: 'Email',
          ),
          Gap(10.h),
          CustomDropDown(
            hint: "gender",
            labelText: "Gender",
            list: genderList,
            value: gender,
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'Date of Birth',
            controller: _dateController,
            labelText: 'Date of Birth',
            isDate: true,
          ),
          Gap(10.h),
          CustomTextField(
            hintText: '961 81305090',
            controller: _phoneController,
            labelText: 'Phone Number',
          ),
          Gap(25.h),
          CustomBtn(
            text: "Save",
            onPressed: () {},
            width: true,
          ),
          Gap(40.h)
        ],
      ),
    );
  }
}
