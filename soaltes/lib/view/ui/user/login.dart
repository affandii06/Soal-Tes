import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soaltes/provider/showhideprovider.dart';
import 'package:soaltes/service/hitapi.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  String sUsername;
  String sPassword;

  final _keylogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShowHideProvider>(
      create : (context) => ShowHideProvider(),
      child : Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _keylogin,
            child: ListView(
              children: [
                SizedBox(height: 50,),
                Center(
                  child: Image.asset('assets/logo/logo.png', width: 100, height: 100),
                ),

                SizedBox(height: 20,),
                Center(child: Text('Login Xhoezy Sekarang !!', style: GoogleFonts.poppins(fontWeight: FontWeight.bold),)),

                SizedBox(height: 10,),
                Center(child: Text('Nikmati Stok Produk Terlengkap dan Promo Special Bagi Pengguna Xhoezy',
                  style: GoogleFonts.poppins(),
                  textAlign: TextAlign.center,
                )),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: Icon(EvilIcons.sc_facebook, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 20,),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: Icon(EvilIcons.sc_google_plus, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 20,),

                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: Icon(EvilIcons.sc_twitter, color: Colors.white,),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10,),
                Center(
                  child: Text('- OR -', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, letterSpacing: 3, color: Colors.grey),),
                ),

                SizedBox(height: 20,),
                Text('Username / Email', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextFormField(
                    controller: cUsername,
                    validator: (value){
                      if(value.isEmpty){
                        return 'Please Insert Username';
                      }
                      return null;
                    },
                    onSaved: (value)=>sUsername = cUsername.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(EvilIcons.user, size: 40, color: Colors.lightBlue,),
                      hintText: 'Masukkan Username atau Email',
                      hintStyle: GoogleFonts.poppins(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                    ),
                  ),
                ),

                Text('Password', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Consumer<ShowHideProvider>(
                    builder: (context, showhide, _) => TextFormField(
                      obscureText: showhide.showhide,
                      controller: cPassword,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please Insert Password';
                        }
                        return null;
                      },
                      onSaved: (value)=>sPassword = cPassword.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(EvilIcons.lock, size: 40, color: Colors.lightBlue,),
                        hintText: 'Masukkan Password',
                        hintStyle: GoogleFonts.poppins(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: GestureDetector(
                          child: Icon(showhide.showhide ? Icons.visibility_off : Icons.visibility, color: showhide.showhide ? Colors.grey : Colors.lightBlue,),
                          onTap: (){
                            showhide.showhide = !showhide.showhide;
                          },
                        )
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Belum Punya Akun ?', style: GoogleFonts.poppins(),),
                    Text(' Daftar Disini', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                  ],
                )
              ],
            ),
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
                    child: Text('Login', style: GoogleFonts.poppins(color: Colors.white),),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                color: Colors.lightBlue,
                onPressed: (){
                  final form = _keylogin.currentState;
                  if(form.validate()){
                    form.save();
                    HitApi().LoginApi(context, sUsername, sPassword);
                  }
                }
            ),
          ),
        ),
      ),
    );
  }
}
