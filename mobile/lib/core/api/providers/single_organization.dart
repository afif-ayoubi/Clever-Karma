import 'package:flutter/cupertino.dart';

import '../../../features/opportunity/domain/repositories/organization.dart';

class OrganizationProvider with ChangeNotifier {
  Organization? _organization;

  Organization? get organizations => _organization;

  void addOrganization(Organization organization) {
    _organization = organization;
    notifyListeners();
  }
}