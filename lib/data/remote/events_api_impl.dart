import 'dart:convert';

import 'package:coding_task/constant/urls.dart';
import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/data/remote/api_controller.dart';
import 'package:coding_task/data/remote/events_api.dart';

class EventsApiImpl implements EventsApi {
  @override
  Future<EventsModel> getEventsList(Map<String, String>? body) async {
    var response = await request(url: urlListEvents, body: body);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return EventsModel.fromJson(data);
    } else {
      return EventsModel(error: true, events: [], meta: null);
    }
  }

  @override
  Future<Event> getEvent(String eventId) async {
    var response = await request(url: urlListEvents + eventId);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Event.fromJson(data);
    } else {
      return Event(favourite: false);
    }
  }
}
