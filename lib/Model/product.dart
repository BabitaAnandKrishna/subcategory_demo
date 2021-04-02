class Product {
  String blogSubID;
  String blogSubName;
  String catId;
  String catName;
  String subCatName;
  List blogType;
  List blogDesc;

  Product({this.blogSubID,this.blogDesc,this.blogSubName,this.blogType,this.catId,this.catName,this.subCatName});

  Product.fromJson(Map <String,dynamic> json){
    catId = json['catId'];
    catName= json['catName'];
    subCatName= json['subCatName'];
    blogSubID= json['blogSubID'];
    blogSubName= json['blogSubName'];
    blogType= json['blogType'];
    blogDesc= json['blogDesc'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catName'] = this.catName;
    data['catId'] = this.catId;
    data['subCatName'] = this.subCatName;
    data['blogSubID'] = this.blogSubID;
    data['blogSubName'] = this.blogSubName;
    data['blogType'] = this.blogType;
    data['blogDesc'] = this.blogDesc;

  }
}

