import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Api/api_manager.dart';

class DeleteController extends GetxController{
  TextEditingController deleteControoler =TextEditingController();

  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;

  final isError = ''.obs;
  String get _isError => isError.value;

  ApiBase apiBase = ApiBase();


  Future<void> deleteData ({ required BuildContext context, required String id} )async{
await apiBase.delete("https://65e8133d53d564627a8fc5db.mockapi.io/NoteApp/$id", 
(data) {
  
isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfull")));
},
 (error) {
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error")));
 });
  }


}