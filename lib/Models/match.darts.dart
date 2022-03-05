class MatchDetails{
  String? name;
  String? job;
  String? age;
  String? location;
  String? matchCriteria;
  String? video;

  MatchDetails({this.name, this.job,this.age, this.location, this.matchCriteria, this.video});

  static final matchDetails = [
    MatchDetails(name: 'Samatha', age: '22', job: 'Developer', location: 'Ikeja',
      matchCriteria: '96', video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',),
    MatchDetails(name: 'Jane', age: '27', job: 'Marketer', location: 'Ikeja',
      matchCriteria: '85', video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',),
    MatchDetails(name: 'Sarah', age: '32', job: 'Teacher', location: 'Ikeja',
      matchCriteria: '85', video: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',),
  ];
}