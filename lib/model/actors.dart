class Actor {
  int? id;
  String? name;
  String? dob;
  List<dynamic>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<dynamic>? appearance;
  String? portrayed;
  List<dynamic>? better_call_saul_appearance;

  Actor(
      {this.id,
      this.name,
      this.dob,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.better_call_saul_appearance});

  factory Actor.fromPayload(Map<String, dynamic> payload) {
    return Actor(
        id: payload['id'] ?? 0,
        name: payload['name'] ?? "",
        dob: payload['dob'] ?? "",
        occupation: payload['occupation'] ?? [],
        img: payload['img'],
        status: payload['status'] ?? "",
        nickname: payload['nickname'] ?? "",
        appearance: payload['appearance'] ?? [],
        portrayed: payload['portrayed'] ?? "",
        better_call_saul_appearance:
            payload['better_call_saul_appearance'] ?? []);
  }
}
