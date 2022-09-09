import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value); //acesso ao componente stateful
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _submitForm(),
              controller: titleController,
              decoration: InputDecoration(labelText: "Título"),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  "Nova Transação",
                  style: TextStyle(
                    fontFamily: 'Arial',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
