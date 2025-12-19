import 'package:flutter/material.dart';
import 'package:myapp/presentation/pages/events/events_list_page.dart';
import 'package:myapp/presentation/pages/events/events_map_page.dart';

class EventsShell extends StatefulWidget {
  const EventsShell({super.key});

  @override
  State<EventsShell> createState() => _EventsShellState();
}

class _EventsShellState extends State<EventsShell>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Events'),
            Tab(text: 'Map'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [EventsListPage(), EventsMapPage()],
      ),
    );
  }
}
