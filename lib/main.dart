import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.orange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final _controller = PageController(
    initialPage: 0,
  );

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    'A': GlobalKey<NavigatorState>(),
    'B': GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ANavigator(navigatorKeys['A']),
          B()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            title: Text('data'),
            icon: Icon(Icons.accessibility)
          ),
          BottomNavigationBarItem(
            title: Text('data'),
            icon: Icon(Icons.accessibility)
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          _controller.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut
          );
        },
      ),
    );
  }
}

class ANavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  ANavigator(this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) { 
        switch (settings.name) {
          case A.routeName:
            return MaterialPageRoute(
              builder: (context) => A()
            );
          case AA.routeName:
            return MaterialPageRoute(
              builder: (context) => AA()
            );
          default:
            return null;
        }
      },
    );
  }
}

class A extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: FlatButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AA.routeName
            );
          },
          child: Text('press'),
        ),
      ),
    );
  }
}

class AA extends StatelessWidget {
  static const routeName = '/aa';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('AA'),
      ),
    );
  }
}

class B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text('A'),
    );
  }
}