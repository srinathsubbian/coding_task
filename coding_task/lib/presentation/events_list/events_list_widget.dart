import 'package:coding_task/common/styles.dart';
import 'package:coding_task/common/utils.dart';
import 'package:coding_task/data/local/local_data_reaources.dart';
import 'package:coding_task/data/model/events_model.dart';
import 'package:coding_task/presentation/events_list/event_list_item.dart';
import 'package:coding_task/presentation/events_list/events_list_view_model.dart';
import 'package:coding_task/presentation/widgets/search_bar.dart';
import 'package:coding_task/presentation/widgets/shimmer_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildEventsContent());
  }

  Widget buildEventsContent() {
    return const EventsListView();
  }
}

class EventsListView extends StatefulWidget {
  const EventsListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EventsListViewState();
  }
}

class EventsListViewState extends State<EventsListView>
    with WidgetsBindingObserver {
  final EventsListViewModel eventsListViewModel = EventsListViewModel();
  late final TextEditingController _searchController;
  late final FocusNode _searchFocus;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      refresh();
    }
  }

  @override
  void initState() {
    super.initState();
    refresh();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        refresh();
      }
    });
    WidgetsBinding.instance.addObserver(this);
    _searchController = TextEditingController()..addListener(_onTextChanged);
    _searchFocus = FocusNode();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    eventsListViewModel.closeObservable();
    super.dispose();
  }

  void _onTextChanged() {
    String terms = '';
    if (terms != _searchController.text) {
      setState(() {
        terms = _searchController.text;
      });
      refresh(query: terms);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EventsModel>(
      stream: eventsListViewModel.eventsList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          showSnackBar(context: context, message: snapshot.error.toString());
          return buildListViewNoDataWidget();
        }
        if (snapshot.connectionState == ConnectionState.active) {
          var eventsList = snapshot.data;
          if (eventsList != null && (eventsList.events.isNotEmpty)) {
            return buildListViewWidget(eventsList);
          } else {
            return buildListViewNoDataWidget();
          }
        }
        return const ShimmerWidget();
      },
    );
  }

  Widget buildListViewWidget(EventsModel eventsList) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Styles.scaffoldBackground,
      ),
      child: SafeArea(
        child: Column(
          children: [
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => EventListItem(
                  event: eventsList.events[index],
                  lastItem: index == eventsList.events.length - 1,
                  onFavUpdate: (status) {
                    if (status) {
                      eventsList.events[index].favourite = true;
                    } else {
                      eventsList.events[index].favourite = false;
                    }
                    LocalDataResources.updateFavourites();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                ),
                itemCount: eventsList.events.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListViewNoDataWidget() {
    return Expanded(
      child: Center(
          child: svgImage(
              100, 100, "No events found!", 'images/empty_events.svg')),
    );
  }

  void refresh({String query = ''}) {
    if (query.isNotEmpty) {
      Map<String, String>? myQuery = <String, String>{};
      myQuery.putIfAbsent("q", () => query);
      eventsListViewModel.getEventsList(body: myQuery);
      setState(() {});
    } else {
      eventsListViewModel.getEventsList();
      setState(() {});
    }
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _searchController,
        focusNode: _searchFocus,
      ),
    );
  }
}
