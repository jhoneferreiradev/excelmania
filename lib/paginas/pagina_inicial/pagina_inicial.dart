import 'package:excelmania/paginas/pagina_inicial/componentes/card_post.dart';
import 'package:excelmania/util/identidade_visual_app.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  final String title = 'Excel mania';

  final double toolbarHeight = 100;

  late IdentidadeVisualApp identidadeVisualApp;

  @override
  void initState() {
    identidadeVisualApp = IdentidadeVisualApp(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Image.asset("assets/imagens/logo-back-transparente.png"),
        titleSpacing: 8,
      ),
      body: SizedBox(
        height: screenSize.height - toolbarHeight,
        width: screenSize.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _colunaEsqueda(context)),
                  Expanded(flex: 3, child: _colunaCentral(context)),
                  Expanded(child: _colunaDireita(context)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Text("Idealizado e desenvolvido por Jhone Ferreira", textAlign: TextAlign.center)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _menuComputador(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width >= 1200) {
      return [
        TextButton(onPressed: () {}, child: const Text("Pagina inicial")),
        TextButton(onPressed: () {}, child: const Text("Tutoriais")),
        TextButton(onPressed: () {}, child: const Text("Contato")),
        TextButton(onPressed: () {}, child: const Text("Sobre")),
      ];
    } else {
      return [];
    }
  }

  Widget? _menuTabletOuCelular(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width >= 1200) {
      return null;
    }
    return Drawer();
  }

  Widget _colunaEsqueda(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: screenSize.height - toolbarHeight,
      // decoration: BoxDecoration(border: Border.all()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _tituloColunas(context, "Tutoriais"),
            for (int i = 0; i < 10; i++)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CardPost(
                    postagem: Postagem(
                        titulo: "Título teste $i",
                        dataPostagem: DateTime.now(),
                        texto: "laskjdlakjs laskjd laskjd alskdj alskdja lskdja lskdja lsdkjal skdjalskdj alskdj sad alsdkj alskdj asdalskdj as"),
                  ),
                  const Divider(endIndent: 100),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget _colunaCentral(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: screenSize.height - toolbarHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _tituloColunas(context, "Excel mania"),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Aqui, você encontrará uma variedade de tutoriais e manuais práticos para dominar o Excel, Google Planilhas e WPS. Nossa missão é fornecer guias detalhados que ajudam você a maximizar sua produtividade e eficiência, seja para resolver problemas específicos ou para aprimorar suas habilidades com essas ferramentas essenciais.",
                      style: identidadeVisualApp.textoSubtitulo,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/imagens/0003.png"),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _colunaDireita(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: screenSize.height - toolbarHeight,
      // decoration: BoxDecoration(border: Border.all()),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _tituloColunas(context, "Fale conosco"),
          ],
        ),
      ),
    );
  }

  Widget _tituloColunas(BuildContext context, String titulo) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: identidadeVisualApp.corPrimaria,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  titulo,
                  style: identidadeVisualApp.textoTitulo,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
