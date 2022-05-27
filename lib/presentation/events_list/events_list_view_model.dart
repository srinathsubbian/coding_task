import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/data/remote/events_api_impl.dart';
import 'package:coding_task/data/repository/events_repository_impl.dart';
import 'package:coding_task/domain/events_use_case.dart';
import 'package:rxdart/rxdart.dart';

class EventsListViewModel {
  var eventsListSubject = PublishSubject<EventsModel>();
  var eventsSubject = PublishSubject<Event>();

  Stream<EventsModel> get eventsList => eventsListSubject.stream;
  Stream<Event> get event => eventsSubject.stream;
  EventsUseCase eventsUseCase =
      EventsUseCase(EventsRepositoryImpl(EventsApiImpl()));

  void getEventsList({Map<String, String>? body}) async {
    try {
      eventsListSubject = PublishSubject<EventsModel>();
      eventsListSubject.sink.add(await eventsUseCase.performEventsList(body));
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      eventsListSubject.sink.addError(e);
    }
  }

  void getEvent(String eventId) async {
    try {
      eventsSubject = PublishSubject<Event>();
      eventsSubject.sink.add(await eventsUseCase.performEvent(eventId));
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 500));
      eventsSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    eventsListSubject.close();
  }
}
