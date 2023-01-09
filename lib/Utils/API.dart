import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';
import '../Utils/Constant.dart';
import '../Utils/Global.dart';
import 'dart:typed_data';

class API {
  API._privateConstructor();

  static final API instance = API._privateConstructor();

  final _kBaseURL = 'https://cafe.addwebprojects.com/api/v1/';

  Future<bool> _checkInternet() async {
    try {
      showLoaderGetX();
      var connectivityResult = await (Connectivity().checkConnectivity());
      hideLoader();
      if (connectivityResult == ConnectivityResult.mobile) {
        debugPrint('Mobile data is connected');
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        debugPrint('WiFi connected');
        return true;
      } else {
        debugPrint('Internet is not connected');
        'Internet is not connected'.showError();
        return false;
      }
    } catch (error) {
      debugPrint(error.toString());
      error.toString().showError();
      hideLoader();
      return false;
    }
  }

// ---------------------------- Get request ---------------
  Future<dynamic> get({required String endPoint, required isHeader}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');
    // print("url sdfd============>>>>>>$url");
    // final headers = {'Authorization': 'Bearer $kTOKENSAVED'};
    Map<String, String> header = {};

    if (isHeader) header = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      showLoaderGetX();
      final response = await http.get(url, headers: header);
      // print("resddd" + response.body.toString());
      hideLoader();
      final parsed = jsonDecode(response.body);
      // print("resddd" + parsed.toString());
      if (response.statusCode == 403) {
        '${parsed['message']}'.showError();
      }
      return parsed;
    } on Exception {
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-$error');
      return null;
    }
  }

  // ---------------------------- Get request ---------------
  Future<dynamic> getwithouLoader(
      {required String endPoint, required isHeader}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');
    // print("url sdfd============>>>>>>$url");
    // final headers = {'Authorization': 'Bearer $kTOKENSAVED'};
    Map<String, String> header = {};

    if (isHeader) header = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      // showLoaderGetX();
      final response = await http.get(url, headers: header);
      // print("resddd" + response.body.toString());
      // hideLoader();
      final parsed = jsonDecode(response.body);
      // print("resddd" + parsed.toString());
      if (response.statusCode == 403) {
        '${parsed['message']}'.showError();
      }
      return parsed;
    } on Exception {
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-$error');
      return null;
    }
  }

  // --------------------- Delete request -------------------->

  Future<Map<String, dynamic>?> delete(
      {required String endPoint, required bool isHeader}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');

    Map<String, String> header = {};
    if (isHeader) header = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      showLoaderGetX();
      final response = await http.delete(url, headers: header);
      hideLoader();

      final Map parsed = json.decode(response.body);
      return parsed as Map<String, dynamic>;
    } on Exception {
      // hideLoader();
      // debugPrint('Exception is:-' + exception.toString());
      // return null;
    } catch (error) {
      hideLoader();

      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  // --------------------- patch request -------------------->
  Future<Map<String, dynamic>?> patch(
      {required String endPoint,
      required Map<String, dynamic> params,
      required bool isHeader}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');

    Map<String, String> header = {};
    if (isHeader) header = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      showLoaderGetX();
      final response = await http.patch(url, headers: header, body: params);
      hideLoader();
      debugPrint('Response status: ${response.body}');

      final Map<String, dynamic> parsed = json.decode(response.body);
      // print('userprofile===========$kTOKENSAVED ${parsed}');
      return parsed as Map<String, dynamic>;
    } on Exception {
      hideLoader();
      // debugPrint('Exception is:-' + exception.toString());
      // return null;
    } catch (error) {
      hideLoader();

      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  // ----------------------- Post Request--------------------->

  Future<Map<String, dynamic>?> post(
      {required String endPoint,
      required Map<String, dynamic> params,
      required bool isHeader}) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');

    Map<String, String> header = {};
    if (isHeader) header = {'Authorization': 'Bearer $kTOKENSAVED'};

    try {
      showLoaderGetX();
      final response = await http.post(url, headers: header, body: params);
      hideLoader();
      debugPrint('Response status: ${response}');

      final Map<String, dynamic> parsed = json.decode(response.body);

      print('userprofile===========$kTOKENSAVED ${parsed}');
      return parsed;
    } on Exception {
      // hideLoader();
      // debugPrint('Exception is:-' + exception.toString());
      // return null;
    } catch (error) {
      hideLoader();

      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> postImage({
    required String endPoint,
    required Map<String, dynamic> params,
    required String fileParams,
    required file,
  }) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('$_kBaseURL$endPoint');
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $kTOKENSAVED';

    params.forEach((key, value) {
      request.fields[key] = value;
    });

    try {
      showLoaderGetX();

      request.files
          .add(await http.MultipartFile.fromPath(fileParams, file.path));
      final response = await request.send();

      hideLoader();

      final res = await http.Response.fromStream(response);
      print(res.body);

      final Map parsed = json.decode(res.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-' + exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }

  postImageData(imageData) async {
    if (!await _checkInternet()) {
      return null;
    }

    final url = Uri.parse('${_kBaseURL}uploadImage');
    final request = http.MultipartRequest('POST', url);

    try {
      showLoaderGetX();

      // request.files.add(await http.MultipartFile.fromPath(fileParams, file.path));

      request.files.add(http.MultipartFile.fromBytes('image', imageData));
      final response = await request.send();

      hideLoader();
      ;

      final res = await http.Response.fromStream(response);
      print(res.body);

      final Map parsed = json.decode(res.body);
      return parsed as Map<String, dynamic>;
    } on Exception catch (exception) {
      hideLoader();
      debugPrint('Exception is:-' + exception.toString());
      return null;
    } catch (error) {
      hideLoader();
      debugPrint('Error is:-' + error.toString());
      return null;
    }
  }
}

class APIEndPoints {
  APIEndPoints._privateConstructor();

  static final APIEndPoints instance = APIEndPoints._privateConstructor();

  final kLogin = 'accounts/login/';
  final kSignup = 'accounts/signup/';
  final KWishlist = 'catalogue/wishlist/';
}
