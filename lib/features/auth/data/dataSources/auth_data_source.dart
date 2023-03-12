import 'dart:convert';
import 'dart:io';

import 'package:clean_arch_linkedin/core/errors/error.dart';
import 'package:clean_arch_linkedin/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/storage/storage.dart';

abstract class AuthDataSource {
  Future<String> handleLogin(String email, String password);
  Future<UserModel> getUserInfo(String ownerId);
  Future<String> changeProfilePic(File file);
  Future<String> handleRegister(
    String email,
    String password,
    String name,
    String lastName,
  );
}

const uri = 'http://localhost:3500/auth';
const uri1 = 'http://localhost:3500/auth/changePic';

class AuthDataSourceImp implements AuthDataSource {
  final http.Client client;

  AuthDataSourceImp({required this.client});
//---------------------------------------------------------
  @override
  Future<String> handleLogin(String email, String password) async {
    http.Response res = await http.post(
      Uri.parse('$uri/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    Map jsonResponse = json.decode(res.body);
    print(res.body);

    if (res.statusCode == 200) {
      String userId = jsonResponse['user']['_id'];
      _saveUserId(userId);
      return jsonResponse['token'];
    } else {
      throw ServerExeption();
    }
  }
  //---------------------------------------------------------

  Future<void> _saveUserId(String userId) async {
    await Storage().secureStorage.write(key: 'userId', value: userId);
  }
  //---------------------------------------------------------

  @override
  Future<UserModel> getUserInfo(String ownerId) async {
    // String? ownerId = await Storage().secureStorage.read(key: 'userId');
//we need user id dio
    // if (ownerId == null) {
    //   throw ServerExeption();
    // }
    // http.Response res = await http.get(
    //   Uri.parse(
    //     'http://localhost:3500/auth/userInfo',
    //   ),
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     // 'x-auth-token': userProvider.user.token,
    //   },
    // );

    // List jsonResponse = jsonDecode(res.body);
    // var h = '';
    // //  UserModel h =
    // // jsonResponse.map((dynamic e) => PostModel.fromMap(e)).toList();

    // print(h);
    // if (res.statusCode == 200) {
    //   return h;
    // } else {
    throw ServerExeption();
    // }
  }
  //---------------------------------------------------------

  @override
  Future<String> changeProfilePic(File file) async {
    String res = "Unexpected Error!";
    try {
      String? ownerId = await Storage().secureStorage.read(key: 'userId');

      if (ownerId == null) {
        throw ServerExeption();
      }
      final uriv = Uri.parse(uri1);
      var reqq = http.MultipartRequest('PUT', uriv);
      reqq.files.add(
        await http.MultipartFile.fromPath(
          'image',
          file.path,
        ),
      );
      reqq.fields['ownerId'] = ownerId;

      var resss = await reqq.send();
      print(resss);
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //---------------------------------------------------------

  @override
  Future<String> handleRegister(
    String email,
    String password,
    String name,
    String lastName,
  ) async {
    String resp = "Unexpected Error!";
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
          'lastName': lastName
        }),
      );

      if (res.statusCode == 201) {
        return 'User created!';
      } else {
        throw ServerExeption();
      }
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
