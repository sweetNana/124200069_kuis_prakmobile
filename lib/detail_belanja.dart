import 'package:flutter/material.dart';
import 'groceries.dart';

var informationTextStyle = TextStyle(fontFamily: 'Oxygen');

class DetailBelanja extends StatelessWidget {
  final Groceries name;
  //const DetailBelanja({Key? key, required this.name, required this.productImageUrls, required this.storeName,}) : super(key: key);

  DetailBelanja({required this.name, }); //required this.productImageUrls, required this.storeName

  @override
  Widget build(BuildContext context) {
    return DetailBelanjaMobile(name: name);
    //LayoutBuilder(
    //     builder: (BuildContext context, BoxConstraints constraints) {
    //       if (constraints.maxWidth > 800) {
    //         return DetailBelanjaWeb(
    //           name: name,
    //         );
    //       } else {
    //         return DetailBelanjaMobile(name: name);
    //       }
    //     });
  }
}

class DetailBelanjaMobile extends StatelessWidget {
  final Groceries name;

  DetailBelanjaMobile({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.network(name.productImageUrls[0]),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))),
                        //FavoriteButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: name.productImageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                name.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.store),
                      SizedBox(height: 8.0),
                      Text(
                        name.storeName,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        name.price,
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.sell),
                      SizedBox(height: 8.0),
                      Text(
                        name.discount,
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      SizedBox(height: 8.0),
                      Text(
                        name.stock,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.star),
                      SizedBox(height: 8.0),
                      Text(
                        name.reviewAverage,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FavoriteButton()
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                name.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// class DetailBelanjaWeb extends StatefulWidget {
//   final Groceries name;
//
//   DetailBelanjaWeb({required this.name});
//
//   @override
//   _DetailBelanjaWebState createState() => _DetailBelanjaWebState();
// }
//
// class _DetailBelanjaWebState extends State<DetailBelanjaWeb> {
//   final _scrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
//             child: Center(
//               child: Container(
//                 width: 1200,
//                 child: Column(
//                   children: [
//                     Text("Detail Product",
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontFamily: 'Staatliches',
//                         )),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             children: [
//                               ClipRRect(
//                                 child: Image.network(widget.name.productImageUrls[0]),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               SizedBox(height: 16),
//                               Container(
//                                 height: 150,
//                                 padding: const EdgeInsets.only(bottom: 16),
//                                 child: Scrollbar(
//                                   controller: _scrollController,
//                                   isAlwaysShown: true,
//                                   child: ListView(
//                                     controller: _scrollController,
//                                     padding: EdgeInsets.only(bottom: 16),
//                                     scrollDirection: Axis.horizontal,
//                                     children: widget.name.productImageUrls.map((url) {
//                                       return Padding(
//                                         padding: const EdgeInsets.all(4.0),
//                                         child: ClipRRect(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           child: Image.network(url),
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Card(
//                             child: Container(
//                               padding: const EdgeInsets.all(16),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   Container(
//                                     child: Text(
//                                       widget.name.name,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 30.0,
//                                         fontFamily: 'Staatliches',
//                                       ),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: <Widget>[
//                                           //Text("Store Name"),
//                                           Icon(Icons.store),
//                                           SizedBox(width: 8.0),
//                                           Text(
//                                             widget.name.storeName,
//                                             style: informationTextStyle,
//                                           ),
//                                         ],
//                                       ),
//                                       FavoriteButton(),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(Icons.monetization_on),
//                                       SizedBox(width: 8.0),
//                                       Text(
//                                         widget.name.price,
//                                         style: informationTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8.0),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(Icons.sell),
//                                       SizedBox(width: 8.0),
//                                       Text(
//                                         widget.name.discount,
//                                         style: informationTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(Icons.star),
//                                       //Text("Ratting"),
//                                       SizedBox(width: 8.0),
//                                       Text(
//                                         widget.name.reviewAverage,
//                                         style: informationTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(Icons.shopping_cart),
//                                       SizedBox(width: 8.0),
//                                       Text(
//                                         widget.name.stock,
//                                         style: informationTextStyle,
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     padding:
//                                     EdgeInsets.symmetric(vertical: 16.0),
//                                     child: Text(
//                                       widget.name.description,
//                                       textAlign: TextAlign.justify,
//                                       style: TextStyle(
//                                         fontSize: 16.0,
//                                         fontFamily: 'Oxygen',
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )));
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ));
  }
}




// import 'groceries.dart';
// import 'package:flutter/material.dart';
// import 'list_belanja.dart';
//
// class DetailBelanja extends StatefulWidget {
//   final String name;
//   final String productImageUrls;
//   final String storeName;
//   const DetailBelanja({Key? key, required this.name,required this.productImageUrls, required this.storeName,}) : super(key: key);
//
//   @override
//   _DetailBelanjaState createState() => _DetailBelanjaState();
// }
//
// class _DetailBelanjaState extends State<DetailBelanja> {
//   get onPressed => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//         actions: <Widget>[
//           IconButton(onPressed: onPressed, icon: new Icon(Icons.favorite)),
//           IconButton(onPressed: onPressed, icon: new Icon(Icons.share)),
//         ],
//       ),
//       body:Center(
//         child: Column(
//           children: [
//             Image.network(widget.productImageUrls[0]),
//             Text(widget.name),
//             Text(widget.storeName),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget _judul(){
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       child: Card(
//
//       ),
//     );
//   }
//
// }



