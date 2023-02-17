import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signUp/signin_up_screen.dart';
import 'package:xlo_mobx/store/login_store.dart';

import '../../components/error_box/error_box.dart';
class LoginScreen extends StatelessWidget {
  LoginStore store = LoginStore();
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entrar"),),
      body: Container(
        child: SingleChildScrollView(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(builder: (_) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: ErrorBox(message: store.error,),);
                    },),
                    Text("Acessar com Usuário:",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16,color: Colors.grey[900]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Text("Usuário",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),

                    ),
                   Observer(builder: (_) {
                     return  TextField(
                       enabled: !store.loading,
                       decoration: InputDecoration(
                         errorText: store.nameError,
                         border: OutlineInputBorder(),
                         isDense: true,

                       ),
                       cursorColor: Colors.orange,
                       onChanged: store.setNome,
                     );
                   }),
                    SizedBox(height: 16,),
                    Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Senha",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700
                              ),
                            ),
                            GestureDetector(
                              child: Text("Esqueceu a senha?",
                                style: TextStyle(
                                    color: Colors.purple,
                                    decoration: TextDecoration.underline
                                ),

                              ),
                              onTap: () {},
                            )
                          ],)
                    ),
                    Observer(builder: (_){
                      return TextField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: store.passwordError
                        ),
                        onChanged: store.setPassword,
                        obscureText: true,
                        cursorColor: Colors.orange,
                      );
                    }),
                    SizedBox(height: 16,),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 40,
                        child: Observer(builder: (_) {
                          return RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            child:   store.loading ? CircularProgressIndicator(color: Colors.white,): Text("Entrar", style: TextStyle(color: Colors.white),),
                            onPressed: store.onPressed ? store.login : null,
                            elevation: 0,
                          );
                        }
                          ,)
                    ),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 12),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const   Text("Não tem Conta?", style: TextStyle(fontSize: 16),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen()));
                            },
                            child: Text("Cadastre-se",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.purple,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],

                      ),
                    )

                  ],),
              )
          ),
        ),
        alignment: Alignment.center,
      )
    );
  }
}
