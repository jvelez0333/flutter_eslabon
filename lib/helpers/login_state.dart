
import 'package:flutter/material.dart';
import 'package:flutter_eslabon/models/AutenticateResponse.dart';
import 'package:flutter_eslabon/models/TokenRequest.dart';
import 'package:flutter_eslabon/services/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class LoginState with ChangeNotifier {
  SharedPreferences _prefs;

  bool _loggedIn = false;
  bool _loading = true;
  String _msnInfo='';

  ResultAutenticateResponse _user;

  
  LoginState() {
    loginState();
  }

  get isLoggedIn => _loggedIn;

  bool isLoading() => _loading;

 //informacion que va dando el sistema
  get msnInfo=>_msnInfo;
  set msnInfo(String value){
    _msnInfo=value;
    notifyListeners();
  }

  ResultAutenticateResponse currentUser() => _user;

  void login(String userName, String password) async {

    _loading = true;

    _msnInfo='Enviando datos...';
    notifyListeners();

    final responseAutencation = await _handleSignIn(userName,password);

    _user=responseAutencation.result;

    _loading = false;
    if (_user != null) {

      _msnInfo='Guardando configuración...';
      notifyListeners();

      _prefs.setBool(AutenticationResponseConst.isLoggedIn, true);
      _prefs.setString(AutenticationResponseConst.userName,_user.userMin.userName);
      _prefs.setString(AutenticationResponseConst.token,_user.tokenResponse.inString);  
      _prefs.setString(AutenticationResponseConst.menuPrincipal,_user.menuPrincipalInString);
      
      _loggedIn = true;

      notifyListeners();

    } else {
       _msnInfo=responseAutencation.msn;
      _loggedIn = false;
      notifyListeners();
    }
  }
  Future<AutenticationResponse> _handleSignIn(String userName, String password) async {
      final myToken=TokenRequest(userName,password);
      final dataJson=myToken.jsonString;
      final api =ApiService();
 
 
     final resp= await api.postAsync('/Api','/Account/CreateToken',dataJson);

     if(resp.status==false){
       return AutenticationResponse(status: false, num: resp.num,msn: resp.msn,result: null);
     }

    print("signed in " + resp.result);
    
    return resp.status==false?null: AutenticationResponse.fromString(resp.result);
       
  }
  void loginState() async {

    _prefs = await SharedPreferences.getInstance();
      
      //final remeberMe       =   _prefs.getBool(AutenticationResponseConst.remember);
      final userName          =   _prefs.getString(AutenticationResponseConst.userName);
      final token             =   _prefs.getString(AutenticationResponseConst.token);  
      final menuPrincipalStr  =   _prefs.getString(AutenticationResponseConst.menuPrincipal);
      
      if(userName!=null && token!=null && menuPrincipalStr!=null){

         final userMin   = UserMin(userName: userName);

          this._user= ResultAutenticateResponse(
                              userMin       : userMin, 
                              menuPrincipal : List<MenuPrincipal>(),
                              tokenResponse: TokenResponse(token: token)
                              );

          this._user.setListMenuByString =menuPrincipalStr;
        
      }else{
        this._user=null;
      }

      _loggedIn = _user != null;
      _loading = false;
      notifyListeners();
  }
}