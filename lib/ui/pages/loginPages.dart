import 'package:flutter_eslabon/helpers/login_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  
  LoginPage({this.username});

  final String username;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  //mis variables
 // String _username, _password;
  //bool _remeberMe;

  //controladores
  TextEditingController _controllerUsername, _controllerPassword;

  @override
  void initState() {
      super.initState();

      _controllerUsername = TextEditingController(text: widget?.username ?? "user1");
      _controllerPassword = TextEditingController(text: "123456");
    
  } 


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child:Column(
          children: <Widget>[
            Consumer<LoginState>(
              builder: (BuildContext context, LoginState value, Widget child) {
                if (value.isLoading()) {
                  return Center(
                    child: Column(children: <Widget>[
                      CircularProgressIndicator(),
                      Text(value.msnInfo)
                    ],),
                  );
                } else {
                  return child;
                }
              },
              child: formularioLoginMdo(context),
            ),            
          ],
          )
      )
    );
  }

  SingleChildScrollView formularioLoginMdo(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Icon(Icons.person, size: 50.0,
            ),
            Text('Autenticación de Usuario', style:Theme.of(context).textTheme.headline,),
            Form(
              autovalidate: true,
              child: Column( 
              children:<Widget>
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _controllerUsername,
                      decoration: InputDecoration(prefixIcon:Icon(Icons.person),labelText: 'Nombre Usuario',helperText: 'email, cédula o usuario'),  
                      validator:(value)=>(value.isEmpty) ?'Tiene que especificar un usuario':null,
                      keyboardType: TextInputType.text,    
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(), 
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField( 
                    controller: _controllerPassword,
                    decoration: InputDecoration(prefixIcon:Icon(Icons.keyboard_hide),labelText: 'Clave',helperText: 'Cédula si es la primera vez'),   
                    keyboardType: TextInputType.text,   
                    textInputAction: TextInputAction.go,
                    obscureText: true,
                    validator:(value)=>(value.isEmpty) ?'Tiene que especificar la clave':null,         
                  ),
                ),
                MaterialButton(
                  child: Text('Entrar2'),
                  onPressed: () {
                        
                        Provider.of<LoginState>(context).login(this._controllerUsername.text,this._controllerPassword.text);
                }),
              ]
            )),
            ListTile(
            title: Text('Recordar'),
            trailing: Switch.adaptive(
              onChanged: (value){

              },
              value:true, // TODO:Hacer dinamicamente.
            ),
          ),
            ],
        ),
      );
  }

  @override
  void dispose() {
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}