import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

class HomePageManager {
  final statusNotifier = ValueNotifier('Logged out');
  final pb = PocketBase('http://127.0.0.1:8090/');

  Future<void> signUp() async {
    final authData = await pb
        .collection('users')
        .authWithPassword('me@example.com', '1234567890');

    print('authData: $authData');

    print(pb.authStore.isValid);
    print(pb.authStore.token);
    print(pb.authStore.model.id);
  }

  Future<void> signIn() async {}

  Future<void> signOut() async {}

  Future<void> create() async {}

  Future<void> read() async {}

  Future<void> update() async {}

  Future<void> delete() async {}
}
