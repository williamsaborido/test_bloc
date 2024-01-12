import 'package:flutter/material.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({super.key});

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cardController = TextEditingController();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o nome';
    }

    return null;
  }

  String? _validateCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe o número do cartão';
    }

    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Adicionar cliente',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _nameController,
              validator: _validateName,
              decoration: const InputDecoration(
                hintText: 'Nome',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _cardController,
              validator: _validateCard,
              decoration: const InputDecoration(
                hintText: 'Número do cartão',
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.of(context)
                        .pop((_nameController.text, _cardController.text));
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
