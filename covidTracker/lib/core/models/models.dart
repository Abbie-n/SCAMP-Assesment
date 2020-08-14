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

class CountriesModel {
  String country;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  CountriesModel(
      {this.country,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  CountriesModel.json(Map<String, dynamic> json) {
    country = json['Country'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Country'] = this.country;
    data['NewConfirmed'] = this.newConfirmed;
    data['TotalConfirmed'] = this.totalConfirmed;
    data['NewDeaths'] = this.newDeaths;
    data['TotalDeaths'] = this.totalDeaths;
    data['NewRecovered'] = this.newRecovered;
    data['TotalRecovered'] = this.totalRecovered;

    return data;
  }
}

// class SummaryModel {
//   GlobalStatsModel global;
//   List<CountriesModel> countries;

//   SummaryModel({this.global, this.countries});

//   SummaryModel.fromJson(Map<String, dynamic> json) {
//     global = json['Global'] != null
//         ? new GlobalStatsModel.fromJson(json['Global'])
//         : null;
//     if (json['Countries'] != null) {
//       countries = new List<CountriesModel>();
//       json['Countries'].forEach((v) {
//         countries.add(CountriesModel.json(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.global != null) {
//       data['Global'] = this.global.toJson();
//     }
//     if (this.countries != null) {
//       data['Countries'] = this.countries.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class NewsModel {
  String title;
  String description;
  String url;
  String urlImage;
  String time;
  String content;

  NewsModel(
      {this.title,
      this.description,
      this.url,
      this.urlImage,
      this.time,
      this.content});
  NewsModel.json(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlImage = json['urlToImage'];
    time = json['publishedAt'];
    content = json['content'];
  }
}
