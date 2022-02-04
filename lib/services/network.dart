//import 'package:dio/dio.dart';
// Dio dio = new Dio();
// For Inserting Data in Api
//   Future postData() async {
//     try {
//       final String pathurl = 'https://jsonplaceholder.typicode.com/posts';
//       dynamic data = {'title': userName, 'body': number, 'userId': 0};
//
//       var response = await dio.post(pathurl,
//           data: data,
//           options: Options(
//               headers: {'Content-type': 'application/json; charset=UTF-8'}));
//       return response.data;
//     } catch (e) {
//       print(e);
//     }
//   }
// void printApiData()async{
//   await postData().then((value) => print(value));
// }