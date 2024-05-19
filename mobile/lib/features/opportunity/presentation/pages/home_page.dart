import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';
import '../bloc/opportunity_bloc.dart';
import '../widgets/entry_page/home_page/lighted_backround.dart';
import '../widgets/entry_page/home_page/opportunity_view.dart';
import '../widgets/entry_page/home_page/page_indicators.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> roomSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    super.initState();
    controller.addListener(pageListener);
    context.read<OpportunityBloc>().add(GetOpportunitiesEvent());
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Gap(140.h),
              Text("Select Your Cause",
                  style: context.displayLarge!.copyWith(
                      fontWeight: FontWeightManager.regular,
                      fontSize: FontSize.s30)),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    BlocBuilder<OpportunityBloc, OpportunityState>(
                      builder: (context, state) {
                        if (state is LoadingOpportunitiesState) {
                          return const Center(child: LoadingWidget());
                        } else if (state is ErrorOpportunitiesState) {
                          return Center(child: Text(state.message));
                        } else if (state is LoadedOpportunitiesState) {
                          return OpportunityView(
                            pageNotifier: pageNotifier,
                            roomSelectorNotifier: roomSelectorNotifier,
                            controller: controller,
                            opportunities: state.opportunities,
                          );
                        } else {
                          return Container(); // Handle any other unexpected state if necessary
                        }
                      },
                    ),
                    BlocBuilder<OpportunityBloc, OpportunityState>(
                      builder: (context, state) {
                        if (state is LoadedOpportunitiesState)
                          return Positioned.fill(
                            top: null,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50).r,
                              child: Column(
                                children: [
                                  PageIndicators(
                                    roomSelectorNotifier: roomSelectorNotifier,
                                    pageNotifier: pageNotifier,
                                    opportunities: state.opportunities,
                                  ),
                                ],
                              ),
                            ),
                          );
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
