import 'package:flutter/cupertino.dart';
import 'groceries.dart';
import 'package:flutter/material.dart';
import 'detail_belanja.dart';

class ListBelanja extends StatelessWidget {
  //final Groceries name, productImageUrls, storeName;
  //const ListBelanja({Key? key}) : super(key: key);
  //ListBelanja({required this.name, required this.productImageUrls, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Center'),
        backgroundColor: Colors.red[300],
      ),
      body: ListView.builder(
          itemBuilder: (context, index){
        final Groceries name = groceryList[index];

        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return DetailBelanja(name: name);
            }));
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  name.productImageUrls[0],
                  width: 200.0,
                ),
                Text(
                    name.name,
                    style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  name.storeName,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: groceryList.length,
      ),
    );
  }
}
