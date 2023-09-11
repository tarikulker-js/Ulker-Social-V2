import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/Home/Posts.dart';
import 'package:ulkersocialv2/components/Home/Stories.dart';

class MainScreenBody extends StatefulWidget {
  const MainScreenBody({super.key});

  @override
  State<MainScreenBody> createState() => _MainScreenBodyState();
}

class _MainScreenBodyState extends State<MainScreenBody> {
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
          SliverToBoxAdapter(
            child: Stories(
              loading: loading,
              updateLoading: (bool newLoading) {
                setState(() {
                  loading = newLoading;
                });
              },
            ),
          ),
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
