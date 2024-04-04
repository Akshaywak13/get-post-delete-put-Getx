import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Api/api_manager.dart';

class PutController extends GetxController{
  TextEditingController titleController =TextEditingController();
   TextEditingController descriptionController =TextEditingController();
    TextEditingController dateController =TextEditingController();
     TextEditingController timeController =TextEditingController();
      TextEditingController idController =TextEditingController();


 final isLoading = false.obs;
  bool get _isLoading => isLoading.value;

  final isError = ''.obs;
  String get _isError => isError.value;

  ApiBase apiBase = ApiBase();
  
  Future<void> putData({required BuildContext context, required String id ,required String title,required String description, required String date,required String time })async{
var parameters={
  "id":id,
  "title":title,"description":description,"date":date,"time":time

};

    await apiBase.put("https://65e8133d53d564627a8fc5db.mockapi.io/NoteApp/$id",

    parameters,

     (data) {

isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Successfull")));
     },
      (error) {
isLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(isError.value)));
      });
  }

}