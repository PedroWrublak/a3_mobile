import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text(
          'Sobre o App',
          style: TextStyle(
            color: Color(0xFF6D4C41),
            fontWeight: FontWeight.bold,
            fontFamily: 'Cursive',
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE082),
        elevation: 3,
        iconTheme: const IconThemeData(color: Color(0xFF6D4C41)),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFFE082)),
              child: Text(
                'To do App',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.done),
              title: const Text('Completed'),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, '/completed'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categorias'),
              onTap: () => Navigator.pushNamed(context, '/categories'),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              'Aplicativo desenvolvido para ajudar na organização pessoal e profissional, promovendo o bem-estar e produtividade (ODS 3 e 8).',
            ),
            SizedBox(height: 20),
            Text(
              'Desenvolvido por: Pedro Vinicius Wrublak, Allex Maia, Nicolas Evertom Duarte da Silva, Guilherme Custodio Capote e Andrey Wesley Bastos de Sa',
            ),
            Text('Versão: 1.2'),
          ],
        ),
      ),
    );
  }
}
