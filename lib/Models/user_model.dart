class Users {
  String? uid;
  String? dateOfBirth;
  String? occupation;
  String? name;
  String? gender;
  bool? perm;

  Users({
    this.uid,
    this.dateOfBirth,
    this.occupation,
    this.name,
    this.gender,
    this.perm,
  });

  Users.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    dateOfBirth = json['dateOfBirth'];
    occupation = json['occupation'];
    name = json['name'];
    gender = json['gendeer'];
    perm = json['perm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['dateOfBirth'] = dateOfBirth;
    data['occupation'] = occupation;
    data['name'] = name;
    data['gender'] = gender;
    data['perm'] = perm;
    return data;
  }
}
