import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Api/api_manager.dart';
import 'package:new_app/Models/get_screen.dart';

class GetController extends GetxController {
  final isLoading = false.obs;
  bool get _isLoading => isLoading.value;
  
  final isError = ''.obs;
  String get _isError => isError.value;

  final ApiBase apiBase = ApiBase();
  
  final _getModel = GetModel().obs;
  GetModel get getModel => _getModel.value;

  Future<void> getData(BuildContext context) async {
    await apiBase.get(
        "https://gxppcdmn7h.execute-api.ap-south-1.amazonaws.com/peopleManagement/leave/group/1709116070596/member/1709202217171/",
        (data) {
      isLoading(false);
_getModel.value=GetModel.fromJson(data);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Sucessfull")));
    }, (error) {
      isLoading(false);
       ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(isError.value)));
    });
  }




}
