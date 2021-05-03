import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alert {

  AlertSuccess(BuildContext context, String text){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, size: 100, color: Colors.green,),
                SizedBox(height: 10,),
                Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                SizedBox(height: 10,),
                RaisedButton(
                  child: Text('OK', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),),
                  color: Colors.green,
                  onPressed: (){
                    Navigator.pop(context);
                  }
                )
              ],
            ),
          ),
        );
      }
    );
  }

  AlertFailed(BuildContext context, String text){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Container(
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info, size: 100, color: Colors.red,),
                  SizedBox(height: 10,),
                  Text(text, style: GoogleFonts.poppins(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  SizedBox(height: 10,),
                  RaisedButton(
                      child: Text('OK', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.white),),
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      }
                  )
                ],
              ),
            ),
          );
        }
    );
  }

}