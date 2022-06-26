import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileapp/search.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ctrnl = Get.put(Data());
  TabController? _tabController;
  var selectedInd = 0;
  @override
  void initState() {
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: selectedInd);
    callServices().then((v) async {
      ctrnl.respo = v;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121421),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SearchPage());
                        },
                        child: Container(
                            height: 25,
                            width: 25,
                            child: SvgPicture.asset(
                              "assets/Icons/search.svg",
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 65,
                  child: DefaultTabController(
                      initialIndex: selectedInd,
                      length: 4,
                      child: TabBar(
                        indicatorColor: Colors.blueAccent,
                        indicator: UnderlineTabIndicator(
                            insets: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 60.0)),
                        isScrollable: true,
                        physics: BouncingScrollPhysics(),
                        tabs: [
                          Container(
                            height: 40,
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 28, 32, 49)),
                              child: Center(
                                  child: Text("Insominia",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                            ),
                          ),
                          Container(
                            height: 35,
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 28, 32, 49)),
                              child: Center(
                                  child: Text("Depression",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                            ),
                          ),
                          Container(
                            height: 35,
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 28, 32, 49)),
                              child: Center(
                                  child: Text("Baby Sleep",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                            ),
                          ),
                          Container(
                            height: 35,
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 28, 32, 49)),
                              child: Center(
                                  child: Text("For Children",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ))),
                            ),
                          )
                        ],
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommanded",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  TextButton(onPressed: () {}, child: Text("View All"))
                ],
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, inx) {
                    return Container(
                      height: 150,
                      child: Stack(children: [
                        Positioned(
                          child: Image.asset(
                            "assets/background1.png",
                            height: 150,
                            width: 210,
                          ),
                        ),
                        Positioned(
                            bottom: 35,
                            left: 30,
                            child: Row(children: [
                              SvgPicture.asset(
                                "assets/Icons/headphone.svg",
                                height: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "assets/Icons/tape.svg",
                                height: 16,
                              )
                            ])),
                        Positioned(
                            top: 35,
                            left: 30,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "data",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            )),
                      ]),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Recent",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
              GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2),
                  itemBuilder: (context, ind) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: AssetImage("assets/backgroun2.png"),
                              fit: BoxFit.cover)),

                      child: Stack(
                        children: [
                          Positioned(
                              top: 15,
                              child: Text(
                                "data ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
