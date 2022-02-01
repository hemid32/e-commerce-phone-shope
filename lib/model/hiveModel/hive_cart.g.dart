// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartHiveAdapter extends TypeAdapter<CartHive> {
  @override
  final int typeId = 1;

  @override
  CartHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartHive(
      modelCart: (fields[0] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.modelCart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
