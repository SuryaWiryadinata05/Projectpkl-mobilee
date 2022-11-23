import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final int icon;
  final String color;
  final String? date;
  final String? dateline;
  final String? deskripsi;
  final List<dynamic>? todos;

  const Task(
      {required this.title,
      required this.icon,
      required this.color,
      required this.date,
      required this.dateline,
      required this.deskripsi,
      this.todos});

  Task copyWith({
    String? title,
    int? icon,
    String? color,
    String? date,
    String? dateline,
    String? deskripsi,
    List<dynamic>? todos,
  }) =>
      Task(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        todos: todos ?? this.todos,
        date: date ?? this.date,
        dateline: dateline ?? this.dateline,
        deskripsi: deskripsi ?? this.deskripsi
      );

  factory Task.fromjson(Map<String, dynamic> json) => Task(
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        date: json['date'],
        dateline: json['dateline'],
        deskripsi: json['deskripsi'],
        todos: json['todos'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'color': color,
        'date': date,
        'dateline': dateline,
        'deskripsi': deskripsi,
        'todos': todos,
      };

  @override
  List<Object?> get props => [title, icon, color, date, dateline,deskripsi];
}
