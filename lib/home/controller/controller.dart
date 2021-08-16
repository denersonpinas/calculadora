import 'package:calculadora/home/home_page.dart';
import 'package:calculadora/models/operacoes_func.dart';
import 'package:flutter/material.dart';

final operacoes = OperacoesFunc();
final controller = HomePage();

class Controller {
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

  String visorValor(dynamic rv_parmOne, TextEditingController _textController) {   

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
    
    return aux;      
    
  }

  void setSinal(int type) {
    number01 = num.parse(aux);
    
    if(type == 1){
      multiplicacao = true;
      visor = "${number01} *"; 
    } else if(type == 2) {
      divisao = true;
      visor = "${number01} /";
    } else if(type == 3) {
      soma = true;
      visor = "${number01} +";        
    } else if(type == 4) {
      subtracao = true;
      visor = "${number01} -";
    } else if(type == 5) {
      potencia = true;
      visor = "${number01}^";
    } 

    numbersList.clear();    
  }

  void setIgualdade(TextEditingController _textController) {   
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
      
      
        visor = "${number01} * ${number02}% =";
        _textController.text = result.toString();        
      
    } else {
      if(multiplicacao == true) {
        result = operacoes.multiplicacaoValor(number01, number02);
        
          visor = "${number01} * ${number02} =";
          _textController.text = result.toString();        
          
      } else if(divisao == true) {
        result = operacoes.divisaoValor(number01, number02);
        
          visor = "${number01} / ${number02} =";
          _textController.text = result.toString();        
        
      } else if(soma == true) {
        result = operacoes.somaValor(number01, number02);
        
          visor = "${number01} + ${number02} =";
          _textController.text = result.toString();        
        
      } else if(subtracao == true) {
        result = operacoes.subtracaoValor(number01, number02);
        
          visor = "${number01} - ${number02} =";
          _textController.text = result.toString();        
        
      } else if(potencia == true) {
        result = operacoes.potenciaValor(number01, number02);
        
          visor = "${number01}^ ${number02} =";
          _textController.text = result.toString();        
        
      } else if(raizQ == true) {
        number01 = num.parse(aux);
        result = operacoes.raizValor(number01);
        
          visor = "2√(${number01}) =";
          _textController.text = result.toString();        
        
      } else if(tangente == true) {
        number01 = num.parse(aux);
        result = operacoes.tangenteValor(number01);
        
          visor = "tan(${number01}) =";
          _textController.text = result.toString();        
        
      } else if(coseno == true) {
        number01 = num.parse(aux);
        result = operacoes.cosenoValor(number01);
        
          visor = "cos(${number01}) =";
          _textController.text = result.toString();        
        
      } else if(seno == true) {
        number01 = num.parse(aux);
        result = operacoes.senoValor(number01);
        
          visor = "sin(${number01}) =";
          _textController.text = result.toString();        
        
      } else if(log == true) {
        number01 = num.parse(aux);
        result = operacoes.logValor(number01);
        
          visor = "sin(${number01}) =";
          _textController.text = result.toString();        
        
      }
    }    
  }

  void setCaractEspecial(int sce_type, TextEditingController _textController) {
    if(sce_type == 1) {
      numbersList.clear();
      aux = 3.1415926535897932.toString();
      
        _textController.text = aux;      
      
    } else if(sce_type == 2) {
      
        porcentagem = true;
        setIgualdade(_textController);     
      
    } else if(sce_type == 3) {
      numbersList.clear();
      aux = 2.718281828459045.toString();
      
        _textController.text = aux;      
      
    } else if(sce_type == 4) {
      raizQ = true;
      setIgualdade(_textController);
    } else if(sce_type == 5) {
      tangente = true;
      setIgualdade(_textController);
    } else if(sce_type == 6) {
      coseno = true;
      setIgualdade(_textController);
    } else if(sce_type == 7) {
      seno = true;
      setIgualdade(_textController);
    } else if(sce_type == 8) {
      log = true;
      setIgualdade(_textController);
    }
  }

  void reset(TextEditingController _textController) {
    
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
    
  }
}