import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:asaanrozgar/Widgets/SaleExpense.dart';


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
              Date TEXT,
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
  addItem(products, partnerName, categoryTag, salePrice,taxRate, minStock)async{
    final db = await database;
    int partyID;
    int productID;
    products.forEach((product) async{
      print( '${product.itemName}, ${product.price}, ${product.quantity}');
      //partyID
      var list = (await db.query(
      'parties',
      columns: ['PartyID'],
      where: 'PartyName = ?',
          whereArgs: [partnerName])).forEach((element){
      partyID = element['PartyID'];
      });
      var res = await db.rawInsert('''
      INSERT INTO inventory(
      PartyID,ProductName,ProductDescription,SalePrice,TaxRate,MinStock
    ) VALUES (?,?,?,?,?,?)
    ''', [partyID, product.itemName, categoryTag, salePrice, taxRate, minStock]);
      var productQuery = (await db.query(
      'inventory',
      columns: ['ProductID'],
      where: 'ProductName = ?',
      whereArgs: [product.itemName])).forEach((element) {
      productID = element['ProductID'];
      });
      var res2 = await db.rawInsert('''
    INSERT INTO purchases(
      ProductID,PurchasePrice,Quantity
    ) VALUES (?,?,?)
    ''', [productID, product.price, product.quantity]);
      print('Added');
    });
    addOrder('default',products, partnerName, '2000', '1000', 'purchase');


    return [partyID,productID];
  }
  // productList is supposed to be a class with three attributes itemName, quantity and price.
  // this should be passed whenever the function is called
  addOrder(companyName,productList, partyName, amount, received, type) async{
    final db = await database;
    int partyID;
    double receivable;
    var payable;
    double companyBalance;
    int companyID;

    List<Map<String, dynamic>> temp = await DBprovider.db.getBalance();
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });

    print('before company balance: $companyBalance');
    var list = (await db.query(
        'parties',
        columns: ['PartyID', 'Receivable', 'Payable'],
        where: 'PartyName = ?',
        whereArgs: [partyName])).forEach((element){
      partyID = element['PartyID'];
      receivable = element['Receivable'];
      payable = element['Payable'];
    });
    var order = await db.rawInsert('''
      INSERT INTO orders(
        PartyID, TotalPayable, TotalReceived, OrderType
        ) VALUES (?,?,?,?)
    ''',[partyID, amount, received, type]);

      int orderID;
      var list2 = (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
        orderID = element['last_insert_rowid()'];
      });
      var productID;
      productList.forEach((product) async{
        var l = (await db.query(
            'inventory',
            columns: ['ProductID'],
            where: 'ProductName = ?',
            whereArgs: [product.itemName])).forEach((element) {
          productID = element['ProductID'];
        });
        await db.rawInsert('''
        INSERT INTO orderGoods(
          OrderID, ProductID, Quantity, Price
          ) VALUES (?,?,?,?)
      ''',[orderID, productID, product.quantity, product.price]);
    });
      DateTime now = DateTime.now();
      String date = DateFormat('yMd').format(now);// 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          OrderID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''',[orderID, amount, type, date]);
    print('receivable :$receivable, amount: $amount, received: $received');
    double newReceivable = receivable;
    double newPayable = payable;
    var balance = (double.parse(amount) - double.parse(received));
    if (type == 'sale') {
      newReceivable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Receivable = ?
        WHERE PartyID=?
      ''',[newReceivable,partyID]);
      updateBalance(companyName, companyBalance+double.parse(received));
    }
    else {
      newPayable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Payable = ?
        WHERE PartyID=?
      ''',[newPayable,partyID]);
      updateBalance(companyName, companyBalance- double.parse(received));
    }

    // var temp2= getBalance();
    // var updated = temp2['Balance'];
    // print('update company  balance is: $updated');

    }
  addTransaction() async{

  }
  addAccount(companyName, type, bankName, accountNo,currentBal)async {
    final db = await database;
    int companyID;
    var IDquery = (await db.query(
        'company',
        columns: ['companyID'],
        where: 'companyName = ?',
        whereArgs: [companyName])).forEach((element) {
      companyID = element['CompanyID'];
    });
    var res2 = await db.rawInsert('''
    INSERT INTO accounts(
      CompanyID, AccountType, AccountNo, BankName, Balance
    ) VALUES (?,?,?,?,?)
    ''', [companyID,type, accountNo, bankName, currentBal]);
  }

  addCompany(username, companyName, description, payable, receivable ,email, companyNumber)async {
    final db = await database;

    var res2 = await db.rawInsert('''
    INSERT INTO company(
      Username, CompanyName,CompanyDescription,TotalPayable,TotalReceivable,EmailAddress,CompanyNo
    ) VALUES (?,?,?,?,?,?,?)
    ''', [username, companyName, description, payable, receivable ,email, companyNumber]);

    return res2;
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
  getTransactionList() async{
    final db = await database;
    var res = await db.query('transactions',
        columns: ['TransactionType', 'Amount', 'Date']);
    List<Map<String, String>> list = [];
    res.forEach((element) {
      list.add({'type':element['TransactionType'],
                'amount':element['Amount'].toString(),
                'date':element['Date']});
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
  getInventory() async{

    final db =await database;
    List<InventoryItem> items = [];
    final List<Map<String, dynamic>> list = await db.rawQuery('''
        SELECT * FROM inventory
      ''');
    list.forEach((element) {
      items.add(new InventoryItem(
          name: element['ProductName'],
          price: element['SalePrice'].toInt(),
          quantity: 40,
          value: 100));
    });

    return items;

  }

  updateBalance(name,balance)async{
    final db =await database;
    print(name);

    int companyID;
    var IDquery = (await db.query(
        'company',
        columns: ['companyID'],
        where: 'companyName = ?',
        whereArgs: [name])).forEach((element) {
      companyID = element['CompanyID'];
    });

    print("company id is");
    print(companyID);
    var temp = await db.rawQuery('''
        UPDATE accounts
        SET Balance= ?
        WHERE CompanyID=?
      ''',[balance,companyID]);
  }

  //TODO: change the name as it is giving everything of account not only balance
  getBalance()async{
    final db= await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name= prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query(
        'company',
        columns: ['companyID'],
        where: 'companyName = ?',
        whereArgs: [name])).forEach((element) {
      companyID = element['CompanyID'];
    });


    final List<Map<String, dynamic>> temp = await db.rawQuery('''
        SELECT * FROM  accounts WHERE CompanyID=?;
      ''',[companyID]);

    return temp;
  }

  getCompanyData(companyName)async{
    final db= await database;
    Map details = {};
    var query = (await db.query(
        'company',
        columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
        where: 'CompanyName = ?',
        whereArgs: [companyName])).forEach((element) {
            print(element);
            details['CompanyID'] = element['CompanyID'];
            details['Payable'] = element['TotalPayable'];
            details['Receivable'] = element['TotalReceivable'];
    });
    return details;
  }
  getTransactions() async{
    List<String> monthList = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug','Sep','Oct', 'Nov', 'Dec'];
    Map<String, SaleExpense> list = {};
    final db = await database;
    var res = await db.query('transactions',
        columns: ['TransactionType', 'Amount', 'Date']);
    res.forEach((element) {
      var inputFormat = DateFormat("MM/dd/yyyy");
      var date = element['Date'];
      var tempDate = inputFormat.parse(date);
      if (list[monthList[tempDate.month - 1]]== null){
        list[monthList[tempDate.month - 1]] = new SaleExpense();
      }
      if (element['TransactionType']== 'sale'){
        list[monthList[tempDate.month - 1]].sale +=  element['Amount'];
      }
      else{
        list[monthList[tempDate.month - 1]].expense +=  element['Amount'];
      }

    });
    return list;
  }
}