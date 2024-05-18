// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrganizationAdapter extends TypeAdapter<Organization> {
  @override
  final int typeId = 1;

  @override
  Organization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Organization(
      id: fields[0] as int?,
      firstName: fields[1] as String,
      lastName: fields[2] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      aboutUs: fields[5] as String,
      howToVolunteer: fields[6] as String,
      image: fields[7] as String,
      liveStreamingId: fields[8] as String,
      LiveStreamingIsActivated: fields[9] as bool,
      opportunity: fields[10] as Opportunity,
    );
  }

  @override
  void write(BinaryWriter writer, Organization obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.aboutUs)
      ..writeByte(6)
      ..write(obj.howToVolunteer)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.liveStreamingId)
      ..writeByte(9)
      ..write(obj.LiveStreamingIsActivated)
      ..writeByte(10)
      ..write(obj.opportunity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrganizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
