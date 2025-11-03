// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../livro_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Livro _$LivroFromJson(Map<String, dynamic> json) => Livro(
  nomeLivro: json['nomeLivro'] as String,
  capitulo: (json['capitulo'] as List<dynamic>)
      .map((e) => Capitulo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LivroToJson(Livro instance) => <String, dynamic>{
  'nomeLivro': instance.nomeLivro,
  'capitulo': instance.capitulo.map((e) => e.toJson()).toList(),
};
