import 'package:calculadora/core/app_colors.dart';
import 'package:calculadora/core/core.dart';
import 'package:calculadora/home/home_page.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  // São os controladores, iremos pegar as informações atráves deles
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  dynamic icone = Icons.calculate_outlined;
  dynamic cor = AppColors.purple;
  String _infoText = "Informe seus dados!";

  // "_" antes do nome da função indica que ela é privada
  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>(); 
      icone = Icons.calculate_outlined;
      cor = AppColors.purple;
    });
  }

  void _calculate(){
    setState(() {
      // "double.parse" transforma o text em um double
      double weight = double.parse(weightController.text);      
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      if(imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
        icone = Icons.thumb_down;
      } else if(imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
        icone = Icons.thumb_up;
      } else if(imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
        icone = Icons.circle;
        cor = AppColors.yellow;
      } else if(imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
        icone = Icons.circle;
        cor = AppColors.orange;
      } else if(imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
        icone = Icons.circle;
        cor = AppColors.red;
      } else if(imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
        icone = Icons.circle;
        cor = AppColors.pink;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // PQ "Scaffold"? Ele ajudará muito a mexer com material design
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: AppColors.pink),
                accountName: Text("Calc Tudo"),
                accountEmail: Text('O que deseja calcular?')),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Calculadora Padrão'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Calculadora IMC'),
              onTap: () {                
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ImcPage()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: AppColors.background,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  icone, 
                  size: 100.0, 
                  color: cor,
                ),
              ),
              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(
                    color: AppColors.purple
                  )
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.purple, 
                  fontSize: 25.0
                ),
                controller: weightController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Insira seu Peso!";
                  }
                },
                
              ),
              TextFormField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: AppColors.purple
                  )
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.purple, 
                  fontSize: 25.0
                ),
                controller: heightController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Insira sua Altura!";
                  }
                },
              ),
              Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _calculate();
                      }
                    },
                    child: Text("Calcular",
                      style: TextStyle(fontSize: 25.0),),
                    style: ButtonStyle(
                      backgroundColor: 
                        MaterialStateProperty.all<Color>(AppColors.orange),),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.comment, fontSize: 25.0),
              ),
            ],
          ),
        )
      )
    );
  }
}