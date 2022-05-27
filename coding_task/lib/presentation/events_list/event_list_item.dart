import 'package:coding_task/common/styles.dart';
import 'package:coding_task/common/utils.dart';
import 'package:coding_task/data/local/local_data_reaources.dart';
import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/data/model/favourites_model.dart';
import 'package:coding_task/presentation/event_detail/event_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class EventListItem extends StatefulWidget {
  final Event event;
  final bool lastItem;
  final OnFav onFavUpdate;
  const EventListItem(
      {Key? key,
      required this.event,
      required this.lastItem,
      required this.onFavUpdate})
      : super(key: key);

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  @override
  Widget build(BuildContext context) {
    final item = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => EventDetailView(
                  event: widget.event,
                  isFav: false,
                  onFav: widget.onFavUpdate,
                )));
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        widget.event.performers![0].image,
                        fit: BoxFit.cover,
                        height: 80,
                        width: 120,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.event.venue!.displayLocation!,
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                      ),
                      Text(
                        parseDate(widget.event.datetimeUtc!),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54),
                      )
                    ],
                  ),
                ),
              ),
              !kIsWeb
                  ? Center(
                      child: CupertinoButton(
                        child: Visibility(
                          visible: widget.event.favourite,
                          child: const Icon(
                            MaterialCommunityIcons.heart,
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                        onPressed: () async {
                          FavouritesModel favourite = FavouritesModel(
                              photo: widget.event.performers![0].image,
                              location: widget.event.venue!.displayLocation!,
                              eventTime: widget.event.datetimeUtc!,
                              eventId: widget.event.id!.toString(),
                              title: widget.event.title);
                          if (!widget.event.favourite) {
                            var stat = await LocalDataResources.db!
                                .addFavourite(favourite);
                            if (stat > 0) {
                              widget.event.favourite = true;
                              widget.onFavUpdate(true);
                            }
                          } else {
                            var status = await LocalDataResources.db!
                                .deleteExpense(favourite);
                            if (status > 0) {
                              widget.event.favourite = false;
                              widget.onFavUpdate(false);
                            }
                          }
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
    if (widget.lastItem) {
      return item;
    }

    return Column(
      children: <Widget>[
        item,
        Padding(
          padding: const EdgeInsets.only(
            left: 160,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.eventRowDivider,
          ),
        ),
      ],
    );
  }
}
