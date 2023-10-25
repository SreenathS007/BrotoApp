// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserdataModalAdapter extends TypeAdapter<UserdataModal> {
  @override
  final int typeId = 3;

  @override
  UserdataModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserdataModal(
      username: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      cnfmpassword: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserdataModal obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.cnfmpassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserdataModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
