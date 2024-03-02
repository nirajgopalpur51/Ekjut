class MapData {
  List<String>? htmlAttributions;
  String? nextPageToken;
  List<Results> results=[];
  String? status;

  MapData({
    this.htmlAttributions,
    this.nextPageToken,
    required this.results,
    this.status,
  });

  MapData.fromJson(Map<String, dynamic> json) {
    htmlAttributions = json['html_attributions']?.cast<String>();
    nextPageToken = json['next_page_token'];
    results = (json['results'] as List<dynamic>?)
    !.map((e) => Results.fromJson(e))
        .toList();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'html_attributions': htmlAttributions,
      'next_page_token': nextPageToken,
      'results': results.map((e) => e.toJson()).toList(),
      'status': status,
    };
    return data;
  }
}
class Results {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? iconBackgroundColor;
  String? iconMaskBaseUri;
  String? name;
  OpeningHours? openingHours;
  String? placeId;
  PlusCode? plusCode;
  double? rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;
  List<Photos>? photos;

  Results(
      {this.businessStatus,
        this.geometry,
        this.icon,
        this.iconBackgroundColor,
        this.iconMaskBaseUri,
        this.name,
        this.openingHours,
        this.placeId,
        this.plusCode,
        this.rating,
        this.reference,
        this.scope,
        this.types,
        this.userRatingsTotal,
        this.vicinity,
        this.photos});

  Results.fromJson(Map<String, dynamic> json) {
    businessStatus = json['business_status']??"UnKnown";
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    icon = json['icon'];
    iconBackgroundColor = json['icon_background_color'];
    iconMaskBaseUri = json['icon_mask_base_uri'];
    name = json['name'];
    openingHours = json['opening_hours'] != null
        ? OpeningHours.fromJson(json['opening_hours'])
        : null;
    placeId = json['place_id'];
    plusCode = json['plus_code'] != null
        ? PlusCode.fromJson(json['plus_code'])
        : null;
    dynamic ratingData = json['rating'];
    if (ratingData is String) {
      rating = double.parse(ratingData);
    } else if (ratingData is int) {
      rating = ratingData.toDouble();
    }else if (ratingData is double) {
      rating = ratingData;
    } else if (ratingData==null) {
      rating = 0.0;
    }else {
      rating = ratingData;
    }
    reference = json['reference'];
    scope = json['scope'];
    types = json['types'].cast<String>();
    userRatingsTotal = json['user_ratings_total'];
    vicinity = json['vicinity'];
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_status'] = businessStatus;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['icon'] = icon;
    data['icon_background_color'] = iconBackgroundColor;
    data['icon_mask_base_uri'] = iconMaskBaseUri;
    data['name'] = name;
    if (openingHours != null) {
      data['opening_hours'] = openingHours!.toJson();
    }
    data['place_id'] = placeId;
    if (plusCode != null) {
      data['plus_code'] = plusCode!.toJson();
    }
    data['rating'] = this.rating;
    data['reference'] = this.reference;
    data['scope'] = this.scope;
    data['types'] = this.types;
    data['user_ratings_total'] = this.userRatingsTotal;
    data['vicinity'] = this.vicinity;
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Geometry {
  LocationS? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new LocationS.fromJson(json['location'])
        : null;
    viewport = json['viewport'] != null
        ? new Viewport.fromJson(json['viewport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.viewport != null) {
      data['viewport'] = this.viewport!.toJson();
    }
    return data;
  }
}

class LocationS {
  double? lat;
  double? lng;

  LocationS({this.lat, this.lng});

  LocationS.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Viewport {
  LocationS? northeast;
  LocationS? southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new LocationS.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new LocationS.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast!.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest!.toJson();
    }
    return data;
  }
}

class OpeningHours {
  bool? openNow;

  OpeningHours({this.openNow});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['open_now'] = this.openNow;
    return data;
  }
}

class PlusCode {
  String? compoundCode;
  String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  PlusCode.fromJson(Map<String, dynamic> json) {
    compoundCode = json['compound_code'];
    globalCode = json['global_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compound_code'] = this.compoundCode;
    data['global_code'] = this.globalCode;
    return data;
  }
}

class Photos {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = json['html_attributions'].cast<String>();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['html_attributions'] = this.htmlAttributions;
    data['photo_reference'] = this.photoReference;
    data['width'] = this.width;
    return data;
  }
}
