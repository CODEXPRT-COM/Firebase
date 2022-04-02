import 'package:firebase/DataFile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

FirebaseDatabase database = FirebaseDatabase.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp app;
    app = await Firebase.initializeApp();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() async {
    database.reference().child("Meassage").set({
      "Firstname":"jems",
      "LastName":"bond",
       "Username":"jebo",
      "age":45
    });

    DatabaseEvent val = await database.reference().once();
    Map? urlsnap = val.snapshot.value as Map;
    if (urlsnap != null) {
      print('value Display :---- ${urlsnap['url']}');
    }

    DatabaseEvent chilevalue = await database.ref().child('weburl').once();
    Map? DataValue = chilevalue.snapshot.value as Map;
    print('chield Data Represent :---- $DataValue');

    DatabaseEvent allvalue = await database.ref().child('Meassage').once();
    Map?  data = allvalue.snapshot.value  as Map;
    print('All Data Display --$data');

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            InkWell(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DataManage()));
              },
              child: Text('Next Page',
              style: TextStyle(
                backgroundColor: Colors.blue,
                color: Colors.white,
                fontSize: 25.0,
              ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
