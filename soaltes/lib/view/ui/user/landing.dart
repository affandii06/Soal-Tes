import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:soaltes/provider/landingprovider.dart';
import 'package:soaltes/view/ui/user/login.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  @override
  Widget build(BuildContext context) {
    return Consumer<LandingProvider>(
      builder:(context, landing, _)=> Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(landing.landing['image'], height: MediaQuery.of(context).size.height*0.6,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: landing.selected == 0 ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: landing.selected == 1 ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: landing.selected == 2 ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(landing.landing['title'],
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 50,
            child: RaisedButton(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Lanjut', style: GoogleFonts.poppins(color: Colors.white),),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.lightBlue,
                onPressed: (){
                  if(landing.selected < 2){
                    landing.selected += 1;
                    print(landing.selected);
                  }else{
                    Navigator.pushReplacement(context, PageTransition(child: Login(), type: PageTransitionType.rightToLeft ));
                  }
                }
            ),
          ),
        ),
      ),
    );
  }
}
