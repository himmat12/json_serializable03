import 'package:flutter/material.dart';
import 'package:json_serializable03/model/district_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DistrictListPage extends StatefulWidget {
  @override
  _DistrictListPageState createState() => _DistrictListPageState();
}

class _DistrictListPageState extends State<DistrictListPage> {
  String url;
  List data = [];
  var response;
  bool isLoading = true;

  List<District> districtList = [];

  Future<List<District>> getDistrict() async {
    url = "https://data.nepalcorona.info/api/v1/districts";
    response = await http.get(url);
    data = json.decode(response.body);

    setState(() {
      districtList = data.map((json) => District.fromJson(json)).toList();
      isLoading = false;
    });
    return districtList;
  }

  @override
  void initState() {
    super.initState();
    getDistrict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON Serialization 03.1"),
      ),
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: districtList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(districtList[index].title_en +
                          "( " +
                          districtList[index].title_np +
                          " )"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Text("bbox : "),
                          Text(districtList[index].bbox[0].toString()),
                          Text(districtList[index].bbox[1].toString()),
                          Text(districtList[index].bbox[2].toString()),
                          Text(districtList[index].bbox[3].toString()),
                          Divider(),
                          Text("coordinates : "),
                          Text("lat : " +
                              districtList[index]
                                  .centroid
                                  .coordinates[0]
                                  .toString()),
                          Text("lng : " +
                              districtList[index]
                                  .centroid
                                  .coordinates[1]
                                  .toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
