import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_worldwide_search/common/providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Netflix Worldwide Search"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: "Search by name",
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () async {
                  final repo = context.read(mediaRepositoryProvider);
                  final result = await repo.searchMedia(_searchController.text);
                  result.fold(
                      (error) => print(error), (data) => print(data.length));
                },
                child: Text("Search"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
