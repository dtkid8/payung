// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_explore.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeExploreAdapter extends TypeAdapter<HomeExplore> {
  @override
  final int typeId = 0;

  @override
  HomeExplore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeExplore(
      name: fields[0] as String,
      price: fields[1] as double,
      discountPercentage: fields[2] as int,
      image: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HomeExplore obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.discountPercentage)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeExploreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
