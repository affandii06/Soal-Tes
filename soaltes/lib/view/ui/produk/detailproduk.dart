import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:soaltes/provider/produkprovider.dart';
import 'package:soaltes/provider/quantityprovider.dart';

class DetailProduk extends StatefulWidget {
  int index;
  DetailProduk(this.index);
  @override
  _DetailProdukState createState() => _DetailProdukState(this.index);
}

class _DetailProdukState extends State<DetailProduk> {
  int index;
  _DetailProdukState(this.index);

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
    final quantity = Provider.of<QuantityProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Detail Produk', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue),),
        ),
        actions: [
          IconButton(
              icon: Icon(EvilIcons.heart, color: Colors.lightBlue, size: 30,),
              onPressed: (){

              }
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                  child: produk.produk.data[index].image == null ? Image.asset('assets/preview/nopreview.png', height: 400, fit: BoxFit.cover,) : Image.memory(base64Decode(produk.produk.data[index].image.toString().substring(23)), height: 400, fit: BoxFit.cover,),
                ),

                produk.produk.data[index].promoRate < produk.produk.data[index].normalRate ? Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset('assets/preview/promo.png',height: 100, width: 100,),
                )
                : Text('')
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Text(produk.produk.data[index].itemName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.lightBlue),),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingBarIndicator(
                      rating: 4.5,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 24.0,
                      direction: Axis.horizontal,
                    ),

                    Text(' 4.5/5', style: GoogleFonts.poppins(),),
                  ],
                ),

                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 50,
                    child: produk.produk.data[index].promoRate < produk.produk.data[index].normalRate ?
                    Column(
                      children: [
                        Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].normalRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14,decoration: TextDecoration.lineThrough ),),
                        Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].promoRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue, fontSize: 18),),
                      ],
                    )
                        : Align(
                        alignment: Alignment.center,
                        child: Text(NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0).format(produk.produk.data[index].normalRate).toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue, fontSize: 18),)
                    ),
                  ),
                ),

                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Card(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Icon(Icons.remove),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 5,
                          ),
                          onTap: (){
                            if(quantity.quantity > 0){
                              quantity.quantity -= 1;
                            }
                          },
                        ),

                        SizedBox(width: 10,),

                        Text(quantity.quantity.toString(),style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),),

                        SizedBox(width: 10,),
                        InkWell(
                          child: Card(
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Center(
                                child: Icon(Icons.add),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                            ),
                            elevation: 5,
                          ),
                          onTap: (){
                            quantity.quantity += 1;
                          },
                        ),
                      ],
                    ),

                    RaisedButton(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Center(child: Text('Beli', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),)),
                      ),
                      color: Colors.lightBlue,
                      onPressed: (){

                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
