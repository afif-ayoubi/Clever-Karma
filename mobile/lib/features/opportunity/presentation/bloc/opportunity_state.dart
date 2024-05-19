part of 'opportunity_bloc.dart';

sealed class OpportunityState extends Equatable {
  const OpportunityState();
  @override
  List<Object> get props => [];
}

final class OpportunityInitial extends OpportunityState {

}


final class OrganizationInitial extends OpportunityState {

}

final class LoadingOpportunitiesState extends OpportunityState {
}

final class ErrorOpportunitiesState extends OpportunityState {
  final String message;

  const ErrorOpportunitiesState({required this.message});

  @override
  List<Object> get props => [];
}

final class LoadedOpportunitiesState extends OpportunityState {
  final List<Opportunity> opportunities;

  const LoadedOpportunitiesState({required this.opportunities});

  @override
  List<Object> get props => [opportunities];
}

