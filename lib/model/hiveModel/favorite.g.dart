// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteHiveNewModelAdapter extends TypeAdapter<FavoriteHiveNewModel> {
  @override
  final int typeId = 2;

  @override
  FavoriteHiveNewModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteHiveNewModel(
      favoretModelMap: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteHiveNewModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.favoretModelMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteHiveNewModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
