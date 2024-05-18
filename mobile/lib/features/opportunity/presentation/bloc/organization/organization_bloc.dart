import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile/features/opportunity/domain/entities/opportunity.dart';

import '../../../../../core/constants/failure.dart';
import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_opportunity.dart';

part 'organization_event.dart';

part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final GetOpportunityUseCase getOpportunityUseCase;

  OrganizationBloc({required this.getOpportunityUseCase})
      : super(OrganizationInitial()) {
    on<OrganizationEvent>((event, emit) async{
      if (event is GetOpportunitiesEvent) {
        emit(LoadingOpportunitiesState());
        final result = await getOpportunityUseCase();
        emit(_mapFailureOrPostsToState(result));

      }
    });
  }
}

OrganizationState _mapFailureOrPostsToState(
    Either<Failure, List<Opportunity>> either) {
  return either.fold(
        (failure) =>
        ErrorOpportunitiesState(message: _mapFailureToMessage(failure)),
        (opportunities) =>
        LoadedOpportunitiesState(
          opportunities: opportunities,
        ),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}