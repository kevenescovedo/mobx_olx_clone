import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';
import 'package:xlo_mobx/store/user_maneger_store.dart';

import '../models/user.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String? name;

  @action
  setNome(String value) => name = value;
  @observable
  String? error;
  @action
  setError(String value) => error = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;
  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;
  @observable
  String? password;

  @action
  setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password!.length >= 6;

  String? get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password!.isEmpty) {
      return "Campo Obrigátorio";
    }
    else {
      return "Senha muito curta";
    }
  }

  String? get nameError {
    if (name == null || name!.length > 6) {
      return null;
    }
    else if (name!.isEmpty) {
      return "Campo Obrigátorio";
    }
    else {
      return "Nome muito Curto";
    }
  }

  @computed
  bool get isFormValid => passwordValid && nameValid;

  @computed
  bool get onPressed => !loading && isFormValid;

  void login() async {
    setLoading(true);
    try {
      User? user = await UserRepository().loginUser(this.name!, this.password!);
      GetIt.I<UserManegerStore>().setUser(user!);

    } catch (e) {
    setError(e.toString());
    }
    setLoading(false);
  }
}