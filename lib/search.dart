import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/service/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class Data extends GetxController {
  bool isSearchBox = false;
  var title = 'shade'.obs;
  var respo;
  var ttitleResponse;
}

class _SearchPageState extends State<SearchPage> {
  final _getCntl = Get.put(Data());
  final _Searchcontroler = TextEditingController();
  final _dio = Dio();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var titleResponse;
    return Scaffold(
        body: _getCntl.respo != null
            ? Container(
                padding: EdgeInsets.all(15),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Home",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Go Back",
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 18),
                              ))
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 50,
                          child: TextFormField(
                            controller: _Searchcontroler,
                            onSaved: (ss) {
                              _getCntl.title.value = ss.toString();
                            },
                            onEditingComplete: () {
                              _getCntl.title.value = _Searchcontroler.text;
                            },
                            onFieldSubmitted: (s) {
                              _getCntl.title.value = s;
                            },
                            onChanged: (val) {
                              _getCntl.title.value = val;
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final _obj = serviceApi();
                                      var returnList = await _obj
                                          .searchResult(_Searchcontroler.text);
                                   
                                      setState(() {
                                      
                                        _getCntl.respo = returnList;
                                        _getCntl.ttitleResponse = returnList;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    )),
                                hintText: "Search your Favorite movies",
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 120,
                        child: !_getCntl.isSearchBox
                            ? ListView.builder(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.all(8),
                                itemCount: _getCntl.respo.length,
                                itemBuilder: (context, index) {
                              
                                  if (titleResponse == null) {
                                    titleResponse = _getCntl.respo;
                                    
                                  } else {
                                  }
                                  return SizedBox(
                                    height: 140,
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            bottom: 5,
                                            child: Container(
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  60,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color.fromARGB(
                                                          255, 198, 196, 196),
                                                      offset: Offset(1, 1),
                                                      blurRadius: 25,
                                                    )
                                                  ],
                                                  color: Colors.white),
                                            )),
                                        Positioned(
                                            left: 25,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 120,
                                                  width: 110,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Image.network(
                                                      titleResponse[index]
                                                          ['Poster'],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  width: 150,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                          titleResponse[index]
                                                              ['Title'],
                                                          overflow:
                                                              TextOverflow.clip,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: titleResponse[index]
                                                                              [
                                                                              'Title']
                                                                          .length >
                                                                      25
                                                                  ? 14
                                                                  : 18)),
                                                      Text(
                                                        titleResponse[index]
                                                            ['Genre'],
                                                        style: TextStyle(
                                                            fontSize: titleResponse[index]
                                                                            [
                                                                            'Genre']
                                                                        .length >
                                                                    20
                                                                ? 12
                                                                : 16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            color: Colors.grey),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Container(
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .lightBlue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                              child: Text(titleResponse[
                                                                          index]
                                                                      [
                                                                      'imdbRating'] +
                                                                  " IMDB")))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],

                                    ),
                                  );
                                })
                            : Text("Wait"),
                      ),
                    ],
                  ),
                ))
            : Center(
                child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Please Wait"),
                ],
              )));
  }
}

callServices() async {
  final cntrl = Get.put(Data());
  var resp;
  final _servic = serviceApi();
  await _servic.loadData();

  resp = await _servic.searchResult(cntrl.title.value);
  print(" 101 $resp");
  return resp;
}
