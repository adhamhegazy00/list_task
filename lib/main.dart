import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false ,
      title: 'Activity List',
      theme: ThemeData(
        primaryColor: Colors.black12,
      ),
      routes: {
        '/': (context) => ActivityList(),
        '/detail': (context) => const DetailScreen(),
      },
    );

  }
}
class ActivityList extends StatelessWidget {
   ActivityList({super.key});
   List<String> subtitle = [
     'chick your activity',
     'chick your activity',
     'chick your activity',
     'chick your activity',
     'chick your activity',
   ];
   final icons = [Icons.laptop_mac_rounded,
     Icons.fastfood_outlined,
     Icons.work_history_outlined,
     Icons.sports_volleyball,
     Icons.music_note_outlined,
     ];
  final List<String>activities = [
    'Idea',
    'Food',
    'Work',
    'Sport',
    'Music',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      title: const Text(
        'Choose Activity',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text(activities[index],style:const TextStyle(fontWeight: FontWeight.bold)),
            subtitle:Text(subtitle[index]) ,
            leading: Icon(icons[index],color:  Colors.deepPurpleAccent),
            trailing: const Icon(Icons.keyboard_arrow_right,color: Colors.deepPurpleAccent ,),

            onTap: () {
              Navigator.pushNamed(context, '/detail', arguments: activities[index],
              );
            },
          );
        },
      ),

    );

  }
}
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final String itemName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(

      appBar: AppBar(
        title: const Text('Activity'),
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child:  Text(
          itemName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
