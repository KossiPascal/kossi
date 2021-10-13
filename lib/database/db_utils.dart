// ignore_for_file: avoid_print
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbAndTables {

  Future<Database> createDatabase({dbName}) async {
    return await openDatabase(join(await getDatabasesPath(), dbName),
        version: 1, onCreate: (Database db, int version) async {
      print("Database: $dbName is create");
    });
  }

  Future<void> deleteDatabaseEntity({dbName}) async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    await deleteDatabase(path);
    print("Database: $dbName was deleted");
  }

  Future<Database> configureDb({dbName, table}) async {
    return await openDatabase(
      join(await getDatabasesPath(), dbName),
      onConfigure: (Database db) async {
        await db.execute("PRAGMA foreign_keys = ON");
        print("$dbName was configured");
      },
    );
  }

  createTable({db, table, sql}) async {
    bool tableExist = await isTableExits(db: db, table: table);
    if (!tableExist) {
      await db.execute(sql);
      print("Table: $table is create");
    }
  }

  Future<bool> isTableExits({db, table}) async {
    //Built-in table sqlite_master
    var sql = "SELECT * FROM sqlite_master WHERE TYPE = 'table' AND NAME = '$table'";
    var res = await db.rawQuery(sql);
    var returnRes = res != null && res.length > 0;
    return returnRes;
  }

  dropTable({db, table, dbName}) async {
    await db.execute("DROP TABLE IF EXISTS $table");
    print("Table: $table was droped");
  }

  alterTableAddColumn({database, table, column}) async {
    // await database.execSQL(sql);
    await database.execute("ALTER TABLE $table ADD COLUMN $column");
    print("$column was added in $table");
  }

  alterTableRemoveColumn({database, table, dbName, column}) async {
    await database.execute("ALTER TABLE $table DROP $column");
    // await database.execute("ALTER TABLE $table REMOVE $column");
    print("Column: $column was removed from $table");
  }

  alterTableRenameColumn(
      {database, table, oldColumnName, newColumnName}) async {
    await database
        .execute("ALTER TABLE $table RENAME TO $newColumnName $oldColumnName");
    // await database.execute("ALTER TABLE $table CHANGE $oldColumnName $newColumnName");
    print("Column :$oldColumnName was renamed to $newColumnName");
  }

  truncateTable({db, tablaName}) async {
    await db.execute("DELETE FROM $tablaName");
    print("Table: $tablaName was truncated");
  }

  Future<void> closeDB(database) async {
    print("We are closing $database");
    await database.close();
  }

  Future<bool> getDbPath({dbName}) async {
    String path1 = join(await getDatabasesPath(), dbName);
    String folder = await getDatabasesPath();
    String path2 = folder + dbName;
    if (path1 == path2) {
      return true;
    } else {
      print('false');
      return false;
    }
  }
}
