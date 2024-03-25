// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moshaf.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoshafAdapter extends TypeAdapter<Moshaf> {
  @override
  final int typeId = 4;

  @override
  Moshaf read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Moshaf(
      id: fields[0] as int?,
      name: fields[1] as String?,
      server: fields[2] as String?,
      surahTotal: fields[3] as int?,
      moshafType: fields[4] as int?,
      surahList: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Moshaf obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.server)
      ..writeByte(3)
      ..write(obj.surahTotal)
      ..writeByte(4)
      ..write(obj.moshafType)
      ..writeByte(5)
      ..write(obj.surahList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoshafAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
