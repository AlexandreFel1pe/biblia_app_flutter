import 'package:json_annotation/json_annotation.dart';

part 'g_models/versiculo_service_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Versiculo {
  final int numeroVersiculo;
  final String textoVersiculo;

  Versiculo({required this.numeroVersiculo, required this.textoVersiculo});

  factory Versiculo.fromJson(Map<String, dynamic> json) => _$VersiculoFromJson(json);

  Map<String, dynamic> toJson() => _$VersiculoToJson(this);
}