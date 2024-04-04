import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Api/api_manager.dart';

class PostController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController Idontroller = TextEditingController();

  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;

  final isError = ''.obs;
  String get _isError => isError.value;

  ApiBase apiBase = ApiBase();

  Future<void> postData(
      {required BuildContext context,
      required int? userId,
      required int? Id,
      required String? title,
      required String? body
      }) async {
    var parametes = {
      "userId": userId,
      "id": Id,
      "title":title,
      "body":body
    };
    await apiBase.post("https://jsonplaceholder.typicode.com/posts", parametes,
        (data) {
      isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfull")));
    }, (error) {
      isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(isError.value)));
    });
  }
}
