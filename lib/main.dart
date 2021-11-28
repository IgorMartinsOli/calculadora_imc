import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcule seu IMC"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30.0),
            width: 800,
            height: 120,
            child: const Image(image: AssetImage("images/imc.png")),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Seu peso",
                  prefix: Text("KG"),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18)),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "sua altura",
                  prefix: Text("MT"),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 18)),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            height: 50,
            width: 200,
            child: ElevatedButton(
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                double valorPeso = double.parse(pesoController.text);
                double valorAltura = double.parse(alturaController.text);
                double resultado = valorPeso / (valorAltura * valorAltura);

                setState(() {
                  if (resultado < 18.5) {
                    _resultado = "Abaixo do peso";
                  } else if (resultado >= 18.5 && resultado <= 24.9) {
                    _resultado = "Peso normal";
                  } else if (resultado >= 25 && resultado <= 29.9) {
                    _resultado = "Sobrepeso";
                  } else if (resultado >= 30 && resultado <= 34.9) {
                    _resultado = "Obesidade grau I";
                  } else if (resultado >= 35 && resultado <= 39.9) {
                    _resultado = "Obesidade grau II";
                  } else {
                    _resultado = "Obesidade grau III ou morbida";
                  }
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              _resultado,
              style:
                  const TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
