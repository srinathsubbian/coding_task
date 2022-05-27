import 'package:coding_task/data/model/events_model.dart';

abstract class EventsRepository {
  Future<EventsModel> getEventsList(Map<String, String>? body);

  Future<Event> getEvent(String eventId);
}
