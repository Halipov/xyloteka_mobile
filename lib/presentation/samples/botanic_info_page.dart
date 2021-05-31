import 'package:flutter/material.dart';
import 'package:xyloteka/data/models/sample.dart';

class BotanicInfoPage extends StatelessWidget {
  final Sample? item;

  const BotanicInfoPage({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${item?.names?.tradeName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: const Icon(
                Icons.photo,
                size: 200,
              ),
            ),
            info('Trade Name', item?.names?.tradeName),
            info('Alt Name', item?.names?.altName),
            info('Trade Name', item?.names?.tradeName),
            const Text(
              'Botanic info:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            info('Division', item?.botanicDescription?.divisio!.name),
            info('classis', item?.botanicDescription?.classis!.name),
            info('ordo', item?.botanicDescription?.ordo!.name),
            info('family', item?.botanicDescription?.family!.name),
            info('species', item?.botanicDescription?.species!.nameRus),
            const Text(
              'Property:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            info('density', item?.properties?.density),
            info('hardness', item?.properties?.hardness),
            info('shrinkage', item?.properties?.shrinkage),
            const Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Text(
                  '${item?.description}',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget info(String attribute, String? value) {
  return Row(
    children: [
      Expanded(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: '$attribute: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
              TextSpan(
                text: value,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
