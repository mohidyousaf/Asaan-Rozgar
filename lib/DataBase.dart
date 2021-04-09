import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';


class DBprovider{
  DBprovider._();
  static final DBprovider db= DBprovider._();
  static Database _database;

  Future<Database> get database async{
    if(_database!= null){
      return _database;
    }
    else
    {
      // delete = true only if database needs to be rebuilt from scratch
      _database= await this.initDB(delete: false);
      print('returned');
      return _database;
    }

  }

  initDB({delete: false}) async{
    print(await getDatabasesPath());
    if (delete) {
      await deleteDatabase(join(await getDatabasesPath(), 'AssanRozgaar.db'));
    }
    Database dbs = await openDatabase(join(await getDatabasesPath(), 'AssanRozgaar.db'),            //join method comes from path package
        onCreate: (db,version) async {
      await db.execute('''
          CREATE TABLE IF NOT EXISTS users (
              Username	TEXT,
              Name	Text,
              EmailAddress	TEXT,
              Password	TEXT,
              PRIMARY KEY(Username)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS company (
              CompanyID	INTEGER ,
              Username	TEXT,
              CompanyName	Text,
              CompanyDescription,
              TotalPayable	REAL,
              TotalReceivable	REAL,
              EmailAddress	TEXT,
              CompanyNo	INTEGER,
              PRIMARY KEY(CompanyID),
              FOREIGN KEY(Username) REFERENCES users(Username)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS accounts (
              AccountID	INTEGER ,
              CompanyID	INTEGER,
              AccountType	TEXT,
              AccountNo	TEXT,
              BankName	TEXT,
              Balance	REAL,
              PRIMARY KEY(AccountID),
              FOREIGN KEY(CompanyID) REFERENCES company(CompanyID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS transactions (
              TransactionID	INTEGER ,
              AccountID	INTEGER,
              PartyID	INTEGER,
              OrderID	INTEGER,
              AssetID	INTEGER,
              LiabilityID	INTEGER,
              ExpenseID	INTEGER,
              Amount	REAL,
              TransactionType	TEXT,
              Description	TEXT,
              PRIMARY KEY(TransactionID),
              FOREIGN KEY(AccountID) REFERENCES accounts(AccountID),
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID),
              FOREIGN KEY(ExpenseID) REFERENCES expenses(ExpenseID),
              FOREIGN KEY(LiabilityID) REFERENCES liabilities(LiabilityID),
              FOREIGN KEY(AssetID) REFERENCES assets(AssetID),
              FOREIGN KEY(OrderID) REFERENCES orders(OrderID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS parties (
              PartyID	INTEGER ,
              PartyType	TEXT,
              PartyName	TEXT,
              Description	TEXT,
              EmailAddress	TEXT,
              ContactNo	INTEGER,
              AccountNo	TEXT,
              Receivable	REAL,
              Payable	REAL,
              PRIMARY KEY(PartyID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS orders (
              OrderID	INTEGER ,
              PartyID	INTEGER,
              TotalPayable	REAL,
              TotalReceived	REAL,
              OrderType	TEXT,
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID),
              PRIMARY KEY(OrderID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS assets (
              AssetID	INTEGER ,
              CompanyID	INTEGER,
              Name	TEXT,
              Type	TEXT,
              Description	TEXT,
              Value	REAL,
              FOREIGN KEY(CompanyID) REFERENCES company(CompanyID),
              PRIMARY KEY(AssetID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS liabilities (
              LiabilityID	INTEGER ,
              CompanyID	INTEGER,
              PartyID	INTEGER,
              BaseAmount	REAL,
              TimePeriod	INT,
              InterestRate	REAL,
              PaymentSchedule	TEXT,
              LateFees	REAL,
              InterestType	TEXT,
              BalanceDue	REAL,
              AmountPaid	REAL,
              FOREIGN KEY(CompanyID) REFERENCES company(CompanyID),
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID),
              PRIMARY KEY(LiabilityID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS inventory (
              ProductID	INTEGER ,
              PartyID	INTEGER,
              ProductName	TEXT,
              ProductDescription	TEXT,
              ProductPicture	TEXT,
              TaxRate	REAL,
              SalePrice	REAL,
              MinStock	INTEGER,

              FOREIGN KEY(PartyID) REFERENCES parties(PartyID),
              PRIMARY KEY(ProductID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS purchases (
              PurchaseID	INTEGER ,
              ProductID	INTEGER,
              PurchasePrice	REAL,
              Quantity	INTEGER,
              FOREIGN KEY(ProductID) REFERENCES inventory(ProductID),
              PRIMARY KEY(PurchaseID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS orderGoods (
              OrderID	INTEGER,
              ProductID	INTEGER,
              Quantity	INTEGER,
              Price REAL,
              FOREIGN KEY(ProductID) REFERENCES inventory(ProductID),
              FOREIGN KEY(OrderID) REFERENCES orders(OrderID),
              PRIMARY KEY(OrderID, ProductID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS expenses (
              ExpenseID	INTEGER ,
              CompanyID	INTEGER,
              Type	TEXT,
              Description	TEXT,
              FOREIGN KEY(CompanyID) REFERENCES companies(CompanyID),
              PRIMARY KEY(ExpenseID)
            );       
       ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS equity(
              EquityID INTEGER ,
              PartyID	INTEGER,
              Type	TEXT,
              Amount	REAL,
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID),
              PRIMARY KEY(EquityID)
            );       
       ''');
        },
        version: 1
    );
    return dbs;
  }
  login(username, password) async {
    final db = await database;
    String response = 'user not found';
    final List<Map<String, dynamic>> users = await db.query(
        'users',
        where: 'Username = ?;',
        whereArgs: [username]);
    users.forEach((user) {
      if (user['Password'] == password)
      {
        response = "correct password";
      }
      else
      {
        response =  'incorrect password';
      }
    });
    return response;
  }
  newUser(username, name, emailAddress, password) async {
    final db = await database;
    print(username + " " + password);
    var res = await db.rawInsert('''
    INSERT INTO users(
      Username,Name,EmailAddress,Password
    ) VALUES (?,?,?,?)
    ''', [username, name, emailAddress, password]);

    return res;
  }

  getUser({String username}) async{
    final db =await database;
    // final List<Map<String, dynamic>> maps = await db.query("users");


    // final List<Map<String, dynamic>> maps = await db.rawQuery('''
    //     SELECT * FROM users WHERE username=?;
    //   ''', ['mohid']);

    final List<Map<String, dynamic>> maps = await db.query(
        'users',
        where: 'Username = ?',
        whereArgs: [username]
    );
    return maps;

  }
  //TODO: BELOW DB FUNCTIONS
  addItem(productName, partnerName, categoryTag, purchasePrice,salePrice,taxRate,quantity,minStock)async{
    final db = await database;
    print(productName);
    //partyID
    int partyID;
    var list = (await db.query(
    'parties',
    columns: ['PartyID'],
    where: 'PartyName = ?',
        whereArgs: [partnerName])).forEach((element) {
      partyID = element['PartyID'];
    });
    var res = await db.rawInsert('''
    INSERT INTO inventory(
      PartyID,ProductName,ProductDescription,SalePrice,TaxRate,MinStock
    ) VALUES (?,?,?,?,?,?)
    ''', [partyID, productName, categoryTag, salePrice, taxRate, minStock]);
    int productID;
    var product = (await db.query(
        'inventory',
        columns: ['ProductID'],
        where: 'ProductName = ?',
        whereArgs: [productName])).forEach((element) {
      productID = element['ProductID'];
    });
    var res2 = await db.rawInsert('''
    INSERT INTO purchases(
      ProductID,PurchasePrice,Quantity
    ) VALUES (?,?,?)
    ''', [productID, purchasePrice, quantity]);
    print('Added');

    return [partyID,productID];
  }
  addPurchase(productList, purchaseList, quantityList, amount){

  }
  addAccount(title, name, accountNo,currentBal)
  {


    return 'hello';
  }
  addAssets(name, description, type, value){
    return name;
  }
  addEquity(name, amount){
    return name;
  }
  addParty(partyType, partyName,partyDescription,emailAddress,contactNo,accountNo,payable,receivable) async{
    final db = await database;
    print(partyName);
    var res = await db.rawInsert('''
    INSERT INTO parties(
      PartyType,PartyName,Description,EmailAddress, ContactNo, AccountNo, Receivable, Payable
    ) VALUES (?,?,?,?,?,?,?,?)
    ''', [partyType, partyName, partyDescription, emailAddress, contactNo, accountNo, receivable, payable]);

    return res;
  }

  getParties() async{
    final db =await database;
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM parties;
      ''');
    print(parties);

    List <String> temp = [];
    parties.forEach((party){
      temp.add(party['PartyName']);
    });

    return temp;

  }

  getData(name) async{

    final db =await database;

    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM parties WHERE PartyName= ?;
      ''',[name]);

    return parties;

  }

  getPartyList() async{
    final db = await database;
    var res = await db.query('parties',
    columns: ['PartyName', 'Receivable']);
    List<Map<String, String>> list = [];
    res.forEach((element) {
      list.add({'name':element['PartyName'], 'amount':element['Receivable'].toString()});
    });
    return list;
  }

  getItemList(name) async{

    final db =await database;
    int partyID;
    var list = (await db.query(
        'parties',
        columns: ['PartyID'],
        where: 'PartyName = ?',
        whereArgs: [name])).forEach((element) {
      partyID = element['PartyID'];
    });
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM inventory WHERE PartyID= ?;
      ''',[partyID]);

    return parties;

  }

}