import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';
import '../models/task.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _category = 'Pessoal';

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8DC),
      appBar: AppBar(
        title: const Text(
          'Nova Tarefa',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe um título' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _description = value ?? '',
              ),
              DropdownButtonFormField<String>(
                initialValue: _category,
                items: ['Pessoal', 'Trabalho', 'Estudo']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => _category = v!,
                decoration: const InputDecoration(labelText: 'Categoria'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFE082),
                  foregroundColor: const Color(0xFF6D4C41),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newTask = Task(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: _title,
                      description: _description,
                      category: _category,
                    );
                    controller.addTask(newTask);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
