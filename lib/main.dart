import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool tester = false;
  @override
  Widget build(BuildContext context) {
    if (tester == false) {
      return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MyHomePage()
        //(title: 'Recycling Plant Locator'),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle _ts;
  int choice = 0;
  bool _conwaySelected;
  bool _jsiSelected;
  bool _maumelleSelected;
  List<String> materials = ['No Selection', 'Plastic', 'Cardboard', 'Glass', 'Paper', 'Aluminum'];
  String currMat;

  void _selectMaterial(int choice){
    setState(() {
      if(choice == 0){
        _conwaySelected = false;
        _jsiSelected = false;
        _maumelleSelected = false;
      } else{
        if(choice == 5){
          _jsiSelected = true;
        } else{
          _jsiSelected = false;
        }
        _conwaySelected = true;
        _maumelleSelected = true;
      }
      currMat = materials[choice];
    });
  }

  @override
  void initState() {
    _conwaySelected = false;
    _jsiSelected = false;
    _maumelleSelected = false;
    currMat = materials[choice];
  }

  @override
  Widget build(BuildContext context) {
    _ts = Theme.of(context).textTheme.headline4;

    return Scaffold(
      appBar: AppBar(
        title: Text("Recycling Plant Locator"), centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
              key: Key('dropmenu'),
              value: choice,
              items: [
                DropdownMenuItem(
                  child: Text('No Selection'),
                  value: 0,
                ),
                DropdownMenuItem(
                  key: Key('plasticbutton'),
                  child: Text('Plastic'),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text('Cardboard'),
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text('Glass'),
                  value: 3,
                ),
                DropdownMenuItem(
                  child: Text('Paper'),
                  value: 4,
                ),
                DropdownMenuItem(
                  child: Text('Aluminum'),
                  value: 5,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  choice = value;
                });
                _selectMaterial(choice);
              }
            ),
            Text('Locations that have $currMat :'),
            Text('___________'),
            _buildConwayButton(),
            _buildJSIButton(),
            _buildMaumelleButton(),
          ],
        ),
      ),
    );
  }

  void cPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ConPage()));
  }
  void jPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => JSIPage()));
  }
  void mPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MaumellePage()));
  }

  Widget _buildConwayButton() {
    return new RaisedButton(
      key: Key('conwaybutton'),
      child: new Text('Conway Recycling Center'),
      onPressed: _conwaySelected ? cPage : null,
      disabledColor: Colors.red,
      color: Colors.green,
    );
  }

  Widget _buildJSIButton() {
    return new RaisedButton(
      key: Key('jsibutton'),
      child: new Text('JSI Metal Recycling'),
      onPressed: _jsiSelected ? jPage : null,
      disabledColor: Colors.red,
      color: Colors.green,
    );
  }

  Widget _buildMaumelleButton() {
    return new RaisedButton(
      key: Key('maumellebutton'),
      child: new Text('Maumelle Recycling Center'),
      onPressed: _maumelleSelected ? mPage : null,
      disabledColor: Colors.red,
      color: Colors.green,
    );
  }
}

class ConPage extends StatefulWidget {
  @override
  _ConPageState createState() => _ConPageState();
}

class _ConPageState extends State<ConPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City of Conway Recycling Center'), centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Address: 4550 US-64, Conway, AR 72034\n\n"
                  "Hours: 7:30am - 3:30pm\n\n"
                  "Plastics, cardboard, glass, paper, and aluminum are all accepted here.", style: TextStyle(
              fontSize: 25.0
          ),),
            ),
          ],
        ),
      ),
    );
  }
}

class JSIPage extends StatefulWidget {
  @override
  _JSIPageState createState() => _JSIPageState();
}

class _JSIPageState extends State<JSIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSI Metal Recycling'), centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Address: 1605 E. Oak St.\n\n"
                  "Hours: 8:00am - 4:30pm\n\n"
                  "Aluminum and other metals are able to be recycled here.", style: TextStyle(
                  fontSize: 25.0
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

class MaumellePage extends StatefulWidget {
  @override
  _MaumellePageState createState() => _MaumellePageState();
}

class _MaumellePageState extends State<MaumellePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maumelle Recycling Center'), centerTitle: true,
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Address: 600 Cogdell Drive\n\n"
                  "Hours: 7:00am - 4:00pm\n\n"
                  "Plastics, cardboard, glass, mixed paper, and aluminum are all accepted here.", style: TextStyle(
                  fontSize: 25.0
              ),),
            ),
          ],
        ),
      ),
    );
  }
}