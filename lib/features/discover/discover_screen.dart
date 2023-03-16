import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: const Text('Discover'),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              splashFactory: NoSplash.splashFactory,
              tabs: <Widget>[
                for (final tab in tabs)
                  Tab(
                    child: Text(tab),
                  ),
              ],
            ),
          ),
          body: TabBarView(children: [
            GridView.builder(
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 16,
              ),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade300,
                );
              },
            ),
          ])),
    );
  }
}
