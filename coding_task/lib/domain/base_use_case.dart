abstract class BaseUseCase<T> {
  Future<T> performEventsList(Map<String, String>? body);

  Future<T> performEvent(String eventId);
}
