import 'package:flutter/material.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';

class FollowedOrganizationsProvider extends ChangeNotifier {
  List<Organization> _followedOrganizations = [];

  List<Organization> get followedOrganizations => _followedOrganizations;

  void followOrganization(Organization organization) {
    _followedOrganizations.add(organization);
    print(followedOrganizations.length  );
    notifyListeners();
  }

  void unfollowOrganization(Organization organization) {
    _followedOrganizations.removeWhere((org) => org.id == organization.id);
    print(followedOrganizations.length  );
    notifyListeners();
  }

  bool isOrganizationFollowed(Organization organization) {
    return _followedOrganizations.any((org) => org.id == organization.id);
  }
}
