// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeTableAdapter extends TypeAdapter<RecipeTable> {
  @override
  final int typeId = 1;

  @override
  RecipeTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeTable(
      analyzedInstructions:
          (fields[14] as List?)?.cast<AnalyzedInstructionsTable>(),
      creditsText: fields[0] as String?,
      license: fields[1] as String?,
      sourceName: fields[2] as String?,
      pricePerServing: fields[3] as double?,
      id: fields[4] as int?,
      title: fields[5] as String?,
      readyInMinutes: fields[6] as int?,
      servings: fields[7] as int?,
      sourceUrl: fields[8] as String?,
      image: fields[9] as String?,
      imageType: fields[10] as String?,
      summary: fields[11] as String?,
      instructions: fields[12] as String?,
      originalId: fields[13] as int?,
      spoonacularSourceUrl: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeTable obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.creditsText)
      ..writeByte(1)
      ..write(obj.license)
      ..writeByte(2)
      ..write(obj.sourceName)
      ..writeByte(3)
      ..write(obj.pricePerServing)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.readyInMinutes)
      ..writeByte(7)
      ..write(obj.servings)
      ..writeByte(8)
      ..write(obj.sourceUrl)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.imageType)
      ..writeByte(11)
      ..write(obj.summary)
      ..writeByte(12)
      ..write(obj.instructions)
      ..writeByte(13)
      ..write(obj.originalId)
      ..writeByte(14)
      ..write(obj.analyzedInstructions)
      ..writeByte(15)
      ..write(obj.spoonacularSourceUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
