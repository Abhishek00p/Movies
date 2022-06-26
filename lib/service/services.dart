import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class serviceApi extends GetxController {
  var baseUrl = ''.obs;
  final _dio = Dio();
  List respList = [];
  Future<void> loadData() async {
    await dotenv.load(fileName: ".env");
    try {
      print("${dotenv.env['BASEURL']} ,${dotenv.get('KEY')}  ");
      baseUrl.value = dotenv.env['BASEURL']!;
    } catch (e) {
      print("Error at 14 $e");
    }
  }

  Future<List> searchResult(String title) async {
    respList.clear();
    
    try {
      final resp = await _dio.post(
          "${dotenv.env['BASEURL']}?s='$title'&apikey=${dotenv.get('KEY')}");

      // print(" response ${resp.data}");

      for (int i = 0; i < resp.data['Search'].length; i++) {
        print("Calling $i times");
        await searchFromTitle(resp.data['Search'][i]['Title']);
      }
      
      return respList;

    } catch (e) {
      print(" error 35 $e");
      return [];
    }
  }

  searchFromTitle(String tt) async {
    try {
      final resp = await _dio
          .post("${dotenv.env['BASEURL']}?t='$tt'&apikey=${dotenv.get('KEY')}");

      // print(" response ${resp.data}");
      // resp.data.forEach((k, v) => print(" key : $k , val:$v"));

      var arr =resp.data['Genre']!=null? resp.data['Genre'].split(','):["movie"];
      
      String myGenre = '';

      for (var item in arr) {
        myGenre += item + " |";
      }
      respList.add({
        'Title':resp.data['Title']!=null? resp.data['Title'] : "",
        'Genre': myGenre,
        'imdbRating': resp.data['imdbRating']!=null?resp.data['imdbRating']:"0.0",
        'Poster':resp.data['Poster']!=null && resp.data['Poster']!="N/A"? resp.data['Poster']:"https://tse1.mm.bing.net/th?id=OIP.5FRH9XxUi4sjbztSqcUK1QHaHa&pid=Api&P=0&w=167&h=167",
      });
    } catch (e) {
      print(" error 50 $e");
    }
  }
}

