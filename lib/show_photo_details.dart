
import 'package:flutter/material.dart';

class showPhotoDetails extends StatelessWidget {
  const showPhotoDetails({super.key, required this.url, required this.title, required this.id,});

  final String? url;
  final String? title;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo details'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Center(
          child: Column(
            children: [
              Image.network(url ?? ''),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text('Title : ${title ?? 'Unknow'}'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('ID: ${id ?? 'Unknow'}'),
            ],
          ),
        ),
      ),
    );
  }
}
