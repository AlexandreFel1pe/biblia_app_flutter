import 'package:biblia/services/models/versiculo_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'g_models/capitulo_service_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Capitulo {
  final int numeroCapitulo;
  final List<Versiculo> versiculo;

  Capitulo({required this.numeroCapitulo, required this.versiculo});

  factory Capitulo.fromJson(Map<String, dynamic> json) => _$CapituloFromJson(json);

  Map<String, dynamic> toJson() => _$CapituloToJson(this);
}