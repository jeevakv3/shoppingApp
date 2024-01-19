import '../../allpackages.dart';

class MysqlService {
  Database? db;

  Future<Database?> openDataBase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "addCart.db");
    db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await createDatabaseTable(db, version);
    });
    return db;
  }

  Future<void> createDatabaseTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE addCartProduct(id INTEGER, pid TEXT , name TEXT, salerate TEXT)');
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    try {
      await db!.insert('addCartProduct', data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteData(int id) async {
    await db!.delete('addCartProduct', where: 'id = $id');
  }
}
