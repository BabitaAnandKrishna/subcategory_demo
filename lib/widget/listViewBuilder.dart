import 'package:flutter/material.dart';
import 'package:subcategory_demo/Model/product.dart';
class blogDesc extends StatefulWidget {
  final List blogdesc;
  blogDesc({this.blogdesc});

  @override
  _blogDescState createState() => _blogDescState();
}

class _blogDescState extends State<blogDesc> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.blogdesc.length,
        itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(widget.blogdesc[index],style: TextStyle(fontSize:20),)),
        );
        }
    );
  }
}
