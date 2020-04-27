import 'dart:convert';

abstract class Response {
    bool   status=false;
    int    num=0;
    String msn='';  

    Response({
      this.status,
      this.num,
      this.msn}); 
}

class ResponseString extends Response {
 String result;

     ResponseString({
       bool   status,
       int    num,
       String msn,
       this.result
    }):super(status:status,num:num,msn:msn) ;

 
   factory ResponseString.fromString(String str)=> ResponseString.fromJson(json.decode(str));

    factory ResponseString.fromJson(Map<String, dynamic> json) => ResponseString(
        status: json["status"],
        num: json["num"],
        msn: json["msn"],
        result: json["result"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "num": num,
        "msn": msn,
        "result": result,
    };
 
}