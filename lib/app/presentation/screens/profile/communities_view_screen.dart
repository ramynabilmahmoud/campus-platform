import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_communities_widget.dart';

class CommunitiesViewScreen extends StatelessWidget {
  const CommunitiesViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomCommunitiesWidget(communityName: "CCNA R&S I"),
          CustomCommunitiesWidget(communityName: "Database Programming I"),
        ],
      ),
    );
  }
}
