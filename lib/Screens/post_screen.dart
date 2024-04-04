import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Controoler/post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Post Api"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: postController.userIdController,
                decoration: const InputDecoration(hintText: "Enter userId"),
              ),
              TextField(
                controller: postController.Idontroller,
                decoration: const InputDecoration(hintText: "Enter Id"),
              ),
              TextField(
                controller: postController.titleController,
                decoration: InputDecoration(
                  hintText: "Enter title"
                ),
                
              ),
              TextField(
                controller: postController.bodyController,
                decoration: InputDecoration(
                  hintText: "Enter body"
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    final userId =
                        int.tryParse(postController.userIdController.text);
                    final Id = int.tryParse(postController.Idontroller.text);

                    postController.postData(
                        context: context, userId: userId, Id: Id,body: postController.bodyController.text,title: postController.titleController.text);
                  },
                  child: const Text("Save"))
            ],
          ),
        ));
  }
}
