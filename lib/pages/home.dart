import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add_todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Container(),
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo App"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: "ToDos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: "Completed",
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[400],
        child: const Icon(Icons.add_outlined),
        onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => AddToDoDialogWidget(),
          barrierDismissible: false,
        ),
      ),
    );
  }
}
