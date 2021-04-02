import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subcategory_demo/Model/product.dart';

import 'widget/listViewBuilder.dart';

class BlogDetailsClass extends StatefulWidget {
  final String blogName;

  BlogDetailsClass({this.blogName});


  @override
  _BlogDetailsClassState createState() => _BlogDetailsClassState();
}

class _BlogDetailsClassState extends State<BlogDetailsClass> {
  final  blogRef = FirebaseFirestore.instance.collection("BlogDetails");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Blag DetailsPage"),
      ),
      body:StreamBuilder(
        stream: blogRef.where("subCatName",isEqualTo: widget.blogName).snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasData)  {
            List<Product> productList = snapshot.data.docs.map((e) => Product.fromJson(e.data())).toList();
            return Column(
              children: [
                Container(

                  child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productList.length,
                        itemBuilder: (context,index){
                        return
                          Column(
                            children: [
                              Center(child: Text(productList[index].blogSubName)),
                              SizedBox(height: 20,),
                              Text("Blog Desc",style: TextStyle(color: Colors.redAccent)),
                              Container(
                                height: 50,
                                child: blogDesc(blogdesc: productList[index].blogDesc),
                              ),
                            ],
                          );
                    }),
                ),
              ],
            );
          }
          else{
            return CircularProgressIndicator();}
        }
        ,
      ),
    );
  }
}
