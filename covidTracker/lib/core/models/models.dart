class GlobalStatsModel {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  GlobalStatsModel(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  GlobalStatsModel.fromJson(Map<String, dynamic> json)
      : newConfirmed = json['NewConfirmed'],
        totalConfirmed = json['TotalConfirmed'],
        newDeaths = json['NewDeaths'],
        totalDeaths = json['TotalDeaths'],
        newRecovered = json['NewRecovered'],
        totalRecovered = json['TotalRecovered'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;

    return data;
  }
}

class CountryStatsModel {
  String country;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  CountryStatsModel(
      {this.country,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});
  CountryStatsModel.json(Map<String, dynamic> json) {
    country = json['Country'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }
}

class NewsModel {
  String title;
  String description;
  String url;
  String urlImage;
  String time;
  String content;

  NewsModel({this.title, this.description, this.url, this.urlImage, this.time, this.content});
  NewsModel.json(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlImage = json['urlToImage'];
    time = json['publishedAt'];
    content = json['content'];
  }
}