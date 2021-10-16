// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BagItemAdapter extends TypeAdapter<BagItem> {
  @override
  final int typeId = 1;

  @override
  BagItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BagItem(
      qty: fields[6] as int,
      id: fields[5] as int,
      name: fields[0] as String,
      imageUrl: fields[3] as String,
      price: fields[4] as int,
      group: fields[1] as String,
      category: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BagItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.group)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BagItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
