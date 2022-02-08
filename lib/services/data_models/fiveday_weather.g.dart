// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fiveday_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FiveDayWeatherAdapter extends TypeAdapter<FiveDayWeather> {
  @override
  final int typeId = 5;

  @override
  FiveDayWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FiveDayWeather(
      fiveDay: (fields[0] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FiveDayWeather obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.fiveDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FiveDayWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
