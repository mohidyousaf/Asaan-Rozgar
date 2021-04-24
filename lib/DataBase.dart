import 'dart:async';
import 'package:asaanrozgar/Widgets/table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:asaanrozgar/Widgets/SaleExpense.dart';
import 'package:asaanrozgar/Transactions.dart';

import 'package:asaanrozgar/Widgets/addItemClass.dart';


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
              ProductPicture	BLOB,
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
  addItem(products, partnerName, categoryTag, salePrice,taxRate, minStock, total, received)async{
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

      //adding in inventory
      var res = await db.rawInsert('''
      INSERT INTO inventory(
      PartyID,ProductName,ProductDescription,SalePrice,TaxRate,MinStock
    ) VALUES (?,?,?,?,?,?)
    ''', [partyID, product.itemName, categoryTag, salePrice, taxRate, minStock]);

    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name= prefs.getString('companyName');
    var s= await DBprovider.db.addOrder(name,products, partnerName, total, received,'purchase');


    return [partyID,productID];
  }
  // productList is supposed to be a class with three attributes itemName, quantity and price.
  // this should be passed whenever the function is called
  addOrder(companyName,productList, partyName, amount, received, type) async{
    final db = await database;
    int partyID;
    double receivable;
    var payable;
    double companyBalance = 0;
    int companyID;
    var totalPayable;
    var totalReceivable;
    var IDquery = (await db.query(
        'company',
        columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
        where: 'CompanyName = ?',
        whereArgs: [companyName])).forEach((element) {
      companyID = element['CompanyID'];
      totalReceivable = element['TotalReceivable'];
      totalPayable = element['TotalPayable'];
    });

    List<Map<String, dynamic>> temp = await DBprovider.db.getBalance(accountName:null);
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
        if (type == 'purchase'){
          var res2 = await db.rawInsert('''
          INSERT INTO purchases(
            ProductID,PurchasePrice,Quantity
          ) VALUES (?,?,?)
          ''', [productID, product.price, product.quantity]);
        }
        if (type == 'sale'){
          var res3 = await db.rawQuery('''
          SELECT * FROM purchases
          WHERE ProductID = ?
          ''', [productID]);
          var quantity = 0;
          var purchaseID;
          var productQuantity = product.quantity;

          bool finish = false;
          for (final element in res3){
            quantity = element['Quantity'];
            purchaseID = element['PurchaseID'];
            if (quantity > 0){
              if (quantity < productQuantity){
                productQuantity -= quantity;
                quantity = 0;
              }
              else{
                quantity -= productQuantity;
                finish = true;
              }
              var query = db.rawQuery('''
              UPDATE purchases
              SET Quantity = ?
              WHERE PurchaseID = ?
              ''', [quantity, purchaseID]);
              if (finish) {
                break;
              }
            }
          }
        }
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
      totalReceivable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Receivable = ?
        WHERE PartyID=?
      ''',[newReceivable,partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalReceivable = ?
        WHERE CompanyID=?
      ''',[totalReceivable,companyID]);
      updateBalance(name:companyName, balance:companyBalance+double.parse(received));
    }
    else {
      newPayable += balance;
      totalPayable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Payable = ?
        WHERE PartyID=?
      ''',[newPayable,partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalPayable = ?
        WHERE CompanyID=?
      ''',[totalPayable,companyID]);
      updateBalance(name:companyName, balance:companyBalance- double.parse(received));
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

  addAssets(name, description, type, value) async{
    final db = await database;
    double companyBalance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName= prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query(
    'company',
    columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
    where: 'CompanyName = ?',
    whereArgs: [companyName])).forEach((element) {
    companyID = element['CompanyID'];
    });

    List<Map<String, dynamic>> temp = await DBprovider.db.getBalance(accountName: null);
    temp.forEach((element) {
    companyBalance = element['Balance'];
    });

    print('before company balance: $companyBalance');
    var order = await db.rawInsert('''
      INSERT INTO assets(
        CompanyID,Name, Type, Description, Value
        ) VALUES (?,?,?,?,?)
    ''',[companyID, name, type, description, value]);

    int assetID;
    var list2 = (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
    assetID = element['last_insert_rowid()'];
    });

    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now);// 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          AssetID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''',[assetID, value, type, date]);
    var newBalance = companyBalance - double.parse(value);
    updateBalance(accountName:null, name:companyName, balance: newBalance);
  }

  addEquity(name, amount){
    return name;
  }
  addExpense(accountName, type, amount, details) async{
    final db = await database;
    double companyBalance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName= prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query(
        'company',
        columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
        where: 'CompanyName = ?',
        whereArgs: [companyName])).forEach((element) {
      companyID = element['CompanyID'];
    });

    List<Map<String, dynamic>> temp = await DBprovider.db.getBalance(accountName: accountName);
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });

    print('before company balance: $companyBalance');
    var order = await db.rawInsert('''
      INSERT INTO expenses(
        CompanyID, Type, Description
        ) VALUES (?,?,?)
    ''',[companyID, type, details]);

    int expenseID;
    var list2 = (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      expenseID = element['last_insert_rowid()'];
    });

    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now);// 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          ExpenseID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''',[expenseID, amount, type, date]);
    var newBalance = companyBalance - double.parse(amount);
    updateBalance(accountName:null, name:companyName, balance: newBalance);
  }

  addParty(partyType, partyName,partyDescription,emailAddress,contactNo,accountNo,payable,receivable) async{

    final db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name= prefs.getString('companyName');
    int companyID;
    var receivables;
    var payables;
    var IDquery = (await db.query(
        'company',
        columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
        where: 'CompanyName = ?',
        whereArgs: [name])).forEach((element) {
        companyID = element['CompanyID'];
        receivables = element['TotalReceivable'];
        payables = element['TotalPayable'];
    });
    print(partyName);
    var res = await db.rawInsert('''
    INSERT INTO parties(
      PartyType,PartyName,Description,EmailAddress, ContactNo, AccountNo, Receivable, Payable
    ) VALUES (?,?,?,?,?,?,?,?)
    ''', [partyType, partyName, partyDescription, emailAddress, contactNo, accountNo, double.parse(receivable), double.parse(payable)]);
    var tempQuery = await db.rawQuery('''
        UPDATE company
        SET TotalReceivable = ?,
            TotalPayable = ?
        WHERE CompanyID=?
      ''',[receivables + double.parse(receivable),payables + double.parse(payable), companyID]);
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
    var party;
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM parties WHERE PartyName= ?;
      ''',[name]);
    parties.forEach((element) =>{party = element});
    return party;

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

  getExpensesList() async{
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

  getSalePurchaseList() async{
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
    List<InventoryItem> items = [];
    await Future.wait(parties.map((element) async{
      var quantity = 0;
      var price = 0.0;
      var value = 0.0;
      var q = 0;
      var query = await db.rawQuery('''
      SELECT * FROM purchases
      WHERE ProductID = ?
      ''', [element['ProductID']]);
      query.forEach((purchaseElement) {
        q = purchaseElement['Quantity'];
        quantity += q;
        price = purchaseElement['PurchasePrice'];
        value += (q * price);

      });
      items.add(new InventoryItem(
        //TODO: add image in db
          image: 'image',
          name: element['ProductName'],
          price: element['SalePrice'].toInt(),
          quantity: quantity.toInt(),
          value: value.toInt()));
    }));

    return items;

    return parties;

  }

  getInventory() async{

    final db =await database;
    List<InventoryItem> items = [];
    final List<Map<String, dynamic>> list = await db.rawQuery('''
        SELECT * FROM inventory
      ''');
    await Future.wait(list.map((element) async{
      var quantity = 0;
      var price = 0.0;
      var value = 0.0;
      var q = 0;
      var partyName = '';
      var query = await db.query(
      'purchases',
      where: 'ProductID = ?',
      whereArgs:[element['ProductID']]);
      query.forEach((purchaseElement) {
        q = purchaseElement['Quantity'];
        quantity += q;
        price = purchaseElement['PurchasePrice'];
        value += (q * price);

      });
      var partyQuery = await db.query(
          'parties',
          where: 'PartyID = ?',
          whereArgs:[element['PartyID']]);
      partyQuery.forEach((party) {
        partyName = party['PartyName'];
      });
      items.add(new InventoryItem(
          partyName: partyName,
          tag: element['ProductDescription'],
          lowStock: element['MinStock'],
          name: element['ProductName'],
          price: element['SalePrice'].toInt(),
          quantity: quantity.toInt(),
          value: value.toInt()));
    }));
    print('db print $items');
    return items;

  }

  updateBalance({accountName, name,balance})async{
    final db =await database;
    print(name);
    bool set = true;
    if (accountName == null){
      set = false;
    }
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
    if (set){
      var temp = await db.rawQuery('''
        UPDATE accounts
        SET Balance= ?
        WHERE CompanyID=? AND BankName = ?
      ''',[balance,companyID, accountName]);
    }
    else{
      var temp = await db.rawQuery('''
        UPDATE accounts
        SET Balance= ?
        WHERE CompanyID=? AND AccountType = ?
      ''',[balance,companyID, 'Default']);
    }

  }

  //TODO: change the name as it is giving everything of account not only balance
  getBalance({accountName:'cash'})async{
    bool set = true;
    if (accountName == null){
      set = false;
    }
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
    if (set){
      final List<Map<String, dynamic>> temp = await db.rawQuery('''
        SELECT * FROM  accounts WHERE CompanyID=? AND BankName = ?;
      ''',[companyID, accountName]);
      return temp;
    }
    else{
      final List<Map<String, dynamic>> temp = await db.rawQuery('''
        SELECT * FROM  accounts WHERE CompanyID=? AND AccountType=?;
      ''',[companyID, 'Default']);
      return temp;
    }


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

  getSaleItems()async{

    List<report_items> objects=[];
    final db= await database;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''',['sale']);

    print(temp);
    await Future.wait(temp.map((element) async{
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''',[element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async{
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''',[element2['ProductID']]);

        print(nameIDquery);
        nameIDquery.forEach((element3) {
              objects.add(new report_items(itemName: element3['ProductName'],price: total.toInt()));

        });
      }));
    }));

    // List<report_items> obj = [
    //   report_items(itemName: 'Mobile sale', price: 51000),
    //   report_items(itemName: 'Bag Sale', price: 5000),
    //   report_items(itemName: 'Camera Sale', price: 150000),
    //   report_items(itemName: 'Merchandise Sale', price: 50000),
    // ];

    return objects;
  }

  getExpenseItems()async{

    List<report_items> objects=[];
    final db= await database;
    var temp = await db.rawQuery('''
        SELECT ExpenseID, Type
        FROM expenses
      ''');

    print(temp);
    await Future.wait(temp.map((element) async{

      var amount;
      var transactionIDquery = await db.rawQuery('''
        SELECT Amount
        FROM transactions
        WHERE ExpenseID=?
      ''',[element['ExpenseID']]);


      transactionIDquery.forEach((element2) {
        amount = element2['Amount'];
        print('amount');
        print(amount);
        objects.add(new report_items(itemName: element['Type'], price: amount.toInt()));
      });

      print('expenses in db');
      print(objects[0].itemName);
      print(objects[0].price);

    }));


    var temp2 = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''',['purchase']);

    print(temp2);
    await Future.wait(temp2.map((element) async{
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''',[element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async{
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''',[element2['ProductID']]);

        print(nameIDquery);
        nameIDquery.forEach((element3) {
          objects.add(new report_items(itemName: element3['ProductName'],price: total.toInt()));

        });
      }));
    }));
    return objects;
  }

  getTotalCost()async{

    final db= await database;
    double totalCost = 0;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''',['sale']);

    print(temp);
    await Future.wait(temp.map((element) async{
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        int quantity = element2['Quantity'];
        double purchasePrice =0;
        var purchaseQuery = await db.rawQuery('''
        SELECT PurchasePrice
        FROM purchases
        WHERE ProductID=?
      ''',[element2['ProductID']]);

        purchaseQuery.forEach((element3) {
          purchasePrice = element3['PurchasePrice'];
          double total = purchasePrice * quantity;
          print(total);
          totalCost+= total;
        });
      }));
    }));

    return totalCost;
  }

  getPayableReceivable()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    double payable=0;
    double receivable=0;
    final db= await database;


    var companyQuery = await db.rawQuery('''
        SELECT TotalPayable,TotalReceivable
        FROM company
      ''');

    companyQuery.forEach((element) {
      var temp = element['TotalPayable'];
      // double temp3= double.parse(temp);
      print(temp);
      payable += temp;


      var temp2 = element['TotalReceivable'];
      print(temp2);
      receivable += temp2;

    });



    print('in Db pr is $payable $receivable');
    return [payable,receivable];
  }

  getInventoryCost()async{

    final db= await database;
    double totalCost = 0;

    var temp = await db.rawQuery('''
        SELECT ProductID
        FROM inventory
      ''');

    print(temp);
    await Future.wait(temp.map((element)async{

      var temp2= await db.rawQuery('''
        SELECT Quantity,PurchasePrice
        FROM purchases
        where ProductID = ?        
      ''',[element['ProductID']]);

      print(temp2);

      temp2.forEach((element2) {
        int quantity =element2['Quantity'];
        double price = element2['PurchasePrice'];
        double val =  price * quantity;
        totalCost += val;
      });

    }));
    print('total cost is $totalCost');
    return totalCost;
  }

  getAssets()async{
    final db= await database;
    List<report_items> objects=[];

    var temp = await db.rawQuery('''
        SELECT Type,Value
        FROM assets
      ''');

    temp.forEach((element) {
      double val = element['Value'];
      objects.add(new report_items(itemName: element['Type'], price: val.toInt()));
    });

    print(objects);
    return objects;
  }
}