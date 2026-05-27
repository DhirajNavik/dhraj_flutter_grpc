import 'package:mongo_dart/mongo_dart.dart';
import 'env.dart';

class MongoService {
  MongoService._();

  static final MongoService _instance = MongoService._();

  factory MongoService() => _instance;

  late Db db;

  bool _isConnected = false;

  Future<void> connect() async {
    if (_isConnected) return;
    try {
      db = await Db.create(env['MONGO_URI']!);
      await db.open();

      _isConnected = true;
      
      final usersCollection = db.collection("users");
      await usersCollection.createIndex(keys: {"email": 1}, unique: true);
      await usersCollection.createIndex(keys: {"username": 1}, unique: true);

      print("MongoDB connected");
    } catch (e) {
      print("MongoDB connection failed: $e");
      rethrow;
    }
  }

  DbCollection collection(String name) {
    return db.collection(name);
  }
}
