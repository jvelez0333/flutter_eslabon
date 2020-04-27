import 'dart:convert';

class TokenRequest {
    String username;
    String password;

    TokenRequest(this.username,this.password);

    //devuelve el objeto en json
    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };

    //devuelve el objeto en string..
    String get jsonString=>json.encode(this.toJson());

    factory TokenRequest.fromString(String str)=> TokenRequest.fromJson(json.decode(str));

    factory TokenRequest.fromJson(Map<String, dynamic> json) => TokenRequest(
 json["status"],
 json["password"]
 
    );
}