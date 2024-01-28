import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  int _counter = 0;



  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
            ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text('Hi Leon!',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                ),),
                subtitle: Text('Good Morning',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),),
                trailing: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/img.png'),

                ),
              ),
              const SizedBox(height: 30)
            ],
          ),

          ),//DashBoard header end

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            // color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
              crossAxisSpacing: 40,
              mainAxisSpacing: 30,
              children: <Widget>[
                itemDashboard('User', CupertinoIcons.profile_circled, Colors.deepOrange),
                itemDashboard('Mail', CupertinoIcons.mail, Colors.indigoAccent),
                itemDashboard('Camera', CupertinoIcons.video_camera, Colors.green),
                itemDashboard('Upload', CupertinoIcons.upload_circle, Colors.brown),
                itemDashboard('Phone', CupertinoIcons.phone, Colors.amber),
                itemDashboard('Analytics', CupertinoIcons.play_rectangle, Colors.cyanAccent),
                itemDashboard('Add', CupertinoIcons.add, Colors.purple),
                itemDashboard('Analytics', CupertinoIcons.play_rectangle, Colors.pink),



              ],),

            ),
          ),

        ],

      ),

    );

  }
  // ignore: avoid_types_as_parameter_names
  itemDashboard(String title, IconData iconData, Color background)=> Container(
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5,

        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle

          ),
          child: Icon(iconData, color: Colors.white,),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(title,style: Theme.of(context).textTheme.titleMedium,)

      ],
    ),
  );
}
