// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepTableAdapter extends TypeAdapter<StepTable> {
  @override
  final int typeId = 3;

  @override
  StepTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StepTable(
      number: fields[0] as int?,
      step: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StepTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
