class movieDataModal {
  double? score;
  Show? show;

  movieDataModal({this.score, this.show});

  movieDataModal.fromJson(Map<String, dynamic> json) {
    score = json['score'] != null ? json['score'].toDouble() : null;
    show = json['show'] != null ? Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (score != null) {
      data['score'] = score;
    }
    if (show != null) {
      data['show'] = show?.toJson();
    }
    return data;
  }
}

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  // ignore: unnecessary_question_mark
  dynamic? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  dynamic? webChannel;
  dynamic? dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? lLinks;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.lLinks,
  });

  Show.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    genres = json['genres'] != null ? List<String>.from(json['genres']) : null;
    status = json['status'];

    // Ensure that both runtime and averageRuntime are handled as integers
    runtime = json['runtime'] != null
        ? (json['runtime'] is double
            ? json['runtime'].toInt()
            : json['runtime'])
        : null;
    averageRuntime = json['averageRuntime'] != null
        ? (json['averageRuntime'] is double
            ? json['averageRuntime'].toInt()
            : json['averageRuntime'])
        : null;

    premiered = json['premiered'];
    ended = json['ended']; // Keep it dynamic if it's null
    officialSite = json['officialSite'];
    schedule =
        json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null;
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    weight = json['weight'] != null
        ? (json['weight'] is double ? json['weight'].toInt() : json['weight'])
        : null;
    network =
        json['network'] != null ? Network.fromJson(json['network']) : null;
    webChannel = json['webChannel']; // Can be null
    dvdCountry = json['dvdCountry']; // Can be null
    externals = json['externals'] != null
        ? Externals.fromJson(json['externals'])
        : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    summary = json['summary'];
    updated = json['updated'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (url != null) data['url'] = url;
    if (name != null) data['name'] = name;
    if (type != null) data['type'] = type;
    if (language != null) data['language'] = language;
    if (genres != null) data['genres'] = genres;
    if (status != null) data['status'] = status;
    if (runtime != null) data['runtime'] = runtime;
    if (averageRuntime != null) data['averageRuntime'] = averageRuntime;
    if (premiered != null) data['premiered'] = premiered;
    if (ended != null) data['ended'] = ended;
    if (officialSite != null) data['officialSite'] = officialSite;
    if (schedule != null) data['schedule'] = schedule?.toJson();
    if (rating != null) data['rating'] = rating!.toJson();
    if (weight != null) data['weight'] = weight;
    if (network != null) data['network'] = network!.toJson();
    if (webChannel != null) data['webChannel'] = webChannel;
    if (dvdCountry != null) data['dvdCountry'] = dvdCountry;
    if (externals != null) data['externals'] = externals!.toJson();
    if (image != null) data['image'] = image!.toJson();
    if (summary != null) data['summary'] = summary;
    if (updated != null) data['updated'] = updated;
    if (lLinks != null) data['_links'] = lLinks!.toJson();
    return data;
  }
}

class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  Schedule.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    days = json['days'] != null ? List<String>.from(json['days']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (time != null) data['time'] = time;
    if (days != null) data['days'] = days;
    return data;
  }
}

class Rating {
  int? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    // Ensure proper handling of double to int conversion
    average = json['average'] != null
        ? (json['average'] is double
            ? json['average'].toInt()
            : json['average'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (average != null) data['average'] = average;
    return data;
  }
}

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  Network.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    officialSite = json['officialSite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (country != null) data['country'] = country!.toJson();
    if (officialSite != null) data['officialSite'] = officialSite;
    return data;
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) data['name'] = name;
    if (code != null) data['code'] = code;
    if (timezone != null) data['timezone'] = timezone;
    return data;
  }
}

class Externals {
  // ignore: unnecessary_question_mark
  dynamic? tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  Externals.fromJson(Map<String, dynamic> json) {
    tvrage = json['tvrage'];
    thetvdb = json['thetvdb'];
    imdb = json['imdb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tvrage != null) data['tvrage'] = tvrage;
    if (thetvdb != null) data['thetvdb'] = thetvdb;
    if (imdb != null) data['imdb'] = imdb;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medium != null) data['medium'] = medium;
    if (original != null) data['original'] = original;
    return data;
  }
}

class Links {
  Self? self;
  Previousepisode? previousepisode;
  Previousepisode? nextepisode;

  Links({this.self, this.previousepisode, this.nextepisode});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? Self.fromJson(json['self']) : null;
    previousepisode = json['previousepisode'] != null
        ? Previousepisode.fromJson(json['previousepisode'])
        : null;
    nextepisode = json['nextepisode'] != null
        ? Previousepisode.fromJson(json['nextepisode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) data['self'] = self?.toJson();
    if (previousepisode != null)
      data['previousepisode'] = previousepisode?.toJson();
    if (nextepisode != null) data['nextepisode'] = nextepisode?.toJson();
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (href != null) data['href'] = href;
    return data;
  }
}

class Previousepisode {
  String? href;
  String? name;

  Previousepisode({this.href, this.name});

  Previousepisode.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (href != null) data['href'] = href;
    if (name != null) data['name'] = name;
    return data;
  }
}
