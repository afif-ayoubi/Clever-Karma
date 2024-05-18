import '../../domain/entities/opportunity.dart';

class OpportunityModel extends Opportunity {
  OpportunityModel({
    super.id,
    required super.name,
    required super.imageUrl,
    required super.description,
  });

  factory OpportunityModel.fromJson(Map<String, dynamic> json) {
    return OpportunityModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  OpportunityModel.fromOpportunity(Opportunity opportunity)
      : super(
          id: opportunity.id,
          name: opportunity.name,
          imageUrl: opportunity.imageUrl,
          description: opportunity.description,
        );
}
