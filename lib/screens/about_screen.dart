import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Organiza+',
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
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To do App',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Aplicativo desenvolvido para ajudar na organização pessoal e profissional, promovendo o bem-estar e produtividade (ODS 3 e 8).',
            ),
            SizedBox(height: 20),
            Text('Desenvolvido por: Pedro Vinicius Wrublak, Allex Maia, Nicolas Evertom Duarte da Silva, Guilherme Custodio Capote e Andrey Wesley Bastos de Sa'),
            Text('Versão: 1.0'),
          ],
        ),
      ),
    );
  }
}
