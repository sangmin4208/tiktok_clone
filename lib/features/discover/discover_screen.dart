import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/gaps.dart';
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
            title: const Text(
              "Discover",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size20,
              ),
            ),
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
                childAspectRatio: 9 / 21,
              ),
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size4),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage(
                          placeholder:
                              const AssetImage('assets/images/placeholder.png'),
                          image: NetworkImage(
                              "https://picsum.photos/seed/$index/200/200"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "lorem ipsum dolor sit amet lorem ipsum dolor sit ametlorem ipsum dolor sit amet",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16 + Sizes.size2,
                      ),
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: Sizes.size14,
                            backgroundImage: NetworkImage(
                                "https://picsum.photos/seed/$index/200/200"),
                          ),
                          Gaps.h5,
                          const Expanded(
                            child: Text(
                              "lorem ipsum dolor sit amet",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size16,
                              ),
                            ),
                          ),
                          const FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size14,
                            color: Colors.grey,
                          ),
                          Gaps.h2,
                          const Text(
                            "1.2M",
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ])),
    );
  }
}
