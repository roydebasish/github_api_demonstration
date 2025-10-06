import 'package:github_api_demonstration/core/constants/app_constants.dart';
import 'package:github_api_demonstration/features/repositories/data/models/repository_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<void> initialize() async {
    await database;
  }

  static Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), AppConstants.databaseName);
    return await openDatabase(
      path,
      version: AppConstants.databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${AppConstants.ownersTable} (
        id INTEGER PRIMARY KEY,
        login TEXT,
        avatar_url TEXT,
        gravatar_id TEXT,
        url TEXT,
        html_url TEXT,
        type TEXT,
        site_admin TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE ${AppConstants.repositoriesTable} (
        id INTEGER PRIMARY KEY,
        name TEXT,
        full_name TEXT,
        owner_id INTEGER,
        description TEXT,
        html_url TEXT,
        stargazers_count TEXT,
        watchers_count TEXT,
        forks_count TEXT,
        language TEXT,
        created_at TEXT,
        updated_at TEXT,
        pushed_at TEXT,
        size INTEGER,
        open_issues_count TEXT,
        archived TEXT,
        disabled TEXT,
        default_branch TEXT,
        FOREIGN KEY (owner_id) REFERENCES ${AppConstants.ownersTable}(id)
      )
    ''');
  }

  static Future<void> insertRepositories(List<RepositoryModel> repos) async {
    final db = await database;
    await db.transaction((txn) async {
      // Clear old data
      await txn.delete(AppConstants.repositoriesTable);
      await txn.delete(AppConstants.ownersTable);

      for (final repo in repos) {
        // Owner insert
        final owner = repo.owner;
        if (owner != null) {
          await txn.insert(
            AppConstants.ownersTable,
            {
              "id": owner.id,
              "login": owner.login,
              "avatar_url": owner.avatarUrl,
              "gravatar_id": owner.gravatarId,
              "url": owner.url,
              "html_url": owner.htmlUrl,
              "type": owner.type,
              "site_admin": owner.siteAdmin,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }

        // Repository insert
        await txn.insert(
          AppConstants.repositoriesTable,
          repo.toJsonDb(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  static Future<List<RepositoryModel>> getRepositories() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT 
        r.*,
        o.id as owner_id,
        o.login,
        o.avatar_url,
        o.gravatar_id,
        o.url,
        o.html_url,
        o.type,
        o.site_admin
      FROM ${AppConstants.repositoriesTable} r
      LEFT JOIN ${AppConstants.ownersTable} o ON r.owner_id = o.id
    ''');

    return result.map((map) => RepositoryModel.fromDb(map)).toList();
  }

  static Future<void> close() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
