import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:netflix_worldwide_search/common/app_colors.dart';
import 'package:netflix_worldwide_search/common/providers.dart';
import 'package:netflix_worldwide_search/data/models/media_model.dart';
import 'package:netflix_worldwide_search/presentation/widgets/media_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  List<MediaModel> _mediaList = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Netflix Worldwide Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                    setState(() {
                      _isLoading = true;
                      _mediaList.clear();
                    });

                    final repo = context.read(mediaRepositoryProvider);
                    final result =
                        await repo.searchMedia(_searchController.text);

                    result.fold(
                      (error) {
                        print(error);
                        setState(() {
                          _isLoading = false;
                        });
                      },
                      (data) {
                        setState(() {
                          _mediaList.addAll(data);
                          _isLoading = false;
                        });
                      },
                    );
                  },
                  child: Text("Search"),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _mediaList.isEmpty
                      ? Center(child: Text("No media found for this query"))
                      : ListView.separated(
                          itemCount: _mediaList.length,
                          separatorBuilder: (context, index) => const Divider(
                            height: 20,
                            color: AppColors.codGrey,
                          ),
                          itemBuilder: (context, index) {
                            final media = _mediaList[index];
                            return MediaListTile(media: media);
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
