import 'package:flutter/material.dart';
import 'package:flutter_table_calendar/features/music.dart';
import 'package:flutter_table_calendar/utils/event.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Initial variable
  DateTime today = DateTime.now();
  late final Map<DateTime, List<Event>> selectedEvents;
  TextEditingController eventController = TextEditingController();

  /// Selected Day function
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  /// Event Setup
  List<Event> getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void initState() {
    selectedEvents = {};

    super.initState();
  }

  @override
  void dispose() {
    eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Table Calendar Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePageMusic(),
                ),
              );
            },
            child: const Text("Music Page"),
          ),
          const SizedBox(height: 10),

          /// Drawwer
          ElevatedButton(
            child: const Text('Example Date in Drawwer'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TableCalendar(
                          focusedDay: today,
                          headerStyle: const HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          calendarStyle: const CalendarStyle(
                            markersAlignment: Alignment.center,
                            markersOffset: PositionedOffset(),
                            todayTextStyle: TextStyle(
                              color: Colors.black,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.rectangle,
                            ),
                            selectedTextStyle: TextStyle(
                              color: Colors.black,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          calendarBuilders: CalendarBuilders(
                            defaultBuilder: (context, day, focusedDay) => Text(
                              "${day.day}",
                              style: TextStyle(
                                color: selectedEvents[day] != null &&
                                        selectedEvents[day]!.length >= 4
                                    ? Colors.red
                                    : Colors.black,
                              ),
                            ),
                            selectedBuilder: (context, day, focusedDay) => Text(
                              "${day.day}",
                              style: TextStyle(
                                color: selectedEvents[day] != null &&
                                        selectedEvents[day]!.length >= 4
                                    ? Colors.red
                                    : Colors.orange,
                              ),
                            ),
                            todayBuilder: (context, day, focusedDay) => Text(
                              "${day.day}",
                              style: TextStyle(
                                color: selectedEvents[day] != null &&
                                        selectedEvents[day]!.length >= 4
                                    ? Colors.red
                                    : Colors.blue,
                              ),
                            ),
                            markerBuilder: (context, day, events) =>
                                events.isNotEmpty && events.length >= 4
                                    ? const Positioned(
                                        bottom: 5,
                                        child: Text(
                                          'Penuh',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 8,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                          ),
                          availableGestures: AvailableGestures.all,
                          selectedDayPredicate: (day) => isSameDay(day, today),
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          firstDay: DateTime.utc(2010, 1, 1),
                          lastDay: DateTime.utc(2030, 1, 1),
                          onDaySelected: onDaySelected,
                          eventLoader: getEventsfromDay,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 10),

          /// Calendar table
          TableCalendar(
            focusedDay: today,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: const CalendarStyle(
              markersAlignment: Alignment.center,
              markersOffset: PositionedOffset(),
              todayTextStyle: TextStyle(
                color: Colors.black,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.black,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
              ),
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) => Text(
                "${day.day}",
                style: TextStyle(
                  color: selectedEvents[day] != null &&
                          selectedEvents[day]!.length >= 4
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              selectedBuilder: (context, day, focusedDay) => Text(
                "${day.day}",
                style: TextStyle(
                  color: selectedEvents[day] != null &&
                          selectedEvents[day]!.length >= 4
                      ? Colors.red
                      : Colors.orange,
                ),
              ),
              todayBuilder: (context, day, focusedDay) => Text(
                "${day.day}",
                style: TextStyle(
                  color: selectedEvents[day] != null &&
                          selectedEvents[day]!.length >= 4
                      ? Colors.red
                      : Colors.blue,
                ),
              ),
              markerBuilder: (context, day, events) =>
                  events.isNotEmpty && events.length >= 4
                      ? const Positioned(
                          bottom: 5,
                          child: Text(
                            'Penuh',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 8,
                            ),
                          ),
                        )
                      : const SizedBox(),
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            onDaySelected: onDaySelected,
            eventLoader: getEventsfromDay,
          ),
          const SizedBox(height: 10),

          /// Event List
          selectedEvents[today] == null ? const SizedBox() : const Divider(),
          selectedEvents[today] == null
              ? const SizedBox()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: selectedEvents[today]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(selectedEvents[today]![index].title),
                    );
                  },
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Add Event"),
            content: TextFormField(
              autofocus: true,
              controller: eventController,
            ),
            actions: [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                  eventController.clear();

                  setState(() {});
                  return;
                },
              ),
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  if (eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[today] != null) {
                      selectedEvents[today]!.add(Event(eventController.text));
                    } else {
                      selectedEvents[today] = [Event(eventController.text)];
                    }
                  }

                  Navigator.pop(context);
                  eventController.clear();

                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ).whenComplete(() => eventController.clear()),
        label: const Text("Add Event"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
