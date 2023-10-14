import 'package:flutter/material.dart';
import 'package:ulkersocialv2/components/Explore/Posts.dart';

class ExploreScreenBody extends StatefulWidget {
  const ExploreScreenBody({super.key});

  @override
  State<ExploreScreenBody> createState() => _ExploreScreenBodyState();
}

class _ExploreScreenBodyState extends State<ExploreScreenBody> {
  bool loading = true;
  int page = 0;
  int storiesPage = 0;
  final controller = ScrollController();
  Function? updateLoading;

  Future<void> _refresh() async {
    setState(() {
      loading = true;
      print("Refresh atıldı ve Sıfırlandı !");
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
      //print(" \n max: ${controller.position.maxScrollExtent} \n offset: ${controller.offset} \n loading: ${loading}");

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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // SizedBox(height: 5),
                Posts(
                  controller: controller,
                  loading: loading,
                  page: page,
                  updatePage: (int newPage) {
                    if (mounted) {
                      setState(() {
                        page = newPage;
                      });
                    }
                  },
                  updateLoading: (bool newLoading) {
                    if (mounted) {
                      setState(() {
                        loading = newLoading;
                      });
                    }
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
