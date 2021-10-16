// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MenuItemAdapter extends TypeAdapter<MenuItem> {
  @override
  final int typeId = 0;

  @override
  MenuItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MenuItem(
      isFeatured: fields[3] as bool?,
      id: fields[4] as int,
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      category: fields[2] as String,
      group: fields[5] as String,
      price: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MenuItem obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.isFeatured)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.group)
      ..writeByte(6)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
