import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';
import 'package:xlo_mobx/store/user_maneger_store.dart';

import '../models/user.dart';
part 'signup_store.g.dart';


class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
 @observable
  String? name ;
 @action
  setNome (String value) => name = value;
 @computed
 bool get nameValid => name != null && name!.length > 6;
 @computed
 String? get nameError {
  if(name == null ||  name!.length > 6) {
   return null;
  }
  else if(name!.isEmpty) {
   return "Campo Obrigátorio";
  }
  else {
   return "Nome muito Curto";
  }
 }
 @observable
 String? email;
 @action
 setEmail(String value) => email = value;

 @computed
 bool get emailValid =>  email !=  null && email.isEmailValid();
@computed
 String? get emailError {
 if(email == null || emailValid) {
  return null;
 } else if(email!.isEmpty) {
return "Campo Obrigátorio";
 }
 else {
  return "E-mail inválido";
 }
}


 @observable
 String? phone;
 @action
 setPhone(String value) => phone = value;
 @computed

 bool get phoneValid =>  phone !=  null && phone!.length >= 14;
 @observable
 bool loading = false;
 @action
 setLoading(bool value) => loading = value;
 @observable
 String? error;
 @action
 setError (String value ) => error = value;

 String? get phoneError {
  if(phone == null || phoneValid) {
   return null;
  } else if(phone!.isEmpty) {
   return "Campo Obrigátorio";
  }
  else {
   return "Telefone inválido";
  }
 }
 @observable
 String? pass1;
 @action
 setPass1(String value) => pass1 = value;
 @computed
 bool get pass1Valid =>  pass1 !=  null && pass1!.length >= 6;
 String? get pass1Error {
  if(pass1 == null || pass1Valid) {
   return null;
  } else if(pass1!.isEmpty) {
   return "Campo Obrigátorio";
  }
  else {
   return "Senha muito curta";
  }
 }
 @observable
 String? pass2;
 @action
 setPass2(String value) => pass2 = value;
 @computed
 bool get pass2Valid =>  pass2 !=  null && pass2 == pass1;
 String? get pass2Error {
  if(pass2 == null || pass2Valid) {
   return null;
  } else if(pass2!.isEmpty) {
   return "Campo Obrigátorio";
  }
  else {
   return "Senhas não conhecidem";
  }
 }
 @computed
 bool get isFormValid => nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;



 void  singinUp() async {
  User user = User(
   name: name,
   email: email,
   password: pass1,
   phone: phone
  );
 setLoading(true);
 try {
 User? userr =  await UserRepository().signUp(user);
 GetIt.I<UserManegerStore>().setUser(userr!);
 }
 catch (e) {
  print("SIGNUP STOREEEE");
  print(e.toString());
  setError(e.toString());
 }
 setLoading(false);

 }
}