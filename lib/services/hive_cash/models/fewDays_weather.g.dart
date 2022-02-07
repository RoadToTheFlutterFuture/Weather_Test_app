// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fewDays_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FewDaysWeatherAdapter extends TypeAdapter<FewDaysWeather> {
  @override
  final int typeId = 1;

  @override
  FewDaysWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FewDaysWeather(
      forecastByDay: (fields[0] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FewDaysWeather obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.forecastByDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FewDaysWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
