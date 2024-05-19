part of 'opportunity_bloc.dart';

sealed class OpportunityEvent extends Equatable {
  const OpportunityEvent();
}

class GetOpportunitiesEvent extends OpportunityEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}