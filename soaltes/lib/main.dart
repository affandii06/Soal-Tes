import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:soaltes/provider/landingprovider.dart';
import 'package:soaltes/provider/produkprovider.dart';
import 'package:soaltes/provider/quantityprovider.dart';
import 'package:soaltes/view/ui/user/landing.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LandingProvider>(create: (context)=>LandingProvider()),
        ChangeNotifierProvider<ProdukProvider>(create: (context)=>ProdukProvider()),
        ChangeNotifierProvider<QuantityProvider>(create: (context)=>QuantityProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Xhoezy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Timer> startsplash()async{
    return Timer(Duration(seconds: 2), gotonext);
  }

  gotonext(){
    Navigator.pushReplacement(context, PageTransition(child: Landing(), type: PageTransitionType.rightToLeft));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startsplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child : Image.asset('assets/logo/logo.png', width: 200, height: 200,)
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
