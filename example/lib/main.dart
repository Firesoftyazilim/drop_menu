import 'package:drop_menu/drop_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pageMessage = 'Hello World';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:Text(pageMessage,
        style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            MenuTitle(
              title: 'Menu Title',
              children:  [
                MenuItem(
                  label: 'Menu Item 1',
                  onTap: () => setState(() {
                    pageMessage = 'Menu Item 1';
                  }),
                ),
                MenuItem(
                  label: 'Menu Item 2',
                  onTap: () => setState(() {
                    pageMessage = 'Menu Item 2';
                  }),
                ),
                MenuItem(
                  label: 'Menu Item 3',
                  onTap: () => () => setState(() {
                    pageMessage = 'Menu Item 3';
                  }),
                ),

                IconButton(onPressed: (){
                  setState(() {
                    pageMessage = 'Cutom Menu Item';
                  });

                }, icon: Icon(Icons.menu))
              ],
            ),

          ],
        ),
      )
    );
  }
}
