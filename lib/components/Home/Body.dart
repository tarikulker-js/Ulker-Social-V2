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
  int page = 0;
  int storiesPage = 0;
  final controller = ScrollController();
  Function? updateLoading;

  Future<void> _refresh() async {
    setState(() {
      loading = true;
      page = 0;
    });

    if (updateLoading != null) {
      updateLoading!(true);
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    
    controller.addListener(() { 
      if (controller.position.maxScrollExtent == controller.offset && !loading) {
        setState(() {
          page = page + 1;
          
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverToBoxAdapter(
            child: Stories(
              loading: loading,
              updateLoading: (bool newLoading) {
                setState(() {
                  loading = newLoading;
                  page = 0;
                });
              },
              setPage: (int newPage) {
                if (mounted) {
                  setState(() {
                    storiesPage = newPage;
                  });
                }
              },
              page: storiesPage,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // SizedBox(height: 5),
                Posts(
                  controller: controller,
                  loading: loading,
                  page: page,
                  updateLoading: (bool newLoading) {
                    setState(() {
                      loading = newLoading;
                      page = 0;
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
