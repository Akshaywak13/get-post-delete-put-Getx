import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Controoler/put_controoler.dart';

class PutScreen extends StatefulWidget {
  const PutScreen({super.key});

  @override
  State<PutScreen> createState() => _PutScreenState();
}

class _PutScreenState extends State<PutScreen> {
  final PutController putController = Get.put(PutController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: putController.titleController,
                decoration: const InputDecoration(hintText: "title"),
              ),
              TextField(
                controller: putController.descriptionController,
                decoration: const InputDecoration(hintText: "description"),
              ),
              TextField(
                controller: putController.dateController,
                decoration: const InputDecoration(hintText: "date"),
              ),
              TextField(
                controller: putController.timeController,
                decoration: const InputDecoration(hintText: "time"),
              ),
              TextField(
                controller: putController.idController,
                decoration: const InputDecoration(hintText: "id"),
              ),
              TextButton(
                  onPressed: () {
                    putController.putData(
                        context: context,
                        id: putController.idController.text,
                        title: putController.titleController.text,
                        description: putController.descriptionController.text,
                        date: putController.dateController.text,
                        time: putController.timeController.text);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
