// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CocktailAdapter extends TypeAdapter<Cocktail> {
  @override
  final int typeId = 0;

  @override
  Cocktail read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cocktail(
      title: fields[0] as String,
      thumbnailUrl: fields[1] as String,
      difficulty: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cocktail obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.thumbnailUrl)
      ..writeByte(2)
      ..write(obj.difficulty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CocktailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
