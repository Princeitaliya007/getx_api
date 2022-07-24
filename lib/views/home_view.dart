import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controllers/home_controller.dart';
import 'package:getx_api/models/userdata_model.dart';

import '../apis/userList_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<UserDataModel>?>? allData;

  @override
  void initState() {
    allData = ApiForUser.apiForUser.userListApi();
    super.initState();
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
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<UserDataModel?> data = snapshot.data;

            ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[i]!.image.toString()),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
