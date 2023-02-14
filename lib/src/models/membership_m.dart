import 'dart:convert';

class TicketType {
    TicketType({
        required this.type,
    });

    final String type;

    factory TicketType.fromRawJson(String str) => TicketType.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TicketType.fromJson(Map<String, dynamic> json) => TicketType(
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
    };
}
