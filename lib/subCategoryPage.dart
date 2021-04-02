import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'BlogDetailsPage.dart';

class subCategory extends StatefulWidget {
  final String typeName;

  subCategory({this.typeName});

  @override
  _subCategoryState createState() => _subCategoryState();
}

class _subCategoryState extends State<subCategory> {
  final ref = FirebaseFirestore.instance.collection("Category");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sub Category Page"),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream:
                  ref.where("catName", isEqualTo: widget.typeName).snapshots(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  List subTypeList = [];
                  subTypeList = snapshot.data.docs[0].data()["catType"];
                  return Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: subTypeList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => BlogDetailsClass(
                                              blogName: subTypeList[index])));
                                },
                                child: Card(
                                  child: Text(
                                    subTypeList[index],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ));
                            // return Card(
                            //   child: Row(
                            //     children: [
                            //       Text(subTypeList[index]),
                            //     ],
                            //   ),
                            // );
                          }),
                    ],
                  );
                } else {
                  return CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
