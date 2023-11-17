import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() {
  final container = ProviderContainer();
  runApp( UncontrolledProviderScope(container: container, child: const MyApp()),
  );
}
