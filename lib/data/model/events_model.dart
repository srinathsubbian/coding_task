import 'package:flutter/material.dart';

class EventsModel {
  List<Event> events = [];
  Meta? meta;
  bool? error;

  EventsModel({required this.events, this.meta, this.error});

  EventsModel.fromJson(Map<String, dynamic> json) {
    try {
      json['events'].forEach((v) {
        events.add(Event.fromJson(v));
      });
      meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Event {
  String? type;
  bool favourite = false;
  int? id;
  String? datetimeUtc;
  Venue? venue;
  bool? datetimeTbd;
  List<Performers>? performers;
  bool? isOpen;
  String? datetimeLocal;
  bool? timeTbd;
  String? shortTitle;
  String? visibleUntilUtc;
  Stats? stats;
  String? url;
  String? score;
  String? announceDate;
  String? createdAt;
  bool? dateTbd;
  String? title;
  String? popularity;
  String? description;
  String? status;
  AccessMethod? accessMethod;
  Announcements? announcements;
  bool? conditional;
  bool? generalAdmission;

  Event(
      {this.type,
      this.id,
      this.datetimeUtc,
      this.venue,
      required this.favourite,
      this.datetimeTbd,
      this.performers,
      this.isOpen,
      this.datetimeLocal,
      this.timeTbd,
      this.shortTitle,
      this.visibleUntilUtc,
      this.stats,
      this.url,
      this.score,
      this.announceDate,
      this.createdAt,
      this.dateTbd,
      this.title,
      this.popularity,
      this.description,
      this.status,
      this.accessMethod,
      this.announcements,
      this.conditional,
      this.generalAdmission});

  Event.fromJson(Map<String, dynamic> json) {
    try {
      type = json['type'];
      id = json['id'];
      datetimeUtc = json['datetime_utc'];
      venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
      datetimeTbd = json['datetime_tbd'];
      if (json['performers'] != null) {
        performers = <Performers>[];
        json['performers'].forEach((v) {
          performers!.add(Performers.fromJson(v));
        });
      }
      isOpen = json['is_open'];
      datetimeLocal = json['datetime_local'];
      timeTbd = json['time_tbd'];
      shortTitle = json['short_title'];
      visibleUntilUtc = json['visible_until_utc'];
      url = json['url'];
      score = json['score'].toString();
      announceDate = json['announce_date'];
      createdAt = json['created_at'];
      dateTbd = json['date_tbd'];
      title = json['title'];
      popularity = json['popularity'].toString();
      description = json['description'];
      status = json['status'];
      accessMethod = json['access_method'] != null
          ? AccessMethod.fromJson(json['access_method'])
          : null;
      announcements = json['announcements'] != null
          ? Announcements.fromJson(json['announcements'])
          : null;
      conditional = json['conditional'];
      generalAdmission = json['general_admission'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Venue {
  String? state;
  String? nameV2;
  String? postalCode;
  String? name;
  String? timezone;
  String? url;
  String? score;
  Location? location;
  String? address;
  String? country;
  bool? hasUpcomingEvents;
  int? numUpcomingEvents;
  String? city;
  String? slug;
  String? extendedAddress;
  int? id;
  int? popularity;
  AccessMethod? accessMethod;
  int? metroCode;
  int? capacity;
  String? displayLocation;

  Venue(
      {this.state,
      this.nameV2,
      this.postalCode,
      this.name,
      this.timezone,
      this.url,
      this.score,
      this.location,
      this.address,
      this.country,
      this.hasUpcomingEvents,
      this.numUpcomingEvents,
      this.city,
      this.slug,
      this.extendedAddress,
      this.id,
      this.popularity,
      this.accessMethod,
      this.metroCode,
      this.capacity,
      this.displayLocation});

  Venue.fromJson(Map<String, dynamic> json) {
    try {
      state = json['state'];
      nameV2 = json['name_v2'];
      postalCode = json['postal_code'];
      name = json['name'];
      timezone = json['timezone'];
      url = json['url'];
      score = json['score'].toString();
      location =
          json['location'] != null ? Location.fromJson(json['location']) : null;
      address = json['address'];
      country = json['country'];
      hasUpcomingEvents = json['has_upcoming_events'];
      numUpcomingEvents = json['num_upcoming_events'];
      city = json['city'];
      slug = json['slug'];
      extendedAddress = json['extended_address'];
      id = json['id'];
      popularity = json['popularity'];
      accessMethod = json['access_method'] != null
          ? AccessMethod.fromJson(json['access_method'])
          : null;
      metroCode = json['metro_code'];
      capacity = json['capacity'];
      displayLocation = json['display_location'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    try {
      lat = json['lat'];
      lon = json['lon'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class AccessMethod {
  String? method;
  String? createdAt;
  bool? employeeOnly;

  AccessMethod({this.method, this.createdAt, this.employeeOnly});

  AccessMethod.fromJson(Map<String, dynamic> json) {
    try {
      method = json['method'];
      createdAt = json['created_at'];
      employeeOnly = json['employee_only'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Performers {
  String? type;
  String? name;
  String image = "";
  int? id;
  bool? hasUpcomingEvents;
  bool primary = false;
  Stats? stats;
  String? imageAttribution;
  String? url;
  double? score;
  String? slug;
  String? homeVenueId;
  String? shortName;
  int? numUpcomingEvents;
  String? imageLicense;
  int? popularity;
  bool? homeTeam;
  bool? awayTeam;

  Performers(
      {this.type,
      this.name,
      required this.image,
      this.id,
      this.hasUpcomingEvents,
      required this.primary,
      this.stats,
      this.imageAttribution,
      this.url,
      this.score,
      this.slug,
      this.homeVenueId,
      this.shortName,
      this.numUpcomingEvents,
      this.imageLicense,
      this.popularity,
      this.homeTeam,
      this.awayTeam});

  Performers.fromJson(Map<String, dynamic> json) {
    try {
      if (json['type'] != null) {
        type = json['type'];
      }
      if (json['name'] != null) {
        name = json['name'];
      }
      if (json['image'] != null) {
        image = json['image'];
      }
      if (json['id'] != null) {
        id = json['id'];
      }
      if (json['has_upcoming_events'] != null) {
        hasUpcomingEvents = json['has_upcoming_events'];
      }
      if (json['primary'] != null) {
        primary = json['primary'];
      }
      if (json['image_attribution'] != null) {
        imageAttribution = json['image_attribution'];
      }
      if (json['url'] != null) {
        url = json['url'];
      }
      if (json['score'] != null) {
        score = json['score'];
      }
      if (json['slug'] != null) {
        slug = json['slug'];
      }
      if (json['home_venue_id'] != null) {
        homeVenueId = json['home_venue_id'].toString();
      }
      if (json['short_name'] != null) {
        shortName = json['short_name'];
      }
      if (json['num_upcoming_events'] != null) {
        numUpcomingEvents = json['num_upcoming_events'];
      }
      if (json[''] != null) {}
      if (json['image_license'] != null) {
        imageLicense = json['image_license'];
      }
      if (json['popularity'] != null) {
        popularity = json['popularity'];
      }
      if (json['home_team'] != null) {
        homeTeam = json['home_team'];
      }
      if (json['away_team'] != null) {
        awayTeam = json['away_team'];
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Meta {
  int? total;
  int? took;
  int? page;
  int? perPage;
  Geolocation? geolocation;

  Meta({this.total, this.took, this.page, this.perPage, this.geolocation});

  Meta.fromJson(Map<String, dynamic> json) {
    try {
      total = json['total'];
      took = json['took'];
      page = json['page'];
      perPage = json['per_page'];
      geolocation = json['geolocation'] != null
          ? Geolocation.fromJson(json['geolocation'])
          : null;
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Stats {
  int? listingCount;
  int? averagePrice;
  int? lowestPriceGoodDeals;
  int? lowestPrice;
  int? highestPrice;
  int? visibleListingCount;
  List<int>? dqBucketCounts;
  int? medianPrice;
  int? lowestSgBasePrice;
  int? lowestSgBasePriceGoodDeals;

  Stats(
      {this.listingCount,
      this.averagePrice,
      this.lowestPriceGoodDeals,
      this.lowestPrice,
      this.highestPrice,
      this.visibleListingCount,
      this.dqBucketCounts,
      this.medianPrice,
      this.lowestSgBasePrice,
      this.lowestSgBasePriceGoodDeals});

  Stats.fromJson(Map<String, dynamic> json) {
    try {
      listingCount = json['listing_count'];
      averagePrice = json['average_price'];
      lowestPriceGoodDeals = json['lowest_price_good_deals'];
      lowestPrice = json['lowest_price'];
      highestPrice = json['highest_price'];
      visibleListingCount = json['visible_listing_count'];
      dqBucketCounts = json['dq_bucket_counts'].cast<int>();
      medianPrice = json['median_price'];
      lowestSgBasePrice = json['lowest_sg_base_price'];
      lowestSgBasePriceGoodDeals = json['lowest_sg_base_price_good_deals'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Announcements {
  CheckoutDisclosures? checkoutDisclosures;

  Announcements({this.checkoutDisclosures});

  Announcements.fromJson(Map<String, dynamic> json) {
    checkoutDisclosures = json['checkout_disclosures'] != null
        ? CheckoutDisclosures.fromJson(json['checkout_disclosures'])
        : null;
  }
}

class CheckoutDisclosures {
  List<Messages>? messages;

  CheckoutDisclosures({this.messages});

  CheckoutDisclosures.fromJson(Map<String, dynamic> json) {
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(Messages.fromJson(v));
      });
    }
  }
}

class Messages {
  String? text;

  Messages({this.text});

  Messages.fromJson(Map<String, dynamic> json) {
    try {
      text = json['text'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

class Geolocation {
  double? lat;
  double? lon;
  String? city;
  String? state;
  String? country;
  String? displayName;
  String? range;

  Geolocation(
      {this.lat,
      this.lon,
      this.city,
      this.state,
      this.country,
      this.displayName,
      this.range});

  Geolocation.fromJson(Map<String, dynamic> json) {
    try {
      lat = json['lat'];
      lon = json['lon'];
      city = json['city'];
      state = json['state'];
      country = json['country'];
      displayName = json['display_name'];
      range = json['range'];
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
