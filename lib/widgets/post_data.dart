import 'package:flutter/material.dart';
import 'package:flutter_trio/model/post_model.dart';

class PostData extends StatelessWidget {
  const PostData({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          post.user!.name!,
          style: TextStyle(
            fontSize: size * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          post.user!.email!,
          style: TextStyle(
            fontSize: size * 0.04,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          post.content!,
          style: TextStyle(
            fontSize: size * 0.04,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message),
            ),
          ],
        ),
      ]),
    );
  }
}
