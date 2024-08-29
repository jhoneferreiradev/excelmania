import 'package:excelmania/util/identidade_visual_app.dart';
import 'package:excelmania/util/utilidades_data.dart';
import 'package:flutter/material.dart';

class Postagem {
  String titulo;
  DateTime dataPostagem;
  String texto;

  Postagem({
    required this.titulo,
    required this.dataPostagem,
    required this.texto,
  });

  String get dataPostagemFormatada => converterDataPara_ddMMyyyy(dataPostagem);
}

class CardPost extends StatefulWidget {
  final Postagem postagem;

  const CardPost({required this.postagem, super.key});

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  late IdentidadeVisualApp identidadeVisualApp;

  @override
  void initState() {
    identidadeVisualApp = IdentidadeVisualApp(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.list_alt, color: identidadeVisualApp.corPrimaria, size: 25),
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.postagem.titulo,
                      style: identidadeVisualApp.textoSubtitulo.apply(
                        color: identidadeVisualApp.corPrimaria,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.postagem.dataPostagemFormatada,
                      style: identidadeVisualApp.textoComum.apply(fontWeightDelta: FontWeight.bold.value),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.postagem.texto.padLeft(50)}...",
                      style: identidadeVisualApp.textoComum,
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
