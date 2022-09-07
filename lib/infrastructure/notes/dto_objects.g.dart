// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItemDto _$$_TodoItemDtoFromJson(Map<String, dynamic> json) =>
    _$_TodoItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$$_TodoItemDtoToJson(_$_TodoItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDone': instance.isDone,
    };

_$_NoteDto _$$_NoteDtoFromJson(Map<String, dynamic> json) => _$_NoteDto(
      body: json['body'] as String,
      color: json['color'] as int,
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeStamp:
          const TimestampConverter().fromJson(json['timeStamp'] as Timestamp),
    );

Map<String, dynamic> _$$_NoteDtoToJson(_$_NoteDto instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'timeStamp': const TimestampConverter().toJson(instance.timeStamp),
    };
