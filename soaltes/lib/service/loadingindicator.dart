import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator {

  ShowLoading(context){
    showDialog(
      context: context,
      builder: (context){
        return Dialog(
          child: SizedBox(
            height: 100,
            width: 30,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50,20,50,20),
              child: CircularProgressIndicator(),
            )
          ),
          insetPadding: EdgeInsets.only(left: 100, right: 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
        );
      }
    );
  }

}