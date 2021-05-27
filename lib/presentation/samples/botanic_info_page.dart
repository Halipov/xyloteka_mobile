import 'package:flutter/material.dart';
import 'package:xyloteka/data/models/sample.dart';

class BotanicInfoPage extends StatelessWidget {
  final Sample item;

  const BotanicInfoPage({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.names.tradeName),
      ),
    );
  }
}
