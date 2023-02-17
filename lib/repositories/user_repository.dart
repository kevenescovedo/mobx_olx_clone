import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/repositories/parse_errors.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

import '../models/user.dart';

class UserRepository {
  Future<User?> signUp(User user) async {
  final parseUser = ParseUser(
    user.email, user.password, user.email
  );
  parseUser.set<String>(keyUserPhone, user.phone!);
  parseUser.set(keyUserType, user.userType!.index);
  final response = await parseUser.signUp();
  if(response.success) {
  return mapParseToUser(response.result as ParseUser);
  } else {

    await Future.error(ParseErrors.getDescription(response.error!.code));
  }


  }
  User mapParseToUser(ParseUser parse) {
  return User(name: parse.objectId,
    email: parse.get(keyUsername),
    phone:  parse.get(keyUserPhone),
    objectId: parse.get(keyObjectId),
    userType:  UserType.values[parse.get(keyUserType)],
    createdAt: parse.createdAt


  );

  }
  Future<User?> loginUser(String username, String password) async {
    final ParseUser parseUser = ParseUser(username, password, null);
  ParseResponse response =  await parseUser.login();
    if(response.success) {
      return mapParseToUser(response.result as ParseUser);
    }
    else {
      await Future.error(ParseErrors.getDescription(response.error!.code));
    }

  }
  Future<User?> currentUser() async {
    ParseUser? parseUser = await ParseUser.currentUser();
    if(parseUser !=  null) {
   ParseResponse? response = await ParseUser.getCurrentUserFromServer(parseUser.sessionToken!);
    if(response!.success)  {
   return mapParseToUser(response.result);
    } else {
      await parseUser.logout();
    }

    }
    return null;

  }

}
