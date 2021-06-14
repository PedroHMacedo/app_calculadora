import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {

  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';

  String operador = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            _buildDisplay(),
            _buttonsColuna(),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
        width: double.maxFinite,
        height: 80,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            display,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.white, 
            fontSize: 50,
            fontWeight: FontWeight.normal
            ),
          ),
        ),
      );
    
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('7');
            },
            child: Text('7'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('8');
            },
            child: Text('8'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('9');
            },
            child: Text('9'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('/');
              operador = '/';
            },
            child: Text('/'),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('4');
            },
            child: Text('4'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('5');
            },
            child: Text('5'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('6');
            },
            child: Text('6'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('*');
              operador = '*';
            },
            child: Text('*'),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('1');
            },
            child: Text('1'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('2');
            },
            child: Text('2'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('3');
            },
            child: Text('3'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('-');
              operador = '-';
            },
            child: Text('-'),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('');
              limparDisplay();
            },
            child: Text('C'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('0');
            },
            child: Text('0'),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: calcular,
            child: Text('='),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              addInDisplay('+');
              operador = '+';
            },
            child: Text('+'),
          ),
        ),
      ],
    );
  }

       Widget _buttonsColuna() {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: 280,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 _buildButtons(),
            _buildButtons2(),
            _buildButtons3(),
            _buildButtons4()
              ],
            ),
          ),
        );
 }



  void calcular(){
    List<String> valores = display.split(operador);

    double valor1 = double.parse(valores[0]);
    double valor2 = double.parse(valores[1]);

    double resultado = 0;

    if(operador == '+'){
      resultado =  valor1 + valor2;
    }

    if(operador == '-'){
      resultado =  valor1 - valor2;
    }

    if(operador == '*'){
      resultado =  valor1 * valor2;
    }

    if(operador == '/'){
      resultado =  valor1 / valor2;
    }

    setState(() {
      display = resultado.toString();
    });

  }

  void addInDisplay(String text){
    setState(() {
      display +=text;
    });
  }

  void limparDisplay() {
    setState(() {
      display = '';
    });
  }

}




  
