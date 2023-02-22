import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/const/gaps.dart';
import 'package:tiktok_clone/const/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;
  final _scrollController = ScrollController();
  void _onCloseTap() {
    Navigator.of(context).pop();
  }

  _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(Sizes.size14)),
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('22796 comments'),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _onCloseTap,
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.size12),
                      child: ListView.separated(
                        controller: _scrollController,
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: Sizes.size20,
                                  backgroundImage: NetworkImage(
                                    'https://picsum.photos/200/300?random=$index',
                                  ),
                                ),
                                Gaps.h20,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comment $index',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      Gaps.v4,
                                      Text(
                                        'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      Gaps.v4,
                                      Text(
                                        '1h',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Gaps.h10,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.heart,
                                      size: Sizes.size20,
                                    ),
                                    Gaps.v4,
                                    Text(
                                      '1.2k',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Gaps.v20;
                        },
                      ),
                    ),
                  ),
                ),
                SafeArea(
                  bottom: true,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: Sizes.size8,
                      left: Sizes.size12,
                      right: Sizes.size12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size20,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/200/300?random=1',
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size48,
                            child: TextField(
                              onTap: () {
                                _onStartWriting();
                              },
                              minLines: null,
                              maxLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                  hintText: 'Add a comment...',
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.size8),
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                    vertical: Sizes.size12,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: Sizes.size8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.at,
                                          size: Sizes.size20,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h14,
                                        FaIcon(
                                          FontAwesomeIcons.gift,
                                          size: Sizes.size20,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h14,
                                        FaIcon(
                                          FontAwesomeIcons.faceSmile,
                                          size: Sizes.size20,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h14,
                                        if (_isWriting)
                                          GestureDetector(
                                            onTap: _stopWriting,
                                            child: FaIcon(
                                              FontAwesomeIcons.paperPlane,
                                              size: Sizes.size20,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
