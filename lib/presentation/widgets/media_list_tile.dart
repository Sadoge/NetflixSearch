import 'package:flutter/material.dart';
import 'package:netflix_worldwide_search/common/app_colors.dart';
import 'package:netflix_worldwide_search/data/models/media_model.dart';

class MediaListTile extends StatelessWidget {
  final MediaModel media;

  const MediaListTile({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Image.network(
            media.img,
            fit: BoxFit.fitHeight,
          ),
          title: Text(
            media.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            media.year.toString(),
          ),
          trailing: Visibility(
            visible: media.imdbrating != null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.roseWood,
                ),
                const SizedBox(height: 5),
                Text(
                  media.imdbrating != null
                      ? media.imdbrating!.toStringAsPrecision(2)
                      : "",
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildAvailableCountries()
      ],
    );
  }

  Widget _buildAvailableCountries() {
    final children = <Widget>[];

    for (var country in media.availableCountries) {
      if (country.countryCode != "more") {
        children.add(
          Image.network(
            'https://www.countryflags.io/${country.countryCode.toLowerCase()}/flat/24.png',
          ),
        );
      } else {
        children.add(Text(country.name));
      }
    }

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 5,
      spacing: 5,
      children: children,
    );
  }
}
