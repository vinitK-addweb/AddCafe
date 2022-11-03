import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';
import './Constants.dart';
import './Global.dart';

class API {
  API._privateConstructor();
  static final API instance = API._privateConstructor();

  Future<bool> _checkInternet() async{
    try{
      showLoaderGetX();
      var connectivityResult = await (Connectivity().checkConnectivity());
      hideLoader();
      if(connectivityResult == ConnectivityResult.mobile){
        debugPrint('mobile data is connected');
        return true;
      }else if(connectivityResult == ConnectivityResult.wifi){
        debugPrint('wifi is connected');
        return true;
      }else{
        debugPrint('unable to connect to internet');
        return false;
      }
    }catch(error){
      debugPrint(error.toString());
      error.toString().showError();
      hideLoader();
      return false;
    }
  }

  Future<dynamic> get({required String endPoint}) async {
    final url = Uri.parse(endPoint);
    final headers = {
      'Authorization':'Bearer $kTOKENSAVED'
    };

    try{
      showLoaderGetX();
      final response = await http.get(url, headers: headers);
      hideLoader();

      final data = jsonDecode(response.body);
      return data;

    }catch(error){
      hideLoader();
      debugPrint(error.toString());
      'Error: ${error.toString()}'.showError();
      return null;
    }

  }

  Future<dynamic> post({required String endPoint, required Map<String, dynamic> params}) async{
    try{
      final url = Uri.parse(endPoint);
      final headers = {
        'Authorization' : kTOKENSAVED
      };
      showLoaderGetX();
      final response = await http.post(url, headers: headers, body: params);
      hideLoader();
      final data = jsonDecode(response.body);
      return data;
    }catch(error){
      debugPrint(error.toString());
      'Error: ${error.toString()}'.showError();
    }
  }


}
