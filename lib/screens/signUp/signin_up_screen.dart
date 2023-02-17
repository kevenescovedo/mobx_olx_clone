import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signUp/components/field_title.dart';
import "package:flutter/services.dart";
import 'package:xlo_mobx/store/signup_store.dart';

import '../../components/error_box/error_box.dart';
class SignUpScreen extends StatelessWidget {
  final signupStore = SignupStore() ;
   SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16),

            child:
            Card(
              margin: EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)

              ),
              elevation: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(builder: (_) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: ErrorBox(message: signupStore.error,),);
                    },),
                    FieldTitle(title: "Apelido", subTitle: "Como aparaecerá em seus anúncios"),
                    Observer(builder: (_) {
                      return  TextField(
                          enabled: !signupStore.loading,
                          onChanged: signupStore.setNome,
                          decoration: InputDecoration(
                              errorText: signupStore.nameError,
                              border: OutlineInputBorder(),
                              hintText: "Exemplo: João 5."
                          ));
                    }),
                    SizedBox(height: 16,),

                    FieldTitle(title: "Email", subTitle: "Enviaremos um e-mail de confirmação"),
                   Observer(builder: (_){
                     return  TextField(
                         enabled: !signupStore.loading,
                         autocorrect: false,
                         cursorColor: Colors.orange,
                         keyboardType: TextInputType.emailAddress,
                         onChanged: signupStore.setEmail,
                         decoration: InputDecoration(
                           isDense: true,
                             errorText: signupStore.emailError,
                             border: OutlineInputBorder(),
                             hintText: "Exemplo: joao@gmail.com"
                         ));
                   },),
                    SizedBox(height: 16,),
                    FieldTitle(title: "Celular", subTitle: "Proteja sua conta"),
                  Observer(builder: (_){
                    return   TextField(
                        enabled: !signupStore.loading,
                        onChanged: signupStore.setPhone,
                        cursorColor: Colors.orange,
                        keyboardType: TextInputType.phone,
                        autocorrect: true,
                        inputFormatters: [
                          //somente digitos passarem
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          hintText: "Exemplo: (99) 99999-9999",
                          errorText: signupStore.phoneError,
                        ));
                  },),
                   SizedBox(height: 16,),
                    FieldTitle(title: "Senha", subTitle: "Use letras e numeros e caracteres especiais"),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signupStore.loading,
                          onChanged: signupStore.setPass1,
                          decoration: InputDecoration(
                          errorText: signupStore.pass1Error,
                          border: OutlineInputBorder(),
                      isDense: true,

                      ),
                      obscureText: true,
                      cursorColor: Colors.orange,
                      );
                    }),
                    SizedBox(height: 16,),
                    FieldTitle(title: "Confirmar Senha", subTitle: "Repita a Senha"),
                Observer(builder: (_) {
                  return TextField(
                    enabled: !signupStore.loading,
                      onChanged: signupStore.setPass2,
                      decoration: InputDecoration(
                      errorText: signupStore.pass2Error,
                      border: OutlineInputBorder(),
                  isDense: true,

                  ),
                  obscureText: true,
                  cursorColor: Colors.orange,
                  );
                }),

                    SizedBox(height: 16,),
                    Observer(builder: (_) {

                      return Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          height: 40,
                          child: RaisedButton(
                            disabledColor: Colors.orange.withAlpha(100),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            color: Colors.orange,
                            child:  !signupStore.loading ? Text("Cadastrar", style: TextStyle(color: Colors.white),): CircularProgressIndicator(color: Colors.white,),
                          onPressed: signupStore.isFormValid && !signupStore.loading ? signupStore.singinUp : null,
                            elevation: 0,
                          )
                      );
                    },),
                    Divider(color: Colors.black,),
                    Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 12),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          const   Text("Não tem Conta?", style: TextStyle(fontSize: 16),),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("Entrar",
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

              ),
            ),),
        ),
      )
    );
  }
}
