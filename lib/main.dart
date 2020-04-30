import 'package:flutter_eslabon/helpers/login_state.dart';
import 'package:flutter_eslabon/repositories/postRepository.dart';
import 'package:flutter_eslabon/ui/pages/loginPages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helpers/pageTransitions/add_page_transition.dart';
import 'helpers/pageTransitions/scale_page_route.dart';
//TODO:dar permisos necesarios en el manifiesto de android y ios
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginState>(
          create: (BuildContext context) => LoginState(),
        ),
        ProxyProvider<LoginState, PostRepository>(
          update: (_, LoginState value, __) {
            if (value.isLoggedIn()) {
              return PostRepository(value.currentUser().tokenResponse.token);
            }
            return null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/test1') {
           
            return MaterialPageRoute(builder: (BuildContext context) {
              return TestPage();
            });
          } else if (settings.name == '/test2') {
 

            return AddPageTransition(
              page: TestPage(),
            );
          }
          return null;
        },
        routes: {
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        },
      ),
    );
  }
}


class HomePage extends StatelessWidget
 {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title:Text('Home Page')),
      body: Center(
        child:Text('Bienvenido')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(context,ScalePageRoute(widget:LoginPage()));

         // Navigator.pushNamed(context, '/loginPage');

        },
        child: Icon(Icons.person),
        ),
    );
  }
}



class TestPage extends StatefulWidget
 {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( title:Text('Test Page')),
      body: Center(
        child:Text('Bienvenido')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(context,ScalePageRoute(widget:LoginPage()));

         // Navigator.pushNamed(context, '/loginPage');

        },
        child: Icon(Icons.person),
        ),
    );
  }
}
