class CredentialDb {
  static const String table = "credential";
  static const String id = "id";
  static const String username = "username";
  static const String userCode = "userCode";
  static const String district = "district";
  static const String siteId = "siteId";
  static const String siteName = "siteName";
  static const String isLogin = "isLogin";

  var sql = "CREATE TABLE IF NOT EXISTS $table ("
      "$id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$username VARCHAR,"
      "$userCode VARCHAR,"
      "$district VARCHAR,"
      "$siteId VARCHAR,"
      "$siteName VARCHAR,"
      "$isLogin INTEGER"
      ")";
}
