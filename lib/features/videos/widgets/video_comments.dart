import 'package:flutter/material.dart';
import 'package:tiktok_clone/const/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onCloseTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/200/300?random=$index'),
              ),
              title: Text('User $index'),
              subtitle: Text('Comment $index'),
            );
          },
        ),
      ),
    );
  }
}
