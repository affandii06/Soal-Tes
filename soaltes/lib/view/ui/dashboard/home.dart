import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soaltes/view/widget/produkwidget.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Xhoezy', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue),),
        ),
        actions: [
          IconButton(
            icon: Icon(EvilIcons.search, color: Colors.lightBlue, size: 30,),
            onPressed: (){

            }
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('Our Produk', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),),
            Text('Best Quality, Best Service, Best For You', style: GoogleFonts.poppins(),),
            

            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,10),
                  child: Text('All Produk', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
            ),

            SizedBox(height: 10,),
            ProdukWidget()
          ],
        ),
      ),
    );
  }
}
