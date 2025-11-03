// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../capitulo_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Capitulo _$CapituloFromJson(Map<String, dynamic> json) => Capitulo(
  numeroCapitulo: (json['numeroCapitulo'] as num).toInt(),
  versiculo: (json['versiculo'] as List<dynamic>)
      .map((e) => Versiculo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CapituloToJson(Capitulo instance) => <String, dynamic>{
  'numeroCapitulo': instance.numeroCapitulo,
  'versiculo': instance.versiculo.map((e) => e.toJson()).toList(),
};
