class Notifications {
  final String title;
  final String body;
  final String sent_at;

  Notifications( {required this.title, required this.body,required this.sent_at,});
  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(

      title: json['title']??'',
      body: json['body']??'', sent_at: json['sent_at']??'' ,
    );
  }
}