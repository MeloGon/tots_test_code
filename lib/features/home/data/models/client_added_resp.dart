class ClientAddedResp {
  String? id;

  ClientAddedResp({
    this.id,
  });

  factory ClientAddedResp.fromJson(Map<String, dynamic> json) =>
      ClientAddedResp(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
