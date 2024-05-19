import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/api/providers/loader_provider.dart';
import 'package:mobile/core/api/providers/notification_provider.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/api/get_notification_api.dart';
import '../../../../core/theme/hex_color.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../../../auth/presentation/widgets/common_widgets/app_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    _refreshNotifications();
  }

  Future<void> _refreshNotifications() async {
    Provider.of<LoaderProvider>(context, listen: false)
        .setLoader(true);
    await GetNotifications(context);
    Provider.of<LoaderProvider>(context, listen: false)
        .setLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    final loading = Provider.of<LoaderProvider>(context, listen: true).loading;
    final list = Provider.of<NotificationsProvider>(context).notifications;

    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 23.w, top: 39.h),
                      child: Row(
                        children: [
                          CustomAppBar(),
                          Padding(
                            padding: EdgeInsets.only(left: 70.w),
                            child: Text(
                              "Notifications",
                              style: context.displayMedium!
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 58.h,
                    ),
                    Gap(23.h),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final notification = list[index];
                            final title = notification.title;
                            final body = notification.body;
                            final sentAt = notification.sent_at;
                            final dateParts = sentAt.split('T');
                            final datePart = dateParts[0];
                            if (title.isNotEmpty) {
                              return Center(
                                child: Container(
                                  height: 100.h,
                                  width: 327.w,
                                  decoration: BoxDecoration(
                                    color: HexColor.primaryColor,
                                    borderRadius: BorderRadius.circular(23.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.w, top: 12.h, right: 45.w),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 22.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  title,
                                                  style: context.bodyMedium!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeightManager
                                                                  .semiBold),
                                                ),
                                                Text(
                                                  datePart,
                                                  style: context.bodyMedium!
                                                      .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 14.sp),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 22.w),
                                            child: Text(
                                              body,
                                              style: context.bodyMedium!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontSize: 14.sp),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                height: 16.h,
                              ),
                          itemCount: list.length),
                    )
                  ],
                ),
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
}
