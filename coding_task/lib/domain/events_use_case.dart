import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/data/repository/events_repository.dart';
import 'package:coding_task/domain/base_use_case.dart';

class EventsUseCase extends BaseUseCase {
  EventsRepository eventsRepository;

  EventsUseCase(this.eventsRepository);

  @override
  Future<EventsModel> performEventsList(Map<String,String>? body) {
    return eventsRepository.getEventsList(body);
  }

  @override
  Future<Event> performEvent(String eventId) {
    return eventsRepository.getEvent(eventId);
  }
}
