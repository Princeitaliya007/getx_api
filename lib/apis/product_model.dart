import 'package:dio/dio.dart';

void getApi() async {
  try {
    var response = await Dio().post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {"title": "foo", "body": "bar", "userId": 1});
    print("response --> $response");
    // var response =
    //     await Dio().post('http://192.168.29.135:3000/auth/signUp', data: {
    //   "name": "jeet env",
    //   "email": "vivexghhk.semicolon@gmail.com",
    //   "password": "jeetenv",
    //   "phoneNumber": 9714574709
    // });
  } catch (e) {
    print("object --> ${e.toString()}");
  }
}
