import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';
part 'user_maneger_store.g.dart';

class UserManegerStore = _UserManegerStore with _$UserManegerStore;

abstract class _UserManegerStore with Store {
 _UserManegerStore(){
  _getCurrentUser();
 }

 @observable
  User? user;
 @action
  setUser(User value) => user = value;
 @computed
 bool get isUserLogged => user != null;
 Future<void> _getCurrentUser() async {
  final  user = await  UserRepository().currentUser();
  setUser(user!);
 }


}