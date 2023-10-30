// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyzed_instructions_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyzedInstructionsTableAdapter
    extends TypeAdapter<AnalyzedInstructionsTable> {
  @override
  final int typeId = 2;

  @override
  AnalyzedInstructionsTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyzedInstructionsTable(
      steps: (fields[0] as List?)?.cast<StepTable>(),
    );
  }

  @override
  void write(BinaryWriter writer, AnalyzedInstructionsTable obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyzedInstructionsTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
