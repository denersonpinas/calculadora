import 'dart:math';

class OperacoesFunc {
  
  dynamic somaValor(dynamic sv_parmOne, dynamic sv_parmTwo) {
    return sv_parmOne + sv_parmTwo;
  }

  dynamic subtracaoValor(dynamic sv_parmOne, dynamic sv_parmTwo) {
    return sv_parmOne - sv_parmTwo;
  }

  dynamic divisaoValor(dynamic dv_parmOne, dynamic dv_parmTwo) {
    return dv_parmOne / dv_parmTwo;
  }

  dynamic multiplicacaoValor(dynamic mv_parmOne, dynamic mv_parmTwo) {
    return mv_parmOne * mv_parmTwo;
  }

  dynamic porcentValor(dynamic pv_parmOne, dynamic pv_parmTwo, int pv_type) {
    if(pv_type == 0) {
      return  pv_parmOne * (pv_parmTwo / 100);
    } else if(pv_type == 1) {
      return pv_parmOne - (pv_parmOne * (pv_parmTwo / 100));
    } else if(pv_type == 2) {
      return pv_parmOne + (pv_parmOne * (pv_parmTwo / 100));
    }    
  }

  dynamic raizValor(dynamic rv_parmOne) {
    return sqrt(rv_parmOne);
  }

  dynamic tangenteValor(dynamic tv_parmOne) {
    return tan(tv_parmOne);
  }

  dynamic senoValor(dynamic sv_parmOne) {
    return sin(sv_parmOne);
  }  

  dynamic cosenoValor(dynamic cv_parmOne) {
    return cos(cv_parmOne);
  }

  dynamic logValor(dynamic lv_parmOne) {
    return log(lv_parmOne);
  }

  dynamic potenciaValor(dynamic pv_parmOne, dynamic pv_parmTwo) {
    return pow(pv_parmOne, pv_parmTwo);
  }
}