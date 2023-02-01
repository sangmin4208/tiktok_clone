import 'package:flutter/material.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key, required this.title});

  final String title;

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int count = 0;

  @override
  void dispose() {
    print('dispose ${widget.title}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title),
          Text('count: $count'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
