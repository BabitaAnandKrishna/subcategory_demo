import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:subcategory_demo/subCategoryPage.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    final ref = FirebaseFirestore.instance.collection("Category");

    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap:(){
                            // WidgetsBinding.instance.addPostFrameCallback((_) {
                            //   Navigator.of(context)
                            //       .pushReplacementNamed(snapshot.data.docs[index].data()["catName"]);
                            // });
                            Navigator.push(context, MaterialPageRoute(builder:(_) =>
                                subCategory(typeName: snapshot.data.docs[index].data()["catName"])));
                            // print(snapshot.data.docs[index].data()["catName"]);
                          },


                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(snapshot.data.docs[index].data()["catName"],
                                  style: TextStyle(
                                    fontSize: 15
                                  ),),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  )
                ],
              ),
            );
          }
          else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
