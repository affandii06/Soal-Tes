import 'package:flutter/foundation.dart';
import 'package:soaltes/model/modelproduk.dart';
import 'package:soaltes/service/hitapi.dart';

class ProdukProvider with ChangeNotifier {

  Produk produk = Produk();
  bool loading = true;
  getDataProduk(context)async{
    produk = await HitApi().getDataProduk();
    loading = false;
    notifyListeners();
  }

}