// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addres.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssressHiveAdapter extends TypeAdapter<AssressHive> {
  @override
  final int typeId = 3;

  @override
  AssressHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AssressHive(
      address: (fields[0] as Map)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AssressHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssressHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
