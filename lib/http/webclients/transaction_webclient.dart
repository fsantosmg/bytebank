import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient{
  Future<List<Transaction>> findAll() async {
    final Response response = await client
        .get(Uri.http(uri, transactionsEndPoint))
        .timeout(const Duration(seconds: 5));
    List<Transaction> transactions = _toTransactions(response);

    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);
    final Response response = await client.post(Uri.http(uri, transactionsEndPoint),
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: transactionJson);
    final Map<String, dynamic> json = jsonDecode(response.body);

    final Map<String, dynamic> contactJson = json['contact'];
    return Transaction(
        json['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = [];

    for (Map<String, dynamic> transactionJson in decodedJson) {
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      Transaction transaction = _toJson(transactionJson, contactJson);
      transactions.add(transaction);
    }
    return transactions;
  }

  Transaction _toJson(Map<String, dynamic> transactionJson, Map<String, dynamic> contactJson) {
    final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ));
    return transaction;
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accoutNumber': transaction.contact.accountNumber
      }
    };
    return transactionMap;
  }
}
