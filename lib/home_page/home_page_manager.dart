import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

class HomePageManager {
  final statusNotifier = ValueNotifier('Logged out');
  late final pb = PocketBase('http://${_getHost()}:8090/');

  String _getHost() {
    return (Platform.isAndroid) ? '10.0.2.2' : '127.0.0.1';
  }

  Future<void> signUp() async {
    final body = <String, dynamic>{
      "username": "Bob",
      "email": "bob@example.com",
      "password": "12345678",
      "passwordConfirm": "12345678",
      "name": "Bob Smith"
    };
    // final body = <String, dynamic>{
    //   "username": "Mary",
    //   "email": "mary@example.com",
    //   "password": "12345678",
    //   "passwordConfirm": "12345678",
    //   "name": "Mary Smith"
    // };

    final record = await pb.collection('users').create(body: body);
    print(record);
  }

  Future<void> signIn() async {
    final authData = await pb
        .collection('users')
        .authWithPassword('bob@example.com', '12345678');
    // final authData = await pb
    //     .collection('users')
    //     .authWithPassword('mary@example.com', '12345678');
    print(authData);

    statusNotifier.value = (pb.authStore.isValid) ? 'Logged in' : 'Logged out';
  }

  Future<void> refresh() async {
    if (!pb.authStore.isValid) {
      // TODO: The token has expired. Ask the user to sign in again.
      return;
    }
    final authData = await pb.collection('users').authRefresh();
    print(authData);
    // TODO: Save pb.authStore.token to secure storage
  }

  Future<void> signOut() async {
    pb.authStore.clear();
    statusNotifier.value = 'Logged out';
  }

  Future<void> create() async {
    final body = <String, dynamic>{
      "user": pb.authStore.model.id,
      "score": 92,
    };

    final record = await pb.collection('scores').create(body: body);
    print(record);
  }

  Future<void> read() async {
    final records = await pb.collection('scores').getFullList(
          sort: '-score',
          fields: 'id,score',
        );
    print(records);
  }

  Future<void> update() async {
    // Find the record with the lowest score
    final recordList = await pb.collection('scores').getList(
          page: 1,
          perPage: 1,
          skipTotal: true,
          sort: 'score',
          fields: 'id,score',
        );
    print(recordList);
    final record = recordList.items.first;

    // Update the record
    final body = <String, dynamic>{"score": 100};
    final updatedRecord = await pb.collection('scores').update(
          record.id,
          body: body,
        );
    print(updatedRecord);
  }

  Future<void> delete() async {
    // Find the record with the lowest score
    final recordList = await pb.collection('scores').getList(
          page: 1,
          perPage: 1,
          skipTotal: true,
          sort: 'score',
          fields: 'id,score',
        );
    final record = recordList.items.first;

    // Delete the record
    await pb.collection('scores').delete(record.id);
  }
}
