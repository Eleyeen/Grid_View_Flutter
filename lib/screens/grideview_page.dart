import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Data>> fetchData() async {
  final response =
      await http.get('https://donations.dahawwalur.org/api/getgroups');
  if (response.statusCode == 200 || response.statusCode == 400) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> data = jsonResponse['data'];
    print(data);
    return data.map((data) => new Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }

  // jsonResponse.map((data) => new Data.fromJson(data)).toList();

  // if (response.statusCode != 200) return null;
  // return List<Map<String, dynamic>>.from(json.decode(response.body)['data']);
}

class Data {
  final String id;
  final String title;

  Data({this.id, this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      title: json['name'],
    );
  }
}

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  void showData() async {
    Map data = await getData();
    print(data.toString());
  }

  final List<String> _listItem = [
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
    "assets/images/abc.jpg",
  ];
  Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();

    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data> data = snapshot.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.white70,
                      elevation: 0,
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(360),
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Image.asset(
                                    "assets/images/abc.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              data[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              data[index].id,
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    );

                    // Column(
                    //   children: <Widget>[
                    //   Container(
                    //   height: 75,
                    //   color: Colors.white,
                    //   child: Center(
                    //     child: Text(data[index].id),
                    //   ),
                    // ),
                    // Container(
                    //   height: 75,
                    //   color: Colors.white,
                    //   child: Center(
                    //     child: Text(data[index].title),
                    //   ),
                    // )
                    // ],
                    // );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  // Container(
  //       padding: EdgeInsets.all(20.0),
  //       child: Column(
  //         children: <Widget>[
  //           Expanded(
  //             child: Container(
  //               child: GridView.count(
  //                   crossAxisCount: 2,
  //                   crossAxisSpacing: 10,
  //                   mainAxisSpacing: 10,
  //                   children: _listItem.map((item) {
  //                     return Card(
  //                       color: Colors.white70,
  //                       elevation: 0,
  //                       child: Container(
  //                         child: Column(
  //                           children: <Widget>[
  //                             SizedBox(
  //                               height: 20.0,
  //                             ),
  //                             Container(
  //                               width: 50.0,
  //                               height: 50.0,
  //                               child: ClipRRect(
  //                                 borderRadius: BorderRadius.circular(360),
  //                                 child: CircleAvatar(
  //                                   backgroundColor: Colors.black,
  //                                   child: Image.asset(
  //                                     "assets/images/abc.jpg",
  //                                     fit: BoxFit.fill,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 8.0,
  //                             ),
  //                             Text(
  //                               'health care ',
  //                               style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 16.0,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               height: 3.0,
  //                             ),
  //                             Text(
  //                               'health care the  long side  ',
  //                               style: TextStyle(
  //                                 color: Colors.black87,
  //                                 fontSize: 12.0,
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     );
  //                   }).toList()),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),);

  Future<Map> getData() async {
    String url = "https://donations.dahawwalur.org/api/getgroups";

    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }

  Widget updateData() {
    return new FutureBuilder(
        future: getData(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map content = snapshot.data;
            return Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      content['data'][5]['id'].toString(),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}

//  Container(
//                  height: MediaQuery.of(context).size.height / 1.4,
//                 width: MediaQuery.of(context).size.width / 1.05,

//                 child: updateData(),
//               ),
