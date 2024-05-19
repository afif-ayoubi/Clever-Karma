import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/constants/failure.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/opportunity.dart';
import '../../domain/usecases/get_opportunity.dart';

part 'opportunity_event.dart';
part 'opportunity_state.dart';

class OpportunityBloc extends Bloc<OpportunityEvent, OpportunityState> {
  final GetOpportunityUseCase getOpportunityUseCase;

  OpportunityBloc({required this.getOpportunityUseCase}) : super(OpportunityInitial()) {
    on<OpportunityEvent>((event, emit) async{
      if (event is GetOpportunitiesEvent) {
        emit(LoadingOpportunitiesState());
        final result = await getOpportunityUseCase();
        emit(_mapFailureOrPostsToState(result));

      }
    });
  }
}
OpportunityState _mapFailureOrPostsToState(
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