import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:raspbian_radio_app/api/api.dart';
import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:sqflite/sqflite.dart';

void mainSQLite() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'settings_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE settings(id INTEGER PRIMARY KEY, ip TEXT, port TEXT)',
      );
    },
    version: 1,
  );

  Future<void> insertSettings(Settings settings) async {
    final db = await database;
    await db.insert(
      'settings',
      settings.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Settings>> settings() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('settings');

    return List.generate(maps.length, (i) {
      return Settings(
        id: maps[i]['id'],
        ip: maps[i]['name'],
        port: maps[i]['age'],
      );
    });
  }

  Future<void> updateSetting(Settings settings) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'settings',
      settings.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [settings.id],
    );
  }

  Future<void> deleteDog(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'dogs',
      // Use a `where` clause to delete a specific dog.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Dog and add it to the dogs table
  var settings1 = Settings(id: 0, ip: "192.168.1.50", port: "5000");

  await insertSettings(settings1);

  // Now, use the method above to retrieve all the dogs.
  print(await settings()); // Prints a list that include Fido.

  // Update Fido's age and save it to the database.
  settings1 = Settings(
    id: settings1.id,
    ip: settings1.ip,
    port: settings1.port,
  );
  await updateSetting(settings1);

  // Print the updated results.
  print(await settings()); // Prints Fido with age 42.

  // Delete Fido from the database.
  await deleteDog(settings1.id!);

  // Print the list of dogs (empty).
  print(await settings());
}

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    required this.id,
    required this.name,
    required this.age,
  });

  @override
  String toString() {
    return 'Settings{id: $id, ip: $ip, port: $port}';
  }
}
