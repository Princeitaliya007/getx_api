import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_api/models/userdata_model.dart';

import '../apis/userList_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<UserDataModel>?> allData;

  @override
  void initState() {
    super.initState();
    allData = ApiForUser.apiForUser.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Users List"),
      ),
      body: FutureBuilder(
        future: allData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            print("-------snapshot: =   ${snapshot.data}");
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            print("-------snapshot: =   ${snapshot.data}");
            List<UserDataModel?> data = snapshot.data;
            return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    onTap: () {
                      Get.toNamed('/detailView', arguments: data[i]);
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[i]!.image.toString()),
                    ),
                    title: Text("${data[i]!.fName} ${data[i]!.lName}"),
                    subtitle: Text("${data[i]!.email}"),
                    trailing: Text("${data[i]!.id}"),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // print("-------snapshot: =   ${snapshot.data}");
        },
      ),
    );
  }
}
