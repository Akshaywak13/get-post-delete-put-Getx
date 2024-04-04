import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/Controoler/get_controoler.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({super.key});

  @override
  State<GetScreen> createState() => _GetScreenState();
}


class _GetScreenState extends State<GetScreen> {
  final GetController getController=Get.put(GetController());

  @override
  void initState() {
    getController.getData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  

    

    return SafeArea(
child: Scaffold(
  appBar: AppBar(
    backgroundColor: Colors.blue,
    title: Text("Getx Titorial "),
  ),
  body: Column(
    children: 
    [
      _CenterWidget(),
      //Expanded(
      //   child: ListView.builder(
      //     itemCount: getController.getModel.data?.length,
      //     itemBuilder: (context,index){
      //       return ListTile(
      //         title: Column(
      //           children: [
      //             Text(getController.getModel.data?[index].approvedBy.toString()??""),
      //           ],
      //         ),
      //       );
      //   }),
      // )
    ],
  ),
),
    );
  }


  _CenterWidget(){
    return Obx(() => getController.isLoading.value?Center(child: CircularProgressIndicator(),
    ):
    getController.getModel.data!.length==0? 
    Text("data not found")
    :Expanded(child: ListView.builder(
      itemCount: getController.getModel.data?.length,
      itemBuilder: (context,index){
        return Container(
          child: Column(
            children: [
              Text(getController.getModel.data![index].approver.toString()),
            ],
          ),
        );
    }))
    );
  }
}