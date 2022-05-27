import 'package:coding_task/data/local/local_data_reaources.dart';
import 'package:coding_task/presentation/events_list/events_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      LocalDataResources.init();
    }
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Coding Task'),
        ),
        child: CupertinoPageScaffold(
          child: EventsListWidget(
            key: UniqueKey(),
          ),
        ));
  }
}
