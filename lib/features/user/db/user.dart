import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'user.g.dart';

class User extends Table {
  TextColumn get first => text().withLength(min: 0, max: 1000)();
  TextColumn get last => text().withLength(min: 0, max: 1000)();
  TextColumn get email => text().withLength(min: 0, max: 1000)();
  TextColumn get gender => text().withLength(min: 0, max: 1000)();
  TextColumn get cell => text().withLength(min: 0, max: 1000)();
  TextColumn get picture => text().withLength(min: 0, max: 1000)();
}

@DriftDatabase(tables: [User])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}