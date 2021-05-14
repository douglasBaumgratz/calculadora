import 'package:flutter/material.dart';

void main() => runApp(CalculadoraApp());

/*
  Calculadora APP
*/
class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(title: 'Calculadora simples'),
    );
  }
}

class Calculadora extends StatefulWidget {
  Calculadora({Key key, this.title}) : super(key: key);
  final String title;

  @override
  CalculadoraState createState() => CalculadoraState();
}

class CalculadoraState extends State<Calculadora> {
  TextEditingController s1 = TextEditingController();
  TextEditingController s2 = TextEditingController();
  var _resultado;

  void _somar() {
    setState(() {
      _resultado = double.parse(s1.text) + double.parse(s2.text);
    });
  }

  void _subtrair() {
    setState(() {
      _resultado = double.parse(s1.text) - double.parse(s2.text);
    });
  }

  void _multiplicar() {
    setState(() {
      _resultado = double.parse(s1.text) * double.parse(s2.text);
    });
  }

  void _dividir() {
    setState(() {
      _resultado = double.parse(s1.text) / double.parse(s2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(7),
              child: new ListTile(
                title: new Text('Calculadora'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new CalculadoraApp()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: new ListTile(
                title: new Text('Não sei'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new NaoSeiApp()));
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(7),
              child: Text("Entre com dois números"),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(controller: s1),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: TextFormField(controller: s2),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(_resultado.toString()),
            ),
            Row(
              children: <Widget>[
                OutlineButton(
                  child: new Text("+"),
                  color: Colors.blue,
                  hoverColor: Colors.grey,
                  borderSide: BorderSide(color: Colors.blue),
                  onPressed: _somar,
                ),
                OutlineButton(
                  child: new Text("-"),
                  borderSide: BorderSide(color: Colors.blue),
                  onPressed: _subtrair,
                ),
                OutlineButton(
                  child: new Text("*"),
                  borderSide: BorderSide(color: Colors.blue),
                  onPressed: _multiplicar,
                ),
                OutlineButton(
                  child: new Text("/"),
                  borderSide: BorderSide(color: Colors.blue),
                  onPressed: _dividir,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
  Não sei APP
*/
class NaoSeiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Não sei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NaoSei(title: 'Não sei'),
    );
  }
}

class NaoSei extends StatefulWidget {
  NaoSei({Key key, this.title}) : super(key: key);
  final String title;

  @override
  NaoSeiState createState() => NaoSeiState();
}

class NaoSeiState extends State<NaoSei> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(7),
              child: new ListTile(
                title: new Text('Calculadora'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new CalculadoraApp()));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(7),
              child: new ListTile(
                title: new Text('Não sei'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new NaoSeiApp()));
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
