import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Controoler/delete.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}
DeleteController deleteController=Get.put(DeleteController());
class _DeleteScreenState extends State<DeleteScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: deleteController.deleteControoler,
              decoration: InputDecoration(
                hintText:"delete id"
              ),
            ),
            TextButton(onPressed: (){
              deleteController.deleteData(context: context, id: deleteController.deleteControoler.text);
            }, 
            child:Text("Delete"))
          ],
        ),
      ),
    );
  }
}