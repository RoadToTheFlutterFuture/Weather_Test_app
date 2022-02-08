// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_by_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastByDayAdapter extends TypeAdapter<ForecastByDay> {
  @override
  final int typeId = 2;

  @override
  ForecastByDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastByDay(
      date: fields[0] as String,
      time: fields[1] as String,
      description: fields[2] as String,
      icon: fields[12] as String,
      parameter: fields[3] as String,
      snowPrecipitations: (fields[10] as Map).cast<dynamic, dynamic>(),
      rainPrecipitations: (fields[11] as Map).cast<dynamic, dynamic>(),
      humidity: fields[4] as num,
      cloudiness: fields[5] as num,
      temp: fields[6] as num,
      pressure: fields[7] as num,
      windDirection: fields[8] as num,
      windSpeed: fields[9] as num,
    );
  }

  @override
  void write(BinaryWriter writer, ForecastByDay obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.parameter)
      ..writeByte(4)
      ..write(obj.humidity)
      ..writeByte(5)
      ..write(obj.cloudiness)
      ..writeByte(6)
      ..write(obj.temp)
      ..writeByte(7)
      ..write(obj.pressure)
      ..writeByte(8)
      ..write(obj.windDirection)
      ..writeByte(9)
      ..write(obj.windSpeed)
      ..writeByte(10)
      ..write(obj.snowPrecipitations)
      ..writeByte(11)
      ..write(obj.rainPrecipitations)
      ..writeByte(12)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastByDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
