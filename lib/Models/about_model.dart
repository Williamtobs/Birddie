import 'dart:io';

class AboutModels {
  String? uid;
  String? stateOfOrigin;
  String? occupation;
  String? region;
  String? area;
  String? lookingFor;
  String? alcohol;
  String? smoke;
  File? video;
  String? videoPath;
  File? image;

  AboutModels(
      {this.uid,
      this.stateOfOrigin,
      this.occupation,
      this.region,
      this.area,
      this.lookingFor,
      this.alcohol,
      this.smoke,
      this.video,
      this.videoPath,
      this.image});

  AboutModels.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    stateOfOrigin = json['stateOfOrigin'];
    occupation = json['occupation'];
    region = json['region'];
    area = json['area'];
    lookingFor = json['lookingFor'];
    alcohol = json['alcohol'];
    smoke = json['smoke'];
    video = json['video'];
    videoPath = json['videoPath'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['stateOfOrigin'] = stateOfOrigin;
    data['occupation'] = occupation;
    data['region'] = region;
    data['area'] = area;
    data['lookingFor'] = lookingFor;
    data['alcohol'] = alcohol;
    data['smoke'] = smoke;
    data['video'] = video;
    data['videoPath'] = videoPath;
    data['image'] = image;
    return data;
  }
}
