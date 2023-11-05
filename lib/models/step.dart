
class StepRecipe {
  final int? number;
  final String? step;


  StepRecipe({
    this.number,
    this.step,

  });

  factory StepRecipe.fromJson(Map<String, dynamic> json) {


    return StepRecipe(
      number: json['number']??0,
      step: json['step']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'step': step,

    };
  }

  @override
  String toString() {
    return 'Step('
        'number: $number, '
        'step: $step)';
  }
}