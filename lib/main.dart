import 'package:flutter/material.dart';

import 'home_page/home_page.dart';
import 'local_storage/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const PocketBaseDemo());
}
