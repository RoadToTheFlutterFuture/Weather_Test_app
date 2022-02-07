// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodayWeatherAdapter extends TypeAdapter<TodayWeather> {
  @override
  final int typeId = 0;

  @override
  TodayWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodayWeather(
      bigIcon: fields[0] as String,
      cityTitle: fields[1] as String,
      tempTitle: fields[2] as String,
      humidity: fields[3] as String,
      precipitations: fields[4] as String,
      pressure: fields[5] as String,
      windSpeed: fields[6] as String,
      windDirection: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TodayWeather obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.bigIcon)
      ..writeByte(1)
      ..write(obj.cityTitle)
      ..writeByte(2)
      ..write(obj.tempTitle)
      ..writeByte(3)
      ..write(obj.humidity)
      ..writeByte(4)
      ..write(obj.precipitations)
      ..writeByte(5)
      ..write(obj.pressure)
      ..writeByte(6)
      ..write(obj.windSpeed)
      ..writeByte(7)
      ..write(obj.windDirection);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodayWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
