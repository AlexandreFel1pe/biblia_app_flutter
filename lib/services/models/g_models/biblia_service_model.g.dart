// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../biblia_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Biblia _$BibliaFromJson(Map<String, dynamic> json) => Biblia(
  editora: json['editora'] as String,
  livro: (json['livro'] as List<dynamic>)
      .map((e) => Livro.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BibliaToJson(Biblia instance) => <String, dynamic>{
  'editora': instance.editora,
  'livro': instance.livro.map((e) => e.toJson()).toList(),
};
