import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/core/api/providers/single_organization.dart';
import 'package:mobile/core/api/update_org_api.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:provider/provider.dart';

import '../../../../../core/api/providers/loader_provider.dart';
import '../../../../../core/theme/hex_color.dart';
import '../../../../auth/presentation/widgets/common_widgets/custom_btn.dart';
import '../../../../auth/presentation/widgets/common_widgets/custom_textfield.dart';
import '../../../../opportunity/domain/repositories/organization.dart';

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
  Organization user = Organization(
      id: '',
      name: '',
      email: '',
      aboutUs: '',
      howToVolunteer: '',
      imageUrl: '',
      longitude: 0,
      latitude: 0,
      liveStreamingId: '');

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

  Future<void> _callApi() async {
    user = Provider
        .of<OrganizationProvider>(context, listen: false)
        .organizations!;

    setState(() {
      _firstNameController.text = user.name ?? "";
      _lastNameController.text = user.name ?? "";
      _emailController.text = user.email;
      _aboutUsController.text = user.aboutUs ?? "";
      _howToVolunteerController.text = user.howToVolunteer;
    });
  }

  @override
  void initState() {
    super.initState();
    _callApi();
  }

  String _getFirstTwoWords(String name) {
    List<String> words = name.split(' ');
    if (words.length <= 2) {
      return name;
    } else {
      return '${words[0]} ${words[1]}';
    }
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
                  _getFirstTwoWords(user.name ?? ""),
                  style: context.displayMedium,
                ),
                CustomBtn(
                  text: "Save",
                  onPressed: () async {
                    Provider.of<LoaderProvider>(context, listen: false)
                        .setLoader(true);
                    await UpdateOrgApi(user.email, user.name, user.aboutUs,
                        user.howToVolunteer, context);
                    Provider.of<LoaderProvider>(context, listen: false)
                        .setLoader(false);
                  },
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
                        ? (user.imageUrl != null && user.imageUrl.isNotEmpty
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(40.0).r,
                      child: Image.network(
                        user.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Icon(
                      CupertinoIcons.person,
                      size: 60.r,
                      color: HexColor.lightColor,
                    ))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(40.0).r,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
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
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          CustomTextField(
            controller: _firstNameController,
            labelText: 'First Name',
            onChanged: (value) {
              setState(() {
                user.name = value;
              });
            },
          ),
          Gap(10.h),
          Gap(10.h),
          CustomTextField(
            controller: _emailController,
            labelText: 'Email',
            onChanged: (value) {
              setState(() {
                user.email = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            controller: _aboutUsController,
            labelText: 'About Us',
            maxLines: 4,
            onChanged: (value) {
              setState(() {
                user.aboutUs = value;
              });
            },
          ),
          Gap(10.h),
          CustomTextField(
            controller: _howToVolunteerController,
            labelText: 'How to Volunteer',
            maxLines: 4,
            onChanged: (value) {
              setState(() {
                user.howToVolunteer =
                    value;
              });
            },
          ),
        ],
      ),
    );
  }
}
