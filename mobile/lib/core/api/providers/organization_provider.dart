import 'package:flutter/cupertino.dart';
import 'package:mobile/features/opportunity/domain/repositories/organization.dart';

class OrganizationsProvider with ChangeNotifier {
  List<Organization> _organizations = [];
  List<Organization> _filteredOrganizations = [];

  List<Organization> get organizations => _filteredOrganizations.isEmpty ? _organizations : _filteredOrganizations;

  void addOrganization(Organization organization) {
    _organizations.add(organization);
    notifyListeners();
  }

  void removeOrganization(Organization organization) {
    _organizations.remove(organization);
    notifyListeners();
  }

  void setOrganizations(List<Organization> organizations) {
    _organizations = organizations;
    notifyListeners();
  }

  void searchOrganizations(String query) {
    if (query.isEmpty) {
      _filteredOrganizations = [];
    } else {
      _filteredOrganizations = _organizations.where((org) {
        return org.name.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
    }
    print('Filtered Organizations: $_filteredOrganizations');

    notifyListeners();
  }
}
