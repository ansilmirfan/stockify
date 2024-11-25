// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListModelAdapter extends TypeAdapter<WatchListModel> {
  @override
  final int typeId = 0;

  @override
  WatchListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchListModel(
      symbol: fields[1] as String,
      companyName: fields[3] as String,
      currency: fields[2] as String,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, WatchListModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.currency)
      ..writeByte(3)
      ..write(obj.companyName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
