import 'package:flutter/material.dart';
import 'package:flutter_trio/widgets/postField.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_trio/widgets/post_data.dart';
import '../controller/post_controller.dart';
import 'package:get/get.dart';
import '../widgets/postField.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final TextEditingController textController = TextEditingController();
  final PostController postController = Get.put(PostController());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'ForumApp',
            style: TextStyle(
              fontSize: size * 0.08,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostFeild(
                  hintText: 'What are u looking for?',
                  controller: widget.textController,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () async {
                      await widget.postController.createPost(
                          content: widget.textController.text.trim());
                      widget.textController.clear();
                      PostController().getAllPosts();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                    ),
                    child: Obx(() {
                      return widget.postController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Post',
                              style: TextStyle(
                                fontSize: size * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                    })),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  return widget.postController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.postController.posts.value.length,
                          itemBuilder: (context, index) {
                            return PostData(
                              post: widget.postController.posts.value[index],
                            );
                          },
                        );
                })
              ],
            ),
          ),
        ));
  }
}
