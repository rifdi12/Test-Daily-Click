import 'package:fluttertest/Core/Service/Auth.dart';
import 'package:fluttertest/Core/ViewModel/LoginVM.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pigment/pigment.dart';
import '../../Helper/settingApp.dart';
import 'package:provider/provider.dart';
class LoginIndex extends StatefulWidget {
  LoginIndex({Key key}) : super(key: key);

  @override
  _LoginIndexState createState() => _LoginIndexState();
}

class _LoginIndexState extends State<LoginIndex> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(authenticationService: Provider.of(context)),
      builder: (context,model,child) => 
      Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/dash.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top:40),
                      height: MediaQuery.of(context).size.height/4,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset('assets/img/index.png'),
                          Text('Rental Sewa Mobil Terbaik di Indonesia',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                          )),
                        ],
                      )
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.95),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children:<Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 25),
                          child: Text('Login',style: TextStyle(color:primary,fontSize: 19,fontWeight: FontWeight.bold))),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Pigment.fromString('#bfbfbf'),
                            hintText: 'E-Mail',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email,color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50)
                            )
                          )
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Pigment.fromString('#bfbfbf'),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(Icons.lock,color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(50)
                              )
                            )
                          ),
                        ),
                        model.busy
                  ? CircularProgressIndicator():
                        OutlineButton(
                          hoverColor: primary,
                          highlightedBorderColor:Colors.transparent,
                          splashColor: primary,
                          // highlightColor: primary,
                          child: Text('Login',style: TextStyle(color:primary),),
                          onPressed: ()async{
                              var loginSuccess = await model.login(email.text,password.text);
                              if(loginSuccess == true){
                                Navigator.pushReplacementNamed(context, 'home');
                              }else{
                                Fluttertoast.showToast(
        msg: "Login Gagal",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                              }
                          }
                        )
                        ])
                    ),
                  ],
              ),
            ),
          ),
        )
      ),
    );
  }
}