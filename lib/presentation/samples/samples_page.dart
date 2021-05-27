import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:xyloteka/data/models/sample.dart';
import 'package:http/http.dart' as http;
import 'package:xyloteka/data/repository/sample_repository.dart';
import 'package:xyloteka/presentation/routes/router.gr.dart';
import 'package:xyloteka/presentation/samples/add_botanic_info_page.dart';

// class SamplesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text('reks'),
//       ),
//     );
//   }
// }

class SamplesPage extends StatefulWidget {
  @override
  _SamplesPageState createState() => _SamplesPageState();
}

class _SamplesPageState extends State<SamplesPage> {
  late Future<List<Sample>> samples;
  int _currentIndex = 0;
  List<Widget> _children = [];
  SampleRepository sampleRepository = SampleRepository();

  @override
  void initState() {
    samples = sampleRepository.fetchModelList();
    _children = [
      SamplePage(
        samples: samples,
      ),
      SearchPage(),
    ];
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samples'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Sample',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => context.pushRoute(
          AddBotanicInfoRoute(),
        ),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({
    Key? key,
    required this.samples,
  }) : super(key: key);

  final Future<List<Sample>> samples;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Sample>>(
        future: samples,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushRoute(
                      BotanicInfoRoute(
                        item: snapshot.data![index],
                      ),
                    );
                  },
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  // ignore: lines_longer_than_80_chars
                                  'species: ${snapshot.data![index].botanicDescription.species.nameLat}',
                                ),
                                Text(
                                  // ignore: lines_longer_than_80_chars
                                  'Description: ${snapshot.data![index].description}',
                                ),
                                Text(
                                  // ignore: lines_longer_than_80_chars
                                  'Family: ${snapshot.data![index].botanicDescription.family.name}',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
