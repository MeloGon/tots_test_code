import 'package:tost_test_code/features/home/domain/entities/client_entity.dart';

class ClientModel extends ClientEntity {
  ClientModel(
      {super.id,
      super.firstname,
      super.lastname,
      super.email,
      super.address,
      super.photo,
      super.caption,
      super.createdAt,
      super.updatedAt,
      super.userId});

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: (json['id'] as num).toInt(),
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      address: json['address'],
      photo: json['photo'],
      caption: json['caption'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      userId: (json['user_id'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'address': address,
      'photo': photo,
      'caption': caption,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
    };
  }
}
