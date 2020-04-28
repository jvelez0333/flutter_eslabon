//Todas las respuestas desde el api
import 'dart:io';

import 'package:flutter_eslabon/models/Response.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ApiService  {
  
   bool _apiIsLoading=false;


  set apiIsloading (bool value)=>this._apiIsLoading=value;

  get apiIsloading=>this._apiIsLoading;

  //Realiza una peticion Get y trae el valor pasado como parametro generico...
 Future<String>  getAsync(String servicePrefix,String controller) async {

   _apiIsLoading=true;

   final resp = await  http.get('${PaginaConst.apiURL}/ $servicePrefix/$controller');

   _apiIsLoading=false;

   return resp.body;
  }
 
    //Realiza una peticion Get y trae el valor pasado como parametro generico y suministrando token...
 Future<String>  getByTokenAsync(String servicePrefix,String controller,String tokenType,String accessToken) async {

   final resp = await  http.get('${PaginaConst.apiURL}/ $servicePrefix/$controller');
 
   return  resp.body;
  }
  //Realiza una peticion post y trae el valor pasado como parametro generico...
   Future<ResponseString> postAsync(String servicePrefix,String controller,String jsonData) async {
  try { 
    final String urlBase=PaginaConst.apiURL;
    final String urlFull='$urlBase$servicePrefix$controller';

    if(1==1)
     return ResponseString(status: false, num: 1,msn:urlFull,result: null);

   final resp = await http.get(Uri.encodeFull('https://www.google.com')  );

     
       if(resp.statusCode == 200){
     final strRespuesta= ResponseString.fromString(resp.body);
     strRespuesta.result=resp.body;

     return strRespuesta;
    }
    

        } on Exception catch (_error) {
      print("throwing new error");
      ResponseString(status: false, num: 1,msn: _error.toString(),result: null);
    }
/*
   return ResponseString(
        status  :false,
        num     :resp.statusCode,
        msn     :resp.body,
        result  :'');*/
           return ResponseString(
        status  :false,
 
        result  :'');
  }

 
//Realiza una peticion post y trae el valor pasado como parametro generico y suministrando token...
Future<String>  postByTokenAsync<T>(String servicePrefix,String controller,T requestData,String tokenType,String accessToken) async{
 
   final resp = await http.post('${PaginaConst.apiURL}/ $servicePrefix/$controller',
   body:requestData,
           headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: accessToken,
        },
   );
 
   return resp.body;
  }  
}