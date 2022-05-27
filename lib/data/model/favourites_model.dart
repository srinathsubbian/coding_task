typedef OnFav = Function(bool value);

class FavouritesModel {
  int? id;
  String? title;
  String? eventId;
  String? location;
  String? eventTime;
  String? photo;
  FavouritesModel(
      {this.id,
      this.title,
      this.eventId,
      this.location,
      this.eventTime,
      this.photo});
}
