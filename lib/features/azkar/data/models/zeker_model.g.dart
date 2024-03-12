// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zeker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZekrAdapter extends TypeAdapter<Zekr> {
  @override
  final int typeId = 0;

  @override
  Zekr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Zekr(
      id: fields[0] as int?,
      category: fields[2] as String,
      count: fields[3] as String,
      description: fields[4] as String,
      reference: fields[5] as String,
      zekr: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Zekr obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.reference)
      ..writeByte(6)
      ..write(obj.zekr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZekrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
