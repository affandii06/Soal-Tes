import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:soaltes/provider/bottomnavprovider.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomnavProvider>(
      create: (context)=> BottomnavProvider(),
      child: Consumer<BottomnavProvider>(
        builder:(context, bottomnav, _) => Scaffold(

          body: bottomnav.page,

          floatingActionButton: FloatingActionButton(
            elevation: 2,
            backgroundColor: Colors.lightBlue,
            child: InkWell(
              child: Icon(EvilIcons.cart, size: 30,),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: BottomAppBar(
            elevation: 10,
            shape: CircularNotchedRectangle(),
            child: Container(
                height: 60,
                child : Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            children: [
                              Icon(AntDesign.home, size: 24, color: bottomnav.color1,),
                              Text('Home', style: GoogleFonts.poppins(fontSize: 10, color: bottomnav.color1),)
                            ],
                          ),
                          onTap: (){
                            bottomnav.selected = 0;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,8,70,8),
                        child: InkWell(
                          child: Column(
                            children: [
                              Icon(AntDesign.message1, size: 24, color: bottomnav.color2,),
                              Text('Message', style: GoogleFonts.poppins(fontSize: 10, color: bottomnav.color2),)
                            ],
                          ),
                          onTap: (){
                            bottomnav.selected = 1;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            children: [
                              Icon(AntDesign.notification, size: 24, color: bottomnav.color3,),
                              Text('Notification', style: GoogleFonts.poppins(fontSize: 10, color: bottomnav.color3),)
                            ],
                          ),
                          onTap: (){
                            bottomnav.selected = 2;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Column(
                            children: [
                              Icon(AntDesign.user, size: 24, color: bottomnav.color4,),
                              Text('Profile', style: GoogleFonts.poppins(fontSize: 10, color: bottomnav.color4),)
                            ],
                          ),
                          onTap: (){
                            bottomnav.selected = 3;
                          },
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
