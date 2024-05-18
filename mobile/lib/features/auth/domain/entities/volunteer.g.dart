// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolunteerAdapter extends TypeAdapter<Volunteer> {
  @override
  final int typeId = 0;

  @override
  Volunteer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Volunteer(
      user: fields[0] as User,
      dateOfBirth: fields[1] as DateTime?,
      phoneNumber: fields[4] as int?,
      fcmToken: fields[2] as String?,
      gender: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Volunteer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.dateOfBirth)
      ..writeByte(2)
      ..write(obj.fcmToken)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolunteerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
