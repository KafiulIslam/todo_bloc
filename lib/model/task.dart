import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String title;
  final String description;
  final String id;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;

  Task(
      {required this.title,
      required this.description,
      required this.id,
      required this.date,
      this.isDone,
      this.isDeleted,
      this.isFavourite}) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith(
      {String? title,
      String? description,
      String? id,
      String? date,
      bool? isDone,
      bool? isDeleted, bool? isFavourite}) {
    return Task(
        title: title ?? this.title,
        description: description ?? this.description,
        id: id ?? this.id,
        date: date ?? this.date,
        isDone: isDone ?? this.isDone,
        isDeleted: isDeleted ?? isDeleted,
        isFavourite: isFavourite ?? this.isFavourite);
  }

  Map<dynamic, dynamic> toMap() {
    return {
      title: title,
      description: description,
      id: id,
      date: date,
      isDone: isDone,
      isDeleted: isDeleted,
      isFavourite: isFavourite
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'],
        description: map['description'],
        id: map['id'],
        date: map['date'],
        isDone: map['isDone'],
        isDeleted: map['isDeleted'],
        isFavourite: map['isFavourite']);
  }

  @override
  List<Object?> get props =>
      [title, description, id, date, isDone, isDeleted, isFavourite];
}
