import 'package:flutter/material.dart';

import '../../../../configs/colors.dart';
import '../../../widgets/spacer.dart';

// TODO: Theme Condition
class NewsCard extends StatelessWidget {
  final ImageProvider thumbnail;
  final String time;
  final String title;

  const NewsCard({
    Key? key,
    required this.title,
    required this.time,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: _buildContent(context),
          ),
          const HSpacer(36),
          Image(
            image: thumbnail,
            width: 110,
            height: 66,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const VSpacer(6),
        Text(
          time,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
