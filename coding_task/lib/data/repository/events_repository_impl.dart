import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/data/remote/events_api.dart';
import 'package:coding_task/data/repository/events_repository.dart';

class EventsRepositoryImpl implements EventsRepository {
  EventsApi eventsApi;
  EventsRepositoryImpl(this.eventsApi);

  @override
  Future<Event> getEvent(String eventId) {
    return eventsApi.getEvent(eventId);
  }

  @override
  Future<EventsModel> getEventsList(Map<String, String>? body) {
    return eventsApi.getEventsList(body);
  }
}
