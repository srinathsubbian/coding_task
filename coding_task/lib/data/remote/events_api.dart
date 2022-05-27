import 'package:coding_task/data/model/events_model.dart';

abstract class EventsApi {
  Future<EventsModel> getEventsList(Map<String, String>? body);

  Future<Event> getEvent(String eventId);
}
