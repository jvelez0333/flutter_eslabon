// To parse this JSON data, do
//
//     final autenticateResponse = autenticateResponseFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_eslabon/models/Response.dart';

String autenticateResponseToJson(AutenticationResponse data) => json.encode(data.toJson());

class AutenticationResponse implements Response{
    bool status;
    int num;
    String msn;
    ResultAutenticateResponse result;

    AutenticationResponse({
        this.status,
        this.num,
        this.msn,
        this.result,
    });

    factory AutenticationResponse.fromString(String str)=> AutenticationResponse.fromJson(json.decode(str));

    factory AutenticationResponse.fromJson(Map<String, dynamic> json) => AutenticationResponse(
        status: json["status"],
        num: json["num"],
        msn: json["msn"],
        result: json["status"]?ResultAutenticateResponse.fromJson(json["result"]):null,
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "num": num,
        "msn": msn,
        "result": result.toJson(),
    };
}

class ResultAutenticateResponse {
    TokenResponse tokenResponse;
    List<MenuPrincipal> menuPrincipal;
    UserMin userMin;
    List<Suscripcione> suscripciones;

    ResultAutenticateResponse({
        this.tokenResponse,
        this.menuPrincipal,
        this.userMin,
        this.suscripciones,
    });
    
    //para optener un menu convertido en string
    String  get  menuPrincipalInString  => json.encode(List<dynamic>.from(this.menuPrincipal.map((x) => x.toJson())));

    factory ResultAutenticateResponse.fromJson(Map<String, dynamic> json) => ResultAutenticateResponse(
        tokenResponse: TokenResponse.fromJson(json["tokenResponse"]),
        menuPrincipal: List<MenuPrincipal>.from(json["menuPrincipal"].map((x) => MenuPrincipal.fromJson(x))),
        userMin: UserMin.fromJson(json["userMin"]),
        suscripciones: List<Suscripcione>.from(json["suscripciones"].map((x) => Suscripcione.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tokenResponse": tokenResponse.toJson(),
        "menuPrincipal": List<dynamic>.from(menuPrincipal.map((x) => x.toJson())),
        "userMin": userMin.toJson(),
        "suscripciones": List<dynamic>.from(suscripciones.map((x) => x.toJson())),
    };

    //asigna el menu principal mendiante un usuario.
    set setListMenuByString(String str) => this.menuPrincipal= List<MenuPrincipal>.from(json.decode(str).map((x) => MenuPrincipal.fromJson(x)));

}

class MenuPrincipal {
    int menuTipo;
    String codigo;
    String icono;
    String titulo;
    String descripcion;
    String pageName;
    bool autorizado;

    MenuPrincipal({
        this.menuTipo,
        this.codigo,
        this.icono,
        this.titulo,
        this.descripcion,
        this.pageName,
        this.autorizado,
    });

    factory MenuPrincipal.fromJson(Map<String, dynamic> json) => MenuPrincipal(
        menuTipo: json["menuTipo"],
        codigo: json["codigo"],
        icono: json["icono"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        pageName: json["pageName"],
        autorizado: json["autorizado"],
    );

    Map<String, dynamic> toJson() => {
        "menuTipo": menuTipo,
        "codigo": codigo,
        "icono": icono,
        "titulo": titulo,
        "descripcion": descripcion,
        "pageName": pageName,
        "autorizado": autorizado,
    };
}

class Suscripcione {
    int suscripcionTipo;
    int nivelCascada;
    int suscripcionId;
    String titulo;
    String descripcion;
    int entidadId;

    Suscripcione({
        this.suscripcionTipo,
        this.nivelCascada,
        this.suscripcionId,
        this.titulo,
        this.descripcion,
        this.entidadId,
    });

    factory Suscripcione.fromJson(Map<String, dynamic> json) => Suscripcione(
        suscripcionTipo: json["suscripcionTipo"],
        nivelCascada: json["nivelCascada"],
        suscripcionId: json["suscripcionId"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        entidadId: json["entidadId"],
    );

    Map<String, dynamic> toJson() => {
        "suscripcionTipo": suscripcionTipo,
        "nivelCascada": nivelCascada,
        "suscripcionId": suscripcionId,
        "titulo": titulo,
        "descripcion": descripcion,
        "entidadId": entidadId,
    };
}

class TokenResponse {
    String token;
    DateTime expiration;

    TokenResponse({
        this.token,
        this.expiration,
    });

    //para optener un token convertido en string
    String  get  inString  => json.encode(this.toJson());

    factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        token: json["token"],
        expiration: DateTime.parse(json["expiration"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration.toIso8601String(),
    };
}

class UserMin {
    String id;
    String userName;
    String nombre1;
    String nombre2;
    String apellido1;
    String apellido2;
    String email;

    UserMin({
        this.id,
        this.userName,
        this.nombre1,
        this.nombre2,
        this.apellido1,
        this.apellido2,
        this.email,
    });

    factory UserMin.fromJson(Map<String, dynamic> json) => UserMin(
        id: json["id"],
        userName: json["userName"],
        nombre1: json["nombre1"],
        nombre2: json["nombre2"],
        apellido1: json["apellido1"],
        apellido2: json["apellido2"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "nombre1": nombre1,
        "nombre2": nombre2,
        "apellido1": apellido1,
        "apellido2": apellido2,
        "email": email,
    };
}
