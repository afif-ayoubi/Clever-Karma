part of 'organization_bloc.dart';

abstract class OrganizationState extends Equatable {
  const OrganizationState();
  @override
  List<Object> get props => [];
}

final class OrganizationInitial extends OrganizationState {
  @override
  List<Object> get props => [];
}
final class LoadingOpportunitiesState extends OrganizationState {}
final class ErrorOpportunitiesState extends OrganizationState {
  final String message;
  const ErrorOpportunitiesState({required this.message});
  @override
  List<Object> get props => [];
}

final class LoadedOpportunitiesState extends OrganizationState {
final List<Opportunity>  opportunities;
const LoadedOpportunitiesState({required this.opportunities});
  @override
  List<Object> get props => [opportunities];
}