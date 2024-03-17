// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salat_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalatEntityAdapter extends TypeAdapter<SalatEntity> {
  @override
  final int typeId = 3;

  @override
  SalatEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SalatEntity(
      fajr: fields[0] as String,
      sunrise: fields[1] as String,
      dhuhr: fields[2] as String,
      asr: fields[3] as String,
      sunset: fields[4] as String,
      maghrib: fields[5] as String,
      isha: fields[6] as String,
      dateTime: fields[7] as String,
      jihri: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SalatEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.fajr)
      ..writeByte(1)
      ..write(obj.sunrise)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.sunset)
      ..writeByte(5)
      ..write(obj.maghrib)
      ..writeByte(6)
      ..write(obj.isha)
      ..writeByte(7)
      ..write(obj.dateTime)
      ..writeByte(8)
      ..write(obj.jihri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalatEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
