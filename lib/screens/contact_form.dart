import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

import '../database/dao/contact_dao.dart';

const _textoBotaoConfirmar = 'Criar';
const _titleAppBar = 'Novo contato';
const _labelNome = 'Nome completo';
const _labelConta = 'Número da conta';

class ContactForm extends StatefulWidget {


  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_titleAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Editor(
                labelText: _labelNome,
                textInputType: TextInputType.text,
                controller: _nameController,
              ),
            ),
            Editor(
              labelText: _labelConta,
              controller: _accountNumberController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => createContact(context),
                  child: const Text(_textoBotaoConfirmar),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void createContact(BuildContext context) {
    final ContactDao _dao = ContactDao();
    if (_nameController.text.isNotEmpty &&
        _accountNumberController.text.isNotEmpty) {
      final String name = _nameController.text;
      final int accountNumber = int.parse(_accountNumberController.text);

      final Contact newContact = Contact(0, name, accountNumber);
      _dao.save(newContact).then((id) => Navigator.pop(context));
    }
  }
}
