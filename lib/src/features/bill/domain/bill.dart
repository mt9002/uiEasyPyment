import 'package:first_app/src/features/bill/domain/personal_expenser.dart';

class Bill {
  final int ?id;
  final String event;
  final String mesa;
  final List<PersonalExpenses> ?personalExpenses;

  Bill({
    this.id,
    required this.event,
    required this.mesa,
    this.personalExpenses,
  });

  get getId => id;
  get getEvent => event;
  get getMesa => mesa;

  Bill.empty()
      : id = 0,
        event = '',
        mesa = '',
        personalExpenses = [];

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'] as int, 
      event: json['event'] as String,
      mesa: json['mesa'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event': event,
      'mesa': mesa,
    };
  }

  // Método para crear una copia de la instancia con propiedades modificadas
  Bill copyWith({
    int? id,
    String? event,
    String? mesa,
    List<PersonalExpenses>? personalExpenses,
  }) {    return Bill(
      id: id ?? this.id,
      event: event ?? this.event,
      mesa: mesa ?? this.mesa,
      personalExpenses: personalExpenses ?? this.personalExpenses,
    );
  }

  @override
  String toString() {
    return 'Bill(id: $id, event: $event, mesa: $mesa, personalExpenses: $personalExpenses)';
  }

}
