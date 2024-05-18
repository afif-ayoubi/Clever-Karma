import 'package:flutter_bloc/flutter_bloc.dart';
import 'on_boarding_event.dart';
import 'on_boarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentIndex: 0)) {
    on<IncrementIndex>((event, emit) {
      if (state.currentIndex < 2) {
        emit(OnboardingState(currentIndex: state.currentIndex + 1));
      } else {
      }
    });
  }
}
