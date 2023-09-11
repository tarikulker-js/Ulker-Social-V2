import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/Explore/Posts.dart';
import 'package:ulkersocialv2/components/Explore/Stories.dart';

class ExploreScreenBody extends StatefulWidget {
  const ExploreScreenBody({super.key});

  @override
  State<ExploreScreenBody> createState() => _ExploreScreenBodyState();
}

class _ExploreScreenBodyState extends State<ExploreScreenBody> {
  bool loading = true;

  Function? updateLoading;

  Future<void> _refresh() async {
    setState(() {
      loading = true;
    });

    if (updateLoading != null) {
      updateLoading!(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // SizedBox(height: 5),
                Posts(
                  loading: loading,
                  updateLoading: (bool newLoading) {
                    setState(() {
                      loading = newLoading;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}
