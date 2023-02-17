// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_maneger_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserManegerStore on _UserManegerStore, Store {
  Computed<bool>? _$isUserLoggedComputed;

  @override
  bool get isUserLogged =>
      (_$isUserLoggedComputed ??= Computed<bool>(() => super.isUserLogged,
              name: '_UserManegerStore.isUserLogged'))
          .value;

  late final _$userAtom =
      Atom(name: '_UserManegerStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$_UserManegerStoreActionController =
      ActionController(name: '_UserManegerStore', context: context);

  @override
  dynamic setUser(User value) {
    final _$actionInfo = _$_UserManegerStoreActionController.startAction(
        name: '_UserManegerStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_UserManegerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isUserLogged: ${isUserLogged}
    ''';
  }
}
