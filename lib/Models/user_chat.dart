import 'package:meta/meta.dart';

import '../Util/utils.dart';

class UserField {
  // ignore: prefer_const_declarations
  static final String lastMessageTime = 'lastMessageTime';
}

class UserChat {
  final String? idUser;
  final String? name;
  final String? urlAvatar;
  final DateTime? lastMessageTime;

  const UserChat({
    this.idUser,
    @required this.name,
    @required this.urlAvatar,
    @required this.lastMessageTime,
  });

  UserChat copyWith({
    String? idUser,
    String? name,
    String? urlAvatar,
    String? lastMessageTime,
  }) =>
      UserChat(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        urlAvatar: urlAvatar ?? this.urlAvatar,
        lastMessageTime: lastMessageTime as DateTime,
      );

  static UserChat fromJson(Map<String, dynamic> json) => UserChat(
        idUser: json['idUser'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
        lastMessageTime: Utils.toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessageTime': Utils.fromDateTimeToJson(lastMessageTime!),
      };
}
