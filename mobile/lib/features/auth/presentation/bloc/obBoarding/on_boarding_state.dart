import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentIndex;

  OnboardingState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
