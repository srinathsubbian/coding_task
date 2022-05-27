import 'package:coding_task/data/local/sqlite.dart';
import 'package:coding_task/data/model/favourites_model.dart';

class LocalDataResources {
  static DbHelper? db;
  static List<FavouritesModel> favourites = <FavouritesModel>[];

  static init() {
    db = DbHelper();
    _loadFavourites();
  }

  static _loadFavourites() async {
    favourites.clear();
    var favourite = await db!.getFavourites();
    favourites.addAll(favourite);
  }

  static updateFavourites() {
    _loadFavourites();
  }

  static unFavItem(String id) {
    List<FavouritesModel> items = [];
    for (int i = 0; i < favourites.length; i++) {
      if (favourites[i].eventId != id) {
        items.add(favourites[i]);
      }
    }
    favourites.clear();
    favourites.addAll(items);
  }
}
