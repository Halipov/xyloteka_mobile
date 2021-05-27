import 'package:flutter/material.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/division.dart';
import 'package:xyloteka/data/repository/classis_repository.dart';
import 'package:xyloteka/data/repository/division_repository.dart';
import 'package:xyloteka/data/repository/family_repository.dart';
import 'package:xyloteka/data/repository/genus_repository.dart';
import 'package:xyloteka/data/repository/ordo_repository.dart';
import 'package:xyloteka/data/repository/species_repository.dart';

class AddBotanicInfoPage extends StatefulWidget {
  @override
  _AddBotanicInfoPageState createState() => _AddBotanicInfoPageState();
}

class _AddBotanicInfoPageState extends State<AddBotanicInfoPage> {
  var divisonRepo = DivisionRepository();
  var classisRepo = ClassisRepository();
  var ordoRepo = OrdoRepository();
  var familyRepo = FamilyRepository();
  var geunsRepo = GenusRepository();
  var speciesRepo = SpeciesRepository();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    final textEditingController1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    buildTitle('Name'),
                    textFormField(textEditingController1, 'Trade Name'),
                    const SizedBox(height: 10),
                    textFormField(textEditingController1, 'Alt Name'),
                    const SizedBox(height: 10),
                    buildTitle('Property'),
                    textFormField(textEditingController1, 'density'),
                    const SizedBox(height: 10),
                    textFormField(textEditingController1, 'hardness'),
                    const SizedBox(height: 10),
                    textFormField(textEditingController1, 'shrinkage'),
                    const SizedBox(height: 10),
                    buildTitle('Botanic'),
                    FutureBuilder<List<Division>>(
                      builder: (context, items) {
                        if (items.hasData) {}
                        return const LinearProgressIndicator();
                      },
                    ),
                    const SizedBox(height: 10),
                    textFormField(textEditingController1, 'Place'),
                    const SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

Widget textFormField(TextEditingController controller, String text) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: text,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      print(value);
    },
  );
}

Text buildTitle(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  );
}
