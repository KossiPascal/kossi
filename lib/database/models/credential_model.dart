

import 'package:chws_app/database/tables/credential_db.dart';

class Credential {
  dynamic id;
  dynamic userCode;
  dynamic username;
  dynamic district;
  dynamic siteId;
  dynamic siteName;
  bool isLogin =false;

  Credential(
      {this.id,
      this.userCode,
      required this.username,
      this.district="",
      this.siteId = "",
      this.siteName = "",
      required this.isLogin});

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
        id: json['id'].toString(),
        userCode: json['userCode'],
        username: json['username'],
        district: json['district'],
        siteId: json['siteId'],
        siteName: json['siteName'],
        isLogin: json['isLogin']
        );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      CredentialDb.userCode: getuserCode,
      CredentialDb.username: getusername,
      CredentialDb.district: getdistrict,
      CredentialDb.siteId: getsiteId,
      CredentialDb.siteName: getsiteName,
      CredentialDb.isLogin: getisLogin ? 1 : 0,
    };

    // if (this.id != null && this.id != '') {
    //   map[CredentialDb.COLUMN_UPDATED_AT] = getupdatedAt;
    // }

    return map;
  }

  Credential.fromMap(Map<String, dynamic> map) {
    setid = map[CredentialDb.id];
    setuserCode = map[CredentialDb.userCode];
    setusername = map[CredentialDb.username];
    setdistrict = map[CredentialDb.district];
    setsiteId = map[CredentialDb.siteId];
    setsiteName = map[CredentialDb.siteName];
    setisLogin = map[CredentialDb.isLogin] == 1;
  }

  dynamic get getid {
    return id.toString();
  }

  dynamic get getuserCode {
    return userCode;
  }

  dynamic get getusername {
    return username;
  }

  dynamic get getdistrict {
    return district;
  }

  dynamic get getsiteId {
    return siteId;
  }

  dynamic get getsiteName {
    return siteName;
  }

  dynamic get getisLogin {
    return isLogin;
  }


  set setid(newData) {
    id = newData;
  }

  set setuserCode(newData) {
    userCode = newData.toString();
  }

  set setusername(newData) {
    username = newData.toString();
  }

  set setdistrict(newData) {
    district = newData.toString();
  }

  set setsiteId(newData) {
    siteId = newData.toString();
  }

  set setsiteName(newData) {
    siteName = newData.toString();
  }
  set setisLogin(bool newData) {
    isLogin = newData;
  }

}
