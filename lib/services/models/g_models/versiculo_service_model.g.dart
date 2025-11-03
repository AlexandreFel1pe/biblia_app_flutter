// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../versiculo_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Versiculo _$VersiculoFromJson(Map<String, dynamic> json) => Versiculo(
  numeroVersiculo: (json['numeroVersiculo'] as num).toInt(),
  textoVersiculo: json['textoVersiculo'] as String,
);

Map<String, dynamic> _$VersiculoToJson(Versiculo instance) => <String, dynamic>{
  'numeroVersiculo': instance.numeroVersiculo,
  'textoVersiculo': instance.textoVersiculo,
};
