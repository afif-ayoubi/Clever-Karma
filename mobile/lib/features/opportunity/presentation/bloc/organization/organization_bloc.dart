import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  OrganizationBloc() : super(OrganizationInitial()) {
    on<OrganizationEvent>((event, emit) {
    });
  }
}
