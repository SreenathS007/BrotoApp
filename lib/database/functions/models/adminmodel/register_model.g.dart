// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegisterModelAdapter extends TypeAdapter<RegisterModel> {
  @override
  final int typeId = 1;

  @override
  RegisterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegisterModel(
      name: fields[1] as String,
      age: fields[2] as String,
      phone: fields[3] as String,
      address: fields[4] as String,
      photo: fields[5] as String,
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RegisterModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}