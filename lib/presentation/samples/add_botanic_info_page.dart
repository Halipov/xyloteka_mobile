import 'package:flutter/material.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/botanic_description.dart';
import 'package:xyloteka/data/models/classis.dart';
import 'package:xyloteka/data/models/division.dart';
import 'package:xyloteka/data/models/family.dart';
import 'package:xyloteka/data/models/genus.dart';
import 'package:xyloteka/data/models/names.dart';
import 'package:xyloteka/data/models/ordo.dart';
import 'package:xyloteka/data/models/sample.dart';
import 'package:xyloteka/data/models/sample_property.dart';
import 'package:xyloteka/data/models/species.dart';
import 'package:xyloteka/data/repository/classis_repository.dart';
import 'package:xyloteka/data/repository/division_repository.dart';
import 'package:xyloteka/data/repository/family_repository.dart';
import 'package:xyloteka/data/repository/genus_repository.dart';
import 'package:xyloteka/data/repository/ordo_repository.dart';
import 'package:xyloteka/data/repository/sample_repository.dart';
import 'package:xyloteka/data/repository/species_repository.dart';

class AddBotanicInfoPage extends StatefulWidget {
  @override
  _AddBotanicInfoPageState createState() => _AddBotanicInfoPageState();
}

class _AddBotanicInfoPageState extends State<AddBotanicInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final divisonRepo = DivisionRepository();
  final classisRepo = ClassisRepository();
  final ordoRepo = OrdoRepository();
  final familyRepo = FamilyRepository();
  final genusRepo = GenusRepository();
  final speciesRepo = SpeciesRepository();
  final sampleRepo = SampleRepository();
  Sample? sample = Sample();
  Division division = Division();
  Classis classis = Classis();
  Ordo ordo = Ordo();
  Family family = Family();
  Genus genus = Genus();
  Species species = Species();
  Names names = Names();
  BotanicDescription botanicDescription = BotanicDescription();
  SampleProperty property = SampleProperty();
  List<Division> listDivision = [];
  List<Classis> listClassis = [];
  List<Ordo> listOrdo = [];
  List<Family> listFamily = [];
  List<Genus> listGenus = [];
  List<Species> listSpecies = [];

  void getDivision() async {
    listDivision = await divisonRepo.fetchModelList();
    var clas = await classisRepo.fetchModelList();
    listOrdo = await ordoRepo.fetchModelList();
    var fam = await familyRepo.fetchModelList();
    var gen = await genusRepo.fetchModelList();
    var spec = await speciesRepo.fetchModelList();

    setState(() {
      listClassis = clas;
      listOrdo = ord;
      listFamily = fam;
      listGenus = gen;
      listSpecies = spec;
      listDivision = div;
      division = listDivision[0];
      ordo = listOrdo[0];
      family = listFamily[0];
      genus = listGenus[0];
      species = listSpecies[0];
      classis = listClassis[0];
    });
  }

  @override
  void initState() {
    getDivision();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    final textEditingController1 = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      buildTitle('Name'),
                      textFormField(
                        'Trade Name',
                        onSaved: (value) => names.tradeName = value,
                      ),
                      const SizedBox(height: 10),
                      textFormField(
                        'Alt Name',
                        onSaved: (value) => names.altName = value,
                      ),
                      const SizedBox(height: 10),
                      buildTitle('Property'),
                      textFormField(
                        'density',
                        onSaved: (value) => property.density = value,
                      ),
                      const SizedBox(height: 10),
                      textFormField(
                        'hardness',
                        onSaved: (value) => property.hardness = value,
                      ),
                      const SizedBox(height: 10),
                      textFormField(
                        'shrinkage',
                        onSaved: (value) => property.shrinkage = value,
                      ),
                      const SizedBox(height: 10),
                      buildTitle('Botanic'),
                      const Text('Division: '),
                      Container(
                        child: DropdownButton<Division>(
                          isExpanded: true,
                          value: division,
                          onChanged: (newValue) {
                            setState(() {
                              division = newValue!;
                            });
                          },
                          items: listDivision
                              .map(
                                (e) => DropdownMenuItem<Division>(
                                  child: Text(
                                    e.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Text('Classis: '),
                      Container(
                        child: DropdownButton<Classis>(
                          isExpanded: true,
                          value: classis,
                          onChanged: (newValue) {
                            setState(() {
                              classis = newValue!;
                            });
                          },
                          items: listClassis
                              .map(
                                (e) => DropdownMenuItem<Classis>(
                                  child: Text(
                                    e.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Text('Ordo: '),
                      Container(
                        child: DropdownButton<Ordo>(
                          isExpanded: true,
                          value: ordo,
                          onChanged: (newValue) {
                            setState(() {
                              ordo = newValue!;
                            });
                          },
                          items: listOrdo
                              .map(
                                (e) => DropdownMenuItem<Ordo>(
                                  child: Text(
                                    e.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Text('Family: '),
                      Container(
                        child: DropdownButton<Family>(
                          isExpanded: true,
                          value: family,
                          onChanged: (newValue) {
                            setState(() {
                              family = newValue!;
                            });
                          },
                          items: listFamily
                              .map(
                                (e) => DropdownMenuItem<Family>(
                                  child: Text(
                                    e.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Text('Genus: '),
                      Container(
                        child: DropdownButton<Genus>(
                          isExpanded: true,
                          value: genus,
                          onChanged: (newValue) {
                            setState(() {
                              genus = newValue!;
                            });
                          },
                          items: listGenus
                              .map(
                                (e) => DropdownMenuItem<Genus>(
                                  child: Text(
                                    e.name!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                      textFormField(
                        'Place',
                        onSaved: (value) => sample?.place = value,
                      ),
                      textFormField(
                        'Description',
                        onSaved: (value) => sample?.description = value,
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            //sample?.property = property;
            botanicDescription
              ..classis = classis
              ..divisio = division
              ..family = family
              ..genus = genus
              ..ordo = ordo
              ..species = species;
            sample?.names = names;
            sample?.collectDate = DateTime.now();
            sample?.botanicDescription = botanicDescription;
            sample?.properties = property;
            print(sample);
            sampleRepo.postModel(sample!);
          }
        },
      ),
    );
  }
}

Widget textFormField(
  String text, {
  required Function(String?) onSaved,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: text,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      print(value);
    },
    onSaved: onSaved,
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
