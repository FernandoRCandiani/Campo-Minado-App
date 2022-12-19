import 'package:flutter/material.dart';
import '../components/resultado_widget.dart';
import '../components/campo_widget.dart';
import '../models/campo.dart';
import '../models/explosao_exception.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({super.key});

  void _reiniciar() {
    print('Reiniciar...');
  }

  void _abrir(Campo campo) {
    print('Abrir');
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternar Marcação');
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);
    try {
      campo.minar();
      campo.abrir();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: false,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
