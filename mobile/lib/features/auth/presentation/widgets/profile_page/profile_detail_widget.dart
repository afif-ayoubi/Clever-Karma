import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/api/providers/user_provider.dart';
import 'package:mobile/core/theme/hex_color.dart';
import 'package:mobile/features/auth/data/models/user_model.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_btn.dart';
import 'package:provider/provider.dart';
import '../../../../../core/api/get_user_api.dart';
import '../../../../../core/api/providers/loader_provider.dart';
import '../../../../../core/api/providers/notification_provider.dart';
import '../../../../../core/wdigets/loading_widget.dart';
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

  UserModel user = UserModel(email: '', password: '');

  @override
  void initState() {
    super.initState();
    _callApi();
  }

  Future<void> _callApi() async {
    Provider.of<LoaderProvider>(context, listen: false).setLoader(true);
    await GetUser(context);
    Provider.of<LoaderProvider>(context, listen: false).setLoader(false);
    user = Provider.of<UserProvider>(context, listen: false).User!;
    setState(() {
      _firstNameController.text = user.firstName ?? "";
      _lastNameController.text = user.lastName ?? "";
      _emailController.text = user.email;
      _phoneController.text = user.phoneNumber ?? "";
      _dateController.text = user.dateOfBirth ?? '';
      gender = user.gender ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoaderProvider>(context, listen: true).loading;
    final list = Provider.of<UserProvider>(context).User;
    return Stack(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.topLeft, child: CustomAppBar()),
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
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(80.0).r,
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Gap(25.h),
                  _fieldSection(),
                ],
              ),
            ),
          ),
        ),
        if (loading)
          Container(
            color: Colors.black54.withOpacity(0.7),
            height: double.infinity,
            width: 100.sw,
            child: LoadingWidget(),
          )
      ],
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
            onChanged: (value) {
              setState(() {
                user.firstName = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'Doe',
            controller: _lastNameController,
            labelText: 'Last Name',
            onChanged: (value) {
              setState(() {
                user.lastName = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'john@gmail.com',
            controller: _emailController,
            labelText: 'Email',
            onChanged: (value) {
              setState(() {
                user.email = value;
              });
            },
          ),
          Gap(10.h),
          CustomDropDown(
            hint: "gender",
            labelText: "Gender",
            list: genderList,
            value: gender,
            onChanged: (value) {
              setState(() {
                gender = value;
                user.gender = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            hintText: 'Date of Birth',
            controller: _dateController,
            labelText: 'Date of Birth',
            isDate: true,
            onChanged: (value) {
              setState(() {
                user.dateOfBirth = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            hintText: '961 81305090',
            controller: _phoneController,
            labelText: 'Phone Number',
            onChanged: (value) {
              setState(() {
                user.phoneNumber = value;
              });
            },
          ),
          Gap(25.h),
          CustomBtn(
            text: "Save",
            onPressed: () {
              // Save logic here
            },
            width: true,
          ),
          Gap(40.h)
        ],
      ),
    );
  }
}