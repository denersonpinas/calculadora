import 'package:calculadora/core/app_colors.dart';
import 'package:calculadora/core/app_text_styles.dart';
import 'package:calculadora/imc/imc_page.dart';
import 'package:calculadora/models/operacoes_func.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'widget/button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _textController = TextEditingController();
  final operacoes = OperacoesFunc();

  List numbersList = [];

  bool soma = false;
  bool subtracao = false;
  bool divisao = false;
  bool multiplicacao = false;
  bool porcentagem = false;
  bool raizQ = false;
  bool tangente = false;
  bool coseno = false;
  bool seno = false;
  bool isDouble = false;
  bool log = false;
  bool potencia = false;
  

  String visor = "";
  dynamic number01;
  dynamic number02;
  String aux = "";  

  void visorValor(dynamic rv_parmOne) {   

    int vv_aux = numbersList.length;
    for (var i = 0; i < vv_aux; i++) {
      if(numbersList[i] == '.'){
        isDouble = true;
      }
    }

    if(rv_parmOne == '.') {
      if(isDouble == false){
        numbersList.add(rv_parmOne);
      }
    } else {
      numbersList.add(rv_parmOne);
    }        
    aux = numbersList.toString();
    aux = aux.replaceAllMapped("[", (match) => "");
    aux = aux.replaceAllMapped("]", (match) => "");
    aux = aux.replaceAllMapped(",", (match) => "");
    aux = aux.replaceAllMapped(" ", (match) => ""); 
    setState(() {
        _textController.text = aux;      
    });
  }

  void setSinal(int type) {
    number01 = num.parse(aux);
    
    if(type == 1){
      setState(() {
        multiplicacao = true;
        visor = "${number01} *";        
      });
    } else if(type == 2) {
      setState(() {
        divisao = true;
        visor = "${number01} /";        
      });
    } else if(type == 3) {
      setState(() {
        soma = true;
        visor = "${number01} +";        
      });
    } else if(type == 4) {
      setState(() {
        subtracao = true;
        visor = "${number01} -";        
      });
    } else if(type == 5) {
      setState(() {
        potencia = true;
        visor = "${number01}^";        
      });
    }

    setState(() {
      numbersList.clear();   
    });
  }

  void setIgualdade() {   
    number02 = num.parse(aux);
    dynamic result;

    if(porcentagem == true){
      if(multiplicacao == true) {
        result = operacoes.porcentValor(number01, number02, 0);
      } else if(subtracao == true) {
        result = operacoes.porcentValor(number01, number02, 1);
      } else if(soma == true) {
        result = operacoes.porcentValor(number01, number02, 2);
      }
      
      setState(() {
        visor = "${number01} * ${number02}% =";
        _textController.text = result.toString();        
      });
    } else {
      if(multiplicacao == true) {
        result = operacoes.multiplicacaoValor(number01, number02);
        setState(() {
          visor = "${number01} * ${number02} =";
          _textController.text = result.toString();        
        });  
      } else if(divisao == true) {
        result = operacoes.divisaoValor(number01, number02);
        setState(() {
          visor = "${number01} / ${number02} =";
          _textController.text = result.toString();        
        });
      } else if(soma == true) {
        result = operacoes.somaValor(number01, number02);
        setState(() {
          visor = "${number01} + ${number02} =";
          _textController.text = result.toString();        
        });
      } else if(subtracao == true) {
        result = operacoes.subtracaoValor(number01, number02);
        setState(() {
          visor = "${number01} - ${number02} =";
          _textController.text = result.toString();        
        });
      } else if(potencia == true) {
        result = operacoes.potenciaValor(number01, number02);
        setState(() {
          visor = "${number01}^ ${number02} =";
          _textController.text = result.toString();        
        });
      } else if(raizQ == true) {
        number01 = num.parse(aux);
        result = operacoes.raizValor(number01);
        setState(() {
          visor = "2√(${number01}) =";
          _textController.text = result.toString();        
        });
      } else if(tangente == true) {
        number01 = num.parse(aux);
        result = operacoes.tangenteValor(number01);
        setState(() {
          visor = "tan(${number01}) =";
          _textController.text = result.toString();        
        });
      } else if(coseno == true) {
        number01 = num.parse(aux);
        result = operacoes.cosenoValor(number01);
        setState(() {
          visor = "cos(${number01}) =";
          _textController.text = result.toString();        
        });
      } else if(seno == true) {
        number01 = num.parse(aux);
        result = operacoes.senoValor(number01);
        setState(() {
          visor = "sin(${number01}) =";
          _textController.text = result.toString();        
        });
      } else if(log == true) {
        number01 = num.parse(aux);
        result = operacoes.logValor(number01);
        setState(() {
          visor = "sin(${number01}) =";
          _textController.text = result.toString();        
        });
      }
    }    
  }

  void setCaractEspecial(int sce_type) {
    if(sce_type == 1) {
      numbersList.clear();
      aux = 3.1415926535897932.toString();
      setState(() {
        _textController.text = aux;      
      });
    } else if(sce_type == 2) {
      setState(() {
        porcentagem = true;
        setIgualdade();     
      });
    } else if(sce_type == 3) {
      numbersList.clear();
      aux = 2.718281828459045.toString();
      setState(() {
        _textController.text = aux;      
      });
    } else if(sce_type == 4) {
      raizQ = true;
      setIgualdade();
    } else if(sce_type == 5) {
      tangente = true;
      setIgualdade();
    } else if(sce_type == 6) {
      coseno = true;
      setIgualdade();
    } else if(sce_type == 7) {
      seno = true;
      setIgualdade();
    } else if(sce_type == 8) {
      log = true;
      setIgualdade();
    }
  }

  void reset() {
    setState(() {
      _textController.text = "";
      visor = "";
      numbersList.clear();

      soma = false;
      subtracao = false;
      divisao = false;
      multiplicacao = false;
      porcentagem = false;
      raizQ = false;
      tangente = false;
      coseno = false;
      seno = false;
      isDouble = false;
      log = false;
      potencia = false; 
    });
  }  

  @override
  Widget build(BuildContext context) {
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
        title: Text("Calculadora de Padrão"),
        centerTitle: true,
        backgroundColor: AppColors.background,        
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColors.background
            ),
            height: 128,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: TextField(
                    controller: _textController,
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(
                      Icons.calculate,
                      color: AppColors.white,
                    ),
                  ),
                    style: AppTextStyles.title,                    
                  ),
                ),
                Text(
                  visor,
                  style: AppTextStyles.visor,
                )
              ],
            )            
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.comment
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget.fucoes(label: "INV", onTap: (){}),
                    ButtonWidget.fucoes(label: "GRAU", onTap: (){}),
                    ButtonWidget.fucoes(label: "sin", onTap: (){setCaractEspecial(7);}),
                    ButtonWidget.fucoes(label: "cos", onTap: (){setCaractEspecial(6);}),
                    ButtonWidget.fucoes(label: "tan", onTap: (){setCaractEspecial(5);}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget.fucoes(label: "%", onTap: (){setCaractEspecial(2);}),
                    ButtonWidget.fucoes(label: "in", onTap: (){}),
                    ButtonWidget.fucoes(label: "log", onTap: (){setCaractEspecial(8);}),
                    ButtonWidget.fucoes(label: "2√(x)", onTap: (){setCaractEspecial(4);}),
                    ButtonWidget.fucoes(label: "^", onTap: (){setSinal(5);}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget.fucoes(label: "π", onTap: (){setCaractEspecial(1);}),
                    ButtonWidget.fucoes(label: "e", onTap: (){setCaractEspecial(3);}),
                    ButtonWidget.fucoes(label: "(", onTap: (){}),
                    ButtonWidget.fucoes(label: ")", onTap: (){}),
                    ButtonWidget.fucoes(label: "!", onTap: (){}),
                  ],
                ),
              ],
            )              
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.currentLine,
                      border: Border(right: BorderSide(color: AppColors.white, width: 1))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget.numbers(label: "7", onTap: (){visorValor(7);}),
                            ButtonWidget.numbers(label: "8", onTap: (){visorValor(8);}),
                            ButtonWidget.numbers(label: "9", onTap: (){visorValor(9);}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget.numbers(label: "4", onTap: (){visorValor(4);}),
                            ButtonWidget.numbers(label: "5", onTap: (){visorValor(5);}),
                            ButtonWidget.numbers(label: "6", onTap: (){visorValor(6);}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget.numbers(label: "1", onTap: (){visorValor(1);}),
                            ButtonWidget.numbers(label: "2", onTap: (){visorValor(2);}),
                            ButtonWidget.numbers(label: "3", onTap: (){visorValor(3);}),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonWidget.numbers(label: "0", onTap: (){visorValor(0);}),
                            ButtonWidget.numbers(label: ".", onTap: (){visorValor('.');}),
                            ButtonWidget.numbers(label: "", onTap: (){}),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.currentLine
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget.numbers(label: "/", onTap: (){setSinal(2);}),
                          ButtonWidget.numbers(label: "DEL", onTap: (){reset();}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget.numbers(label: "*", onTap: (){setSinal(1);}),
                          ButtonWidget.numbers(label: "", onTap: (){}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget.numbers(label: "-", onTap: (){setSinal(4);}),
                          ButtonWidget.numbers(label: "", onTap: (){}),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonWidget.numbers(label: "+", onTap: (){setSinal(3);}),
                          ButtonWidget.numbers(label: "=", onTap: (){setIgualdade();}),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}