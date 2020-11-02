newsfromJson(Map<String, dynamic> json) {
  List<News> news = [];
  if (json['News'] != null) {
    news = new List<News>();
    json['News'].forEach((v) {
      news.add(new News.fromJson(v));
    });
  }
  return news;
}

class News {
  int id;
  String title;
  String description;
  String imageUrl;
  String type;
  String fullArticleLink;
  String fullArticleName;
  String date;
  String videoUrl;

  News(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.type,
      this.fullArticleLink,
      this.fullArticleName,
      this.date,
      this.videoUrl});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    fullArticleLink = json['fullArticleLink'];
    fullArticleName = json['fullArticleName'];
    date = json['date'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['type'] = this.type;
    data['fullArticleLink'] = this.fullArticleLink;
    data['fullArticleName'] = this.fullArticleName;
    data['date'] = this.date;
    data['videoUrl'] = this.videoUrl;
    return data;
  }
}
