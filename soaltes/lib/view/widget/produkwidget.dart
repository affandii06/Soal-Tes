import 'dart:convert';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soaltes/provider/produkprovider.dart';
import 'package:soaltes/view/ui/produk/detailproduk.dart';

class ProdukWidget extends StatefulWidget {
  @override
  _ProdukWidgetState createState() => _ProdukWidgetState();
}

class _ProdukWidgetState extends State<ProdukWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final produk = Provider.of<ProdukProvider>(context, listen: false);
    produk.getDataProduk(context);
  }

  @override
  Widget build(BuildContext context) {
    final produk = Provider.of<ProdukProvider>(context);
    return produk.loading ? Center(child: CircularProgressIndicator(),) : GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.57,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
        ),
        itemCount: produk.produk.data.length,
        itemBuilder: (BuildContext context, int index){
          return OpenContainer(
            transitionDuration: Duration(milliseconds: 500),
            closedElevation: 0,
            closedBuilder:(context, action) => Card(
              color: Colors.white,
              elevation: 5,
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        child: produk.produk.data[index].image == null ? Image.asset('assets/preview/nopreview.png', height: 150, fit: BoxFit.fitHeight,) : Image.memory(base64Decode(produk.produk.data[index].image.toString().substring(23)), height: 150, fit: BoxFit.fitHeight,),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 40,
                        child: Center(
                          child: Text(produk.produk.data[index].itemName.length < 30 ? produk.produk.data[index].itemName : produk.produk.data[index].itemName.substring(0,28) + '. . .',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 36,
                        child: produk.produk.data[index].promoRate < produk.produk.data[index].normalRate ?
                          Column(
                            children: [
                              Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].normalRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10,decoration: TextDecoration.lineThrough ),),
                              Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].promoRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue, ),),
                            ],
                          )
                          : Align(
                            alignment: Alignment.center,
                            child: Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].normalRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue),)
                          ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RatingBarIndicator(
                            rating: 4.5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                          ),

                          Text(' 4.5/5', style: GoogleFonts.poppins(fontSize: 10),)
                        ],
                      )
                    ],
                  ),
                  produk.produk.data[index].promoRate < produk.produk.data[index].normalRate ? Align(
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                      child: Image.asset('assets/preview/promo.png',height: 50, width: 50,)
                    ),
                  )
                  : Text('')
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            openBuilder: (context, action) => DetailProduk(index),
          );
        }
    );
  }
}
