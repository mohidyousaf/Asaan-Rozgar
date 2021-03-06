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

import 'package:asaanrozgar/Parties.dart';
import 'package:asaanrozgar/Widgets/addItemClass.dart';

class DBprovider {
  DBprovider._();
  static final DBprovider db = DBprovider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      // delete = true only if database needs to be rebuilt from scratch
      _database = await this.initDB(delete: false);
      print('returned');
      return _database;
    }
  }

  initDB({delete: false}) async {
    print(await getDatabasesPath());
    if (delete) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('accountCheck');
      prefs.remove('loggedIn');
      prefs.remove('onBoarding');
      await deleteDatabase(join(await getDatabasesPath(), 'AssanRozgaar.db'));
    }
    Database dbs = await openDatabase(
        join(await getDatabasesPath(),
            'AssanRozgaar.db'), //join method comes from path package
        onCreate: (db, version) async {

          await db.execute('''
            PRAGMA foreign_keys = ON;
          ''');
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
              EquityID INTEGER, 
              Amount	REAL,
              TransactionType	TEXT,
              Description	TEXT,
              Date TEXT,
              PRIMARY KEY(TransactionID),
              FOREIGN KEY(AccountID) REFERENCES accounts(AccountID),
              FOREIGN KEY(EquityID) REFERENCES  equity(EquityID),
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID) ON DELETE SET NULL,
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
              Date TEXT,
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID) ON DELETE SET NULL,
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
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID) ON DELETE SET NULL,
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

              FOREIGN KEY(PartyID) REFERENCES parties(PartyID) ON DELETE SET NULL,
              PRIMARY KEY(ProductID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS purchases (
              PurchaseID	INTEGER ,
              ProductID	INTEGER,
              PurchasePrice	REAL,
              Quantity	INTEGER,
              FOREIGN KEY(ProductID) REFERENCES inventory(ProductID) ON DELETE CASCADE,
              PRIMARY KEY(PurchaseID)
            );
            ''');
      await db.execute('''CREATE TABLE IF NOT EXISTS orderGoods (
              OrderID	INTEGER,
              ProductID	INTEGER,
              Quantity	INTEGER,
              Price REAL,
              FOREIGN KEY(ProductID) REFERENCES inventory(ProductID) ON DELETE SET NULL,
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
              FOREIGN KEY(PartyID) REFERENCES parties(PartyID) ON DELETE SET NULL,
              PRIMARY KEY(EquityID)
            );       
       ''');
    }, version: 1);
    return dbs;
  }

  login(username, password) async {
    final db = await database;
    String response = 'user not found';
    final List<Map<String, dynamic>> users =
        await db.query('users', where: 'Username = ?;', whereArgs: [username]);
    users.forEach((user) {
      if (user['Password'] == password) {
        response = "correct password";
      } else {
        response = 'incorrect password';
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

  getUser({String username}) async {
    final db = await database;
    // final List<Map<String, dynamic>> maps = await db.query("users");

    // final List<Map<String, dynamic>> maps = await db.rawQuery('''
    //     SELECT * FROM users WHERE username=?;
    //   ''', ['mohid']);

    final List<Map<String, dynamic>> maps =
        await db.query('users', where: 'Username = ?', whereArgs: [username]);
    return maps;
  }

  //TODO: BELOW DB FUNCTIONS
  addItems(accountName, products, partnerName, categoryTag, salePrice, taxRate,
      minStock, total, received) async {
    final db = await database;
    int partyID;
    int productID;
    products.forEach((product) async {
      print('${product.itemName}, ${product.price}, ${product.quantity}');
      //partyID
      var list = (await db.query('parties',
              columns: ['PartyID'],
              where: 'PartyName = ?',
              whereArgs: [partnerName]))
          .forEach((element) {
        partyID = element['PartyID'];
      });
      //adding in inventory
      var res = await db.rawInsert('''
      INSERT INTO inventory(
      PartyID,ProductName,ProductDescription,SalePrice,TaxRate,MinStock
    ) VALUES (?,?,?,?,?,?)
    ''', [
        partyID,
        product.itemName,
        categoryTag,
        salePrice,
        taxRate,
        minStock
      ]);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    var s = await DBprovider.db.addOrder(
        accountName, name, products, partnerName, total, received, 'purchase');

    return [partyID, productID];
  }

  // productList is supposed to be a class with three attributes itemName, quantity and price.
  // this should be passed whenever the function is called
  addOrder(accountName, companyName, productList, partyName, amount, _received,
      type) async {
    final db = await database;
    double received = double.parse(_received);
    int partyID;
    double receivable;
    var payable;
    double companyBalance = 0;
    int companyID;
    var totalPayable;
    var totalReceivable;
    var IDquery = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      companyID = element['CompanyID'];
      totalReceivable = element['TotalReceivable'];
      totalPayable = element['TotalPayable'];
    });

    List<Map<String, dynamic>> temp =
        await DBprovider.db.getBalance(accountName: accountName);
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });
    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now); // 28/03/2020
    print('before company balance: $companyBalance');
    var list = (await db.query('parties',
            columns: ['PartyID', 'Receivable', 'Payable'],
            where: 'PartyName = ?',
            whereArgs: [partyName]))
        .forEach((element) {
      partyID = element['PartyID'];
      receivable = element['Receivable'];
      payable = element['Payable'];
    });
    var order = await db.rawInsert('''
      INSERT INTO orders(
        Date, PartyID, TotalPayable, TotalReceived, OrderType
        ) VALUES (?,?,?,?,?)
    ''', [date, partyID, double.parse(amount), received, type]);

    int orderID;
    var list2 =
        (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      orderID = element['last_insert_rowid()'];
    });
    var productID;
    productList.forEach((product) async {
      var l = (await db.query('inventory',
              columns: ['ProductID'],
              where: 'ProductName = ?',
              whereArgs: [product.itemName]))
          .forEach((element) {
        productID = element['ProductID'];
      });
      await db.rawInsert('''
        INSERT INTO orderGoods(
          OrderID, ProductID, Quantity, Price
          ) VALUES (?,?,?,?)
      ''', [orderID, productID, product.quantity, product.price]);
      if (type == 'purchase') {
        var res2 = await db.rawInsert('''
          INSERT INTO purchases(
            ProductID,PurchasePrice,Quantity
          ) VALUES (?,?,?)
          ''', [productID, product.price, product.quantity]);
      }
      if (type == 'sale') {
        var res3 = await db.rawQuery('''
          SELECT * FROM purchases
          WHERE ProductID = ?
          ''', [productID]);
        var quantity = 0;
        var purchaseID;
        var productQuantity = product.quantity;

        bool finish = false;
        for (final element in res3) {
          quantity = element['Quantity'];
          purchaseID = element['PurchaseID'];
          if (quantity > 0) {
            if (quantity < productQuantity) {
              productQuantity -= quantity;
              quantity = 0;
            } else {
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
    await db.rawInsert('''
        INSERT INTO transactions(
          OrderID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''', [orderID, received, type, date]);
    print('receivable :$receivable, amount: $amount, received: $received');
    double newReceivable = receivable;
    double newPayable = payable;
    var balance = (double.parse(amount) - received);
    if (type == 'sale') {
      newReceivable += balance;
      totalReceivable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Receivable = ?
        WHERE PartyID=?
      ''', [newReceivable, partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalReceivable = ?
        WHERE CompanyID=?
      ''', [totalReceivable, companyID]);
      updateBalance(
          accountName: accountName,
          name: companyName,
          balance: companyBalance + received);
    } else {
      newPayable += balance;
      totalPayable += balance;
      await db.rawQuery('''
       UPDATE parties
        SET Payable = ?
        WHERE PartyID=?
      ''', [newPayable, partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalPayable = ?
        WHERE CompanyID=?
      ''', [totalPayable, companyID]);
      updateBalance(
          accountName: accountName,
          name: companyName,
          balance: companyBalance - received);
    }

    // var temp2= getBalance();
    // var updated = temp2['Balance'];
    // print('update company  balance is: $updated');
  }

  addTransaction() async {}
  addAccount(companyName, type, bankName, accountNo, currentBal) async {
    final db = await database;
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['companyID'],
            where: 'companyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });
    var res2 = await db.rawInsert('''
    INSERT INTO accounts(
      CompanyID, AccountType, AccountNo, BankName, Balance
    ) VALUES (?,?,?,?,?)
    ''', [companyID, type, accountNo, bankName, currentBal]);
  }

  addCompany(username, companyName, description, payable, receivable, email,
      companyNumber) async {
    final db = await database;

    var res2 = await db.rawInsert('''
    INSERT INTO company(
      Username, CompanyName,CompanyDescription,TotalPayable,TotalReceivable,EmailAddress,CompanyNo
    ) VALUES (?,?,?,?,?,?,?)
    ''', [
      username,
      companyName,
      description,
      payable,
      receivable,
      email,
      companyNumber
    ]);

    return res2;
  }

  addLoan(amount,timePeriod,interestRate)async {
    final db = await database;

    var res2 = await db.rawInsert('''
    INSERT INTO liabilities(
      BaseAmount, TimePeriod,InterestRate
    ) VALUES (?,?,?)
    ''', [amount, timePeriod, interestRate]);

    int loanID;
    var list2 = (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      loanID = element['last_insert_rowid()'];
    });


    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now);// 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          LiabilityID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''',[loanID, amount, 'liability', date]);


    return res2;
  }

  addAssets(name, description, type, value) async {
    final db = await database;
    double companyBalance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });

    List<Map<String, dynamic>> temp =
        await DBprovider.db.getBalance(accountName: null);
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });
    print('before company balance: $companyBalance');
    var order = await db.rawInsert('''
      INSERT INTO assets(
        CompanyID,Name, Type, Description, Value
        ) VALUES (?,?,?,?,?)
    ''', [companyID, name, type, description, value]);

    int assetID;
    var list2 =
        (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      assetID = element['last_insert_rowid()'];
    });

    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now); // 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          AssetID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''', [assetID, value, 'asset', date]);
    var newBalance = companyBalance - double.parse(value);
    updateBalance(accountName: null, name: companyName, balance: newBalance);
  }

  addEquity(name, amount, accountName, check) async {
    final db = await database;

    var equityQuery = await db.rawInsert('''
        INSERT INTO equity(
         Type,Amount
          ) VALUES (?,?)
      ''', [name, amount]);

    int EquityID;
    var list2 =
        (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      EquityID = element['last_insert_rowid()'];
    });

    double companyBalance;
    List<Map<String, dynamic>> temp =
        await DBprovider.db.getBalance(accountName: null);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });
    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now); // 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          EquityID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''', [EquityID, amount, 'equity', date]);
    var newBalance = companyBalance + double.parse(amount);

    if (check == 1) {
      updateBalance(
          accountName: accountName, name: companyName, balance: newBalance);
    }

    print(equityQuery);
    return equityQuery;
  }

  addExpense(accountName, type, amount, details) async {
    final db = await database;
    double companyBalance;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });

    List<Map<String, dynamic>> temp =
        await DBprovider.db.getBalance(accountName: null);
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });

    print('before company balance: $companyBalance');
    var order = await db.rawInsert('''
      INSERT INTO expenses(
        CompanyID, Type, Description
        ) VALUES (?,?,?)
    ''', [companyID, type, details]);

    int expenseID;
    var list2 =
        (await db.rawQuery('SELECT last_insert_rowid()')).forEach((element) {
      expenseID = element['last_insert_rowid()'];
    });

    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now); // 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          ExpenseID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''', [expenseID, amount, 'expense', date]);
    var newBalance = companyBalance - double.parse(amount);
    updateBalance(
        accountName: accountName, name: companyName, balance: newBalance);
  }

  addParty(partyType, partyName, partyDescription, emailAddress, contactNo,
      accountNo, payable, receivable) async {
    final db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    int companyID;
    var receivables;
    var payables;
    var IDquery = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
      receivables = element['TotalReceivable'];
      payables = element['TotalPayable'];
    });
    print(partyName);
    var res = await db.rawInsert('''
    INSERT INTO parties(
      PartyType,PartyName,Description,EmailAddress, ContactNo, AccountNo, Receivable, Payable
    ) VALUES (?,?,?,?,?,?,?,?)
    ''', [
      partyType,
      partyName,
      partyDescription,
      emailAddress,
      contactNo,
      accountNo,
      double.parse(receivable),
      double.parse(payable)
    ]);
    var tempQuery = await db.rawQuery('''
        UPDATE company
        SET TotalReceivable = ?,
            TotalPayable = ?
        WHERE CompanyID=?
      ''', [
      receivables + double.parse(receivable),
      payables + double.parse(payable),
      companyID
    ]);
    return res;
  }

  getParties() async {
    final db = await database;
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM parties;
      ''');
    print(parties);

    List<String> temp = [];
    parties.forEach((party) {
      temp.add(party['PartyName']);
    });

    return temp;
  }

  getData(name) async {
    final db = await database;
    var party;
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM parties WHERE PartyName= ?;
      ''', [name]);
    parties.forEach((element) => {party = element});
    return party;
  }

  getPartyList() async {
    final db = await database;
    var res = await db.query('parties', columns: ['PartyName', 'Receivable']);
    List<Map<String, String>> list = [];
    res.forEach((element) {
      list.add({
        'name': element['PartyName'],
        'amount': element['Receivable'].toString()
      });
    });
    return list;
  }

  getTransactionList() async {
    final db = await database;
    var res = await db.query('transactions',
        columns: ['TransactionID', 'TransactionType', 'Amount', 'Date']);
    List<Map<String, String>> list = [];
    res.forEach((element) {
      list.add({
        'type': element['TransactionType'],
        'amount': element['Amount'].toString(),
        'date': element['Date'],
        'orderID': element['TransactionID'].toString()
      });
    });
    return list;
  }

  getExpensesList() async {
    final db = await database;
    var res = await db.rawQuery('''
    SELECT * FROM(
    SELECT Type, Amount, Date
    FROM (expenses INNER JOIN 
    transactions ON expenses.ExpenseID = transactions.ExpenseID)
    UNION
    SELECT TransactionType, TotalPayable, transactions.Date
    FROM (orders INNER JOIN 
    transactions ON orders.OrderID = transactions.OrderID)
    WHERE orderType = ?)
    ORDER BY Date DESC
    ''', ['purchase']);
    List<ExpenseItem> list = [];
    res.forEach((element) {
      list.add(new ExpenseItem(
        type: element['Type'] == null
            ? element['TransactionType']
            : element['Type'],
        price: element['Amount'] == null
            ? element['TotalPayable']
            : element['Amount'].toString(),
        date: element['Date'],
      ));
    });
    return list;
  }

  getSalePurchaseList() async {
    final db = await database;
    var res = await db.rawQuery('''
        SELECT * 
        FROM orders INNER JOIN 
        (orderGoods INNER JOIN inventory ON inventory.productID = orderGoods.productID)
        ON orders.OrderID = orderGoods.OrderID
        ORDER BY Date DESC
    ''');
    List<SalePurchaseItem> list = [];
    res.forEach((element) {
      list.add(new SalePurchaseItem(
        type: element['OrderType'],
        price: element['Price'].toString(),
        date: element['Date'],
        name: element['ProductName'],
        quantity: element['Quantity'].toString(),
      ));
    });
    return list;
  }

  getTaxes() async {
    final db = await database;
    double totalPurchase = 0;
    double totalSale = 0;
    double purchaseTax = 0;
    double saleTax = 0;

    var temp1 = await db.rawQuery('''
        SELECT OrderID, OrderType
        FROM orders
      ''');

    print(temp1);

    await Future.wait(temp1.map((element) async {
      var temp2 = await db.rawQuery('''
        SELECT Price,Quantity,ProductID
        FROM orderGoods
        where OrderID=?
      ''', [element['OrderID']]);

      print(temp2);

      await Future.wait(temp2.map((element2) async {
        var temp3 = await db.rawQuery('''
        SELECT TaxRate, SalePrice
        FROM inventory
        where ProductID=?
      ''', [element2['ProductID']]);

        print(temp3);

        temp3.forEach((element3) {
          double cost = element2['Price'];
          int quantity = element2['Quantity'];
          double total = cost * quantity;
          double temp = element3['TaxRate'];
          double tax = (temp / 100) * total;
          if (element['OrderType'] == 'purchase') {
            totalPurchase += total;
            purchaseTax += tax;
          } else {
            double cost2 = element3['SalePrice'];
            double total2 = quantity * cost2;
            totalSale += total2;
            saleTax += tax;
          }
        });
      }));
    }));
    // Return
    print('$totalPurchase,$totalSale,$purchaseTax,$saleTax');
    return [totalPurchase, totalSale, purchaseTax, saleTax];
  }

  getItemList(name) async {
    final db = await database;
    int partyID;
    var list = (await db.query('parties',
            columns: ['PartyID'], where: 'PartyName = ?', whereArgs: [name]))
        .forEach((element) {
      partyID = element['PartyID'];
    });
    final List<Map<String, dynamic>> parties = await db.rawQuery('''
        SELECT * FROM inventory WHERE PartyID= ?;
      ''', [partyID]);
    List<InventoryItem> items = [];
    await Future.wait(parties.map((element) async {
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

  getInventory() async {
    final db = await database;
    List<InventoryItem> items = [];
    final List<Map<String, dynamic>> list = await db.rawQuery('''
        SELECT * FROM inventory
      ''');
    await Future.wait(list.map((element) async {
      var quantity = 0;
      var price = 0.0;
      var value = 0.0;
      var q = 0;
      var partyName = '';
      var query = await db.query('purchases',
          where: 'ProductID = ?', whereArgs: [element['ProductID']]);
      query.forEach((purchaseElement) {
        q = purchaseElement['Quantity'];
        quantity += q;
        price = purchaseElement['PurchasePrice'];
        value += (q * price);
      });
      var partyQuery = await db.query('parties',
          where: 'PartyID = ?', whereArgs: [element['PartyID']]);
      partyQuery.forEach((party) {
        partyName = party['PartyName'];
      });
      items.add(new InventoryItem(
          productID: element['ProductID'],
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

  updateBalance({accountName, name, balance}) async {
    final db = await database;
    print(name);
    bool set = true;
    if (accountName == null) {
      set = false;
    }
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['companyID'],
            where: 'companyName = ?',
            whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });

    print("company id is");
    print(companyID);
    if (set) {
      var temp = await db.rawQuery('''
        UPDATE accounts
        SET Balance= ?
        WHERE CompanyID=? AND BankName = ?
      ''', [balance, companyID, accountName]);
    } else {
      var temp = await db.rawQuery('''
        UPDATE accounts
        SET Balance= ?
        WHERE CompanyID=? AND BankName = ?
      ''', [balance, companyID, 'Cash']);
    }
  }

  //TODO: change the name as it is giving everything of account not only balance
  getBalance({accountName}) async {
    bool set = true;
    if (accountName == null) {
      set = false;
    }
    final db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['companyID'],
            where: 'companyName = ?',
            whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });
    if (set) {
      final List<Map<String, dynamic>> temp = await db.rawQuery('''
        SELECT * FROM  accounts WHERE CompanyID=? AND BankName = ?;
      ''', [companyID, accountName]);
      return temp;
    } else {
      final List<Map<String, dynamic>> temp = await db.rawQuery('''
        SELECT * FROM  accounts WHERE CompanyID=? AND BankName = ?;
      ''', [companyID, 'Cash']);
      return temp;
    }
  }

  getCompanyData(companyName) async {
    final db = await database;
    Map details = {};
    var query = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      print(element);
      details['CompanyID'] = element['CompanyID'];
      details['Payable'] = element['TotalPayable'];
      details['Receivable'] = element['TotalReceivable'];
    });
    return details;
  }

  getTransactions() async {
    List<String> monthList = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    Map<String, SaleExpense> list = {};
    final db = await database;
    var query = await db.rawQuery('''
      SELECT OrderType, TotalPayable, Date
      FROM orders
    ''');
    query.forEach((element) {
      var inputFormat = DateFormat("MM/dd/yyyy");
      var date = element['Date'];
      var tempDate = inputFormat.parse(date);
      if (list[monthList[tempDate.month - 1]] == null) {
        list[monthList[tempDate.month - 1]] = new SaleExpense();
      }
      if (element['OrderType'] == 'sale'){
        list[monthList[tempDate.month - 1]].sale += element['TotalPayable'];

      }
      else if (element['OrderType'] == 'purchase'){
        list[monthList[tempDate.month - 1]].expense += element['TotalPayable'];
      }
    });
    var res = await db.query(
        'transactions',
        columns: ['TransactionType', 'Amount', 'Date']);
    res.forEach((element) {
      var inputFormat = DateFormat("MM/dd/yyyy");
      var date = element['Date'];
      var tempDate = inputFormat.parse(date);
      if (list[monthList[tempDate.month - 1]] == null) {
        list[monthList[tempDate.month - 1]] = new SaleExpense();
      }
      if (element['TransactionType'] == 'sale' ||
          element['TransactionType'] == 'purchase') {
      }
      else if (element['TransactionType'] == 'equity') {

      }
      else {
        list[monthList[tempDate.month - 1]].expense += element['Amount'];
      }
    });
    return list;
  }

  getSaleItems() async {
    List<report_items> objects = [];
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['sale']);

    print(temp);
    await Future.wait(temp.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        print(nameIDquery);
        nameIDquery.forEach((element3) {
          objects.add(new report_items(
              itemName: element3['ProductName'], price: total.toInt()));
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

  getExpenseItems() async {
    List<report_items> objects = [];
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT ExpenseID, Type
        FROM expenses
      ''');

    print(temp);
    await Future.wait(temp.map((element) async {
      var amount;
      var transactionIDquery = await db.rawQuery('''
        SELECT Amount
        FROM transactions
        WHERE ExpenseID=?
      ''', [element['ExpenseID']]);

      transactionIDquery.forEach((element2) {
        amount = element2['Amount'];
        print('amount');
        print(amount);
        objects.add(
            new report_items(itemName: element['Type'], price: amount.toInt()));
      });

      print('expenses in db');
      print(objects[0].itemName);
      print(objects[0].price);
    }));

    var temp2 = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['purchase']);

    print(temp2);
    await Future.wait(temp2.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        print(nameIDquery);
        nameIDquery.forEach((element3) {
          objects.add(new report_items(
              itemName: element3['ProductName'], price: total.toInt()));
        });
      }));
    }));
    return objects;
  }

  getAccounts() async {
    final db = await database;
    List<String> accounts = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['companyID'],
            where: 'companyName = ?',
            whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });
    var temp = await db.rawQuery('''
        SELECT *
        FROM accounts
        WHERE CompanyID = ?
    ''', [companyID]);
    temp.forEach((element) {
      accounts.add(element['BankName']);
    });
    return accounts;
  }

  getTotalCost() async {
    final db = await database;
    double totalCost = 0;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['sale']);

    print(temp);
    await Future.wait(temp.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        int quantity = element2['Quantity'];
        double purchasePrice = 0;
        var purchaseQuery = await db.rawQuery('''
        SELECT PurchasePrice
        FROM purchases
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        purchaseQuery.forEach((element3) {
          purchasePrice = element3['PurchasePrice'];
          double total = purchasePrice * quantity;
          print(total);
          totalCost += total;
        });
      }));
    }));

    return totalCost;
  }

  getPayableReceivable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    double payable = 0;
    double receivable = 0;
    final db = await database;

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
    return [payable, receivable];
  }

  getInventoryCost() async {
    final db = await database;
    double totalCost = 0;

    var temp = await db.rawQuery('''
        SELECT ProductID
        FROM inventory
      ''');

    print(temp);
    await Future.wait(temp.map((element) async {
      var temp2 = await db.rawQuery('''
        SELECT Quantity,PurchasePrice
        FROM purchases
        where ProductID = ?        
      ''', [element['ProductID']]);

      print(temp2);

      temp2.forEach((element2) {
        int quantity = element2['Quantity'];
        double price = element2['PurchasePrice'];
        double val = price * quantity;
        totalCost += val;
      });
    }));
    print('total cost is $totalCost');
    return totalCost;
  }

  getOrderList(partyName) async {
    List<Order> orders = [];
    final db = await database;
    int partyID;
    var list = (await db.query('parties',
            columns: ['PartyID'],
            where: 'PartyName = ?',
            whereArgs: [partyName]))
        .forEach((element) {
      partyID = element['PartyID'];
    });
    var orderQuery = await db.query('orders',
        columns: [
          'Date',
          'OrderID',
          'OrderType',
          'TotalPayable',
          'TotalReceived',
        ],
        where: 'PartyID = ?',
        whereArgs: [partyID],
        orderBy: 'Date DESC');
    double rec;
    orderQuery.forEach((element) {
      print(element['TotalPayable'].runtimeType);
      if(element['TotalReceived'].runtimeType == String){
        print(element['TotalReceived']);
        try{
          rec = double.parse(element['TotalReceived']);
        }
        catch(e) {
          rec = 0;
        }
      }
      else{
        rec = element['TotalReceived'];
      }
      double total = element['TotalPayable'];
      double received = rec;

      orders.add(new Order(
          type: element['OrderType'],
          name: element['OrderID'].toString(),
          date: element['Date'],
          amount: (total - received).toString()));
    });
    return orders;
  }

  getOrderDetails({id}) async {
    final db = await database;
    List<addItem> items = [];
    int orderID = int.parse(id);
    int partnerID;
    String partnerName;
    double partyPay;
    double partyRec;
    String date;
    double payable = 0.0;
    double received = 0.0;
    var price;
    var type;

    var partyQuery = (await db.rawQuery('''
        SELECT PartyID, TotalPayable, TotalReceived from orders WHERE OrderID = ?
    ''', [orderID])).forEach((element) {
          partnerID = element['PartyID'];
          payable = element['TotalPayable'];
          double rec;
          if(element['TotalReceived'].runtimeType == String){
            print(element['TotalReceived']);
            try{
              rec = double.parse(element['TotalReceived']);
            }
            catch(e) {
              rec = 0;
            }
          }
          else{
            rec = element['TotalReceived'];
          }
          received = rec;
    });
    // print(id.runtimeType);
    var temp1 = await db.rawQuery('''
        SELECT * 
        FROM inventory INNER JOIN 
        (orders INNER JOIN orderGoods ON orderGoods.OrderID = orders.OrderID) AS T 
        ON inventory.ProductID = T.ProductID
        WHERE T.OrderID = ?
    ''', [orderID]);
    await Future.wait(temp1.map((element) async {
      price = element['Price'];
      date = element['Date'];
      type = element['OrderType'];
      items.add(new addItem(
        itemName: element['ProductName'],
        price: price.toInt(),
        quantity: element['Quantity'],
      ));
    }));
    var temp2 = await db.rawQuery('''
        SELECT * FROM parties WHERE PartyID = ?
    ''', [partnerID]);
    temp2.forEach((element) {
      partnerName = element['PartyName'];
      partyRec = element['Receivable'];
      partyPay = element['Payable'];
    });
    var order = {
      'partyName': partnerName,
      'balance': (partyPay - partyRec),
      'orderList': items,
      'date': date,
      'payable': payable - received,
      'type': type
    };
    print('orderID = $orderID, partyID = $partnerID, partyName = $partnerName');
    return order;
  }

  getAssets() async {
    final db = await database;
    List<report_items> objects = [];

    var temp = await db.rawQuery('''
        SELECT Type,Value
        FROM assets
      ''');

    temp.forEach((element) {
      double val = element['Value'];
      objects
          .add(new report_items(itemName: element['Type'], price: val.toInt()));
    });

    print(objects);
    return objects;
  }

  updateOrder(partyName, type, orderID, received, amount, accountName) async {
    final db = await database;
    var payable;
    var receivable;
    var totalPayable;
    var totalReceivable;
    var partyID;
    double orderReceived;
    double companyBalance;
    double rec;
    if(received.runtimeType == String){
      try{
        rec = double.parse(received);
      }
      catch(e) {
        rec = 0;
      }
    }
    else{
      rec = received;
    }
    received = rec;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var companyName = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
            where: 'CompanyName = ?',
            whereArgs: [companyName]))
        .forEach((element) {
      companyID = element['CompanyID'];
      totalReceivable = element['TotalReceivable'];
      totalPayable = element['TotalPayable'];
    });
    var temp4 = (await db.query('orders',
    columns: ['TotalReceived'],
    where: 'OrderID = ?',
    whereArgs: [orderID])).forEach((element) {
      double rec;
      if(element['TotalReceived'].runtimeType == String){
        print(element['TotalReceived']);
        try{
          rec = double.parse(element['TotalReceived']);
        }
        catch(e) {
          rec = 0;
        }
      }
      else{
        rec = element['TotalReceived'];
      }
      orderReceived = rec;
    });

    List<Map<String, dynamic>> temp =
        await DBprovider.db.getBalance(accountName: accountName);
    temp.forEach((element) {
      companyBalance = element['Balance'];
    });
    var list = (await db.query('parties',
            columns: ['PartyID', 'Receivable', 'Payable'],
            where: 'PartyName = ?',
            whereArgs: [partyName]))
        .forEach((element) {
      partyID = element['PartyID'];
      payable = element['Payable'];
      receivable = element['Receivable'];
    });
    DateTime now = DateTime.now();
    String date = DateFormat('yMd').format(now); // 28/03/2020
    await db.rawInsert('''
        INSERT INTO transactions(
          OrderID, Amount, TransactionType, Date
          ) VALUES (?,?,?,?)
      ''', [orderID, received, type, date]);

    print('receivable :$receivable, amount: $amount, received: $received');
    double newReceivable = receivable;
    double newPayable = payable;
    if (type == 'sale') {
      newReceivable -= received;
      totalReceivable -= received;
      await db.rawQuery('''
       UPDATE parties
        SET Receivable = ?
        WHERE PartyID=?
      ''', [newReceivable, partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalReceivable = ?
        WHERE CompanyID = ?
      ''', [totalReceivable, companyID]);
      await db.rawQuery('''
        UPDATE orders
        SET TotalReceived = ?
        WHERE OrderID = ?
      ''', [orderReceived + received, orderID]);
      updateBalance(
          accountName: accountName,
          name: companyName,
          balance: companyBalance + received);
    } else {
      newPayable -= received;
      totalPayable -= received;
      await db.rawQuery('''
       UPDATE parties
        SET Payable = ?
        WHERE PartyID=?
      ''', [newPayable, partyID]);
      await db.rawQuery('''
       UPDATE company
        SET TotalPayable = ?
        WHERE CompanyID=?
      ''', [totalPayable, companyID]);
      await db.rawQuery('''
        UPDATE orders
        SET TotalReceived = ?
        WHERE OrderID = ?
      ''', [orderReceived + received, orderID]);
      updateBalance(
          accountName: accountName,
          name: companyName,
          balance: companyBalance - received);
    }
  }

  getAccountBalances() async {
    final db = await database;
    var accounts = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    int companyID;
    var IDquery = (await db.query('company',
            columns: ['companyID'],
            where: 'companyName = ?',
            whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
    });
    var temp = await db.rawQuery('''
        SELECT *
        FROM accounts
        WHERE CompanyID = ?
    ''', [companyID]);
    Future.wait(temp.map((element) async {
      accounts
          .add({'name': element['BankName'], 'balance': element['Balance']});
    }));
    print(accounts);
    return accounts;
  }

  getCashEquivalents() async {
    final db = await database;
    double cash = 0;

    var temp = await db.rawQuery('''
        SELECT Balance
        FROM accounts
      ''');

    temp.forEach((element) {
      cash += element['Balance'];
    });

    print('cash equivalents are $cash');
    return cash;
  }

  getEquity() async {
    List<report_items> obj = [];
    final db = await database;

    var temp = await db.rawQuery('''
        SELECT Type,Amount
        FROM equity
      ''');

    temp.forEach((element) {
      double temp = element['Amount'];
      obj.add(new report_items(itemName: element['Type'], price: temp.toInt()));
    });

    print('equity is $obj');
    return obj;
  }

  getInventoryReportDetails() async {
    List<inventory_items> objects = [];
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['sale']);

    print(temp);
    await Future.wait(temp.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        var purchaseIDquery = await db.rawQuery('''
        SELECT PurchasePrice
        FROM purchases
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        double price2 = 0;
        purchaseIDquery.forEach((element4) {
          price2 = element4['PurchasePrice'];
        });

        String name;
        nameIDquery.forEach((element3) {
          name = element3['ProductName'];
        });

        double profitAndLoss = (cost - price2) * quantity;
        double sale = cost * quantity;
        print(nameIDquery);

        int check = 1;
        objects.forEach((element5) {
          if (name == element5.itemName) {
            check = 0;
            element5.profit_loss += profitAndLoss;
            element5.sale += sale;
          }
        });

        if (check == 1) {
          objects.add(new inventory_items(
              itemName: name, profit_loss: profitAndLoss, sale: sale));
        }
      }));
    }));

    return objects;
  }

  getTurnoverRatio() async {
    List<inventory_items> objects = [];
    double totalSale = 0;
    double totalInventory = 0;
    double turnoverratio = 0;
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['sale']);

    print(temp);
    await Future.wait(temp.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        totalInventory = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        var purchaseIDquery = await db.rawQuery('''
        SELECT PurchasePrice
        FROM purchases
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        double price2 = 0;
        purchaseIDquery.forEach((element4) {
          price2 = element4['PurchasePrice'];
        });

        String name;
        nameIDquery.forEach((element3) {
          name = element3['ProductName'];
        });

        double profitAndLoss = (cost - price2) * quantity;
        double sale = cost * quantity;
        print(nameIDquery);

        int check = 1;
        objects.forEach((element5) {
          if (name == element5.itemName) {
            check = 0;
            element5.profit_loss += profitAndLoss;
            element5.sale += sale;
          }
        });

        if (check == 1) {
          objects.add(new inventory_items(
              itemName: name, profit_loss: profitAndLoss, sale: sale));
        }

        objects.forEach((element6) {
          totalSale += element6.sale;
        });

        turnoverratio = totalSale / totalInventory;
      }));
    }));

    return turnoverratio;
  }

  getTurnoverDay() async {
    List<inventory_items> objects = [];
    double totalSale = 0;
    double totalInventory = 0;
    double turnoverday = 0;
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT OrderID
        FROM orders
        WHERE OrderType=?
      ''', ['sale']);

    print(temp);
    await Future.wait(temp.map((element) async {
      var productIDquery = await db.rawQuery('''
        SELECT ProductID,Quantity,Price
        FROM orderGoods
        WHERE OrderID=?
      ''', [element['OrderID']]);

      print(productIDquery);

      await Future.wait(productIDquery.map((element2) async {
        double cost = element2['Price'];
        int quantity = element2['Quantity'];
        double total = cost * quantity;
        totalInventory = cost * quantity;
        print(total);

        var nameIDquery = await db.rawQuery('''
        SELECT ProductName
        FROM inventory
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        var purchaseIDquery = await db.rawQuery('''
        SELECT PurchasePrice
        FROM purchases
        WHERE ProductID=?
      ''', [element2['ProductID']]);

        double price2 = 0;
        purchaseIDquery.forEach((element4) {
          price2 = element4['PurchasePrice'];
        });

        String name;
        nameIDquery.forEach((element3) {
          name = element3['ProductName'];
        });

        double profitAndLoss = (cost - price2) * quantity;
        double sale = cost * quantity;
        print(nameIDquery);

        int check = 1;
        objects.forEach((element5) {
          if (name == element5.itemName) {
            check = 0;
            element5.profit_loss += profitAndLoss;
            element5.sale += sale;
          }
        });

        if (check == 1) {
          objects.add(new inventory_items(
              itemName: name, profit_loss: profitAndLoss, sale: sale));
        }

        objects.forEach((element6) {
          totalSale += element6.sale;
        });

        turnoverday = (totalInventory *365) / totalSale;
      }));
    }));

    return turnoverday;
  }

  getPartyDetails() async {
    final db = await database;
    var temp = await db.rawQuery('''
        SELECT *
        FROM parties
      ''');

    return temp;
  }
  removeProduct(productName) async{
    final db = await database;
    int productID;
    var temp = await db.rawQuery('''
    SELECT productID FROM inventory WHERE ProductName = ?
    ''', [productName]);
    temp.forEach((element) {
      productID = element['ProductID'];
    });
    var query = await db.rawDelete('''
      DELETE FROM inventory WHERE ProductID = ?
    ''', [productID]);
  }
  removeParty(partyName) async{
    final db = await database;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('companyName');
    int companyID;
    var receivables;
    var payables;
    var IDquery = (await db.query('company',
        columns: ['CompanyID', 'TotalPayable', 'TotalReceivable'],
        where: 'CompanyName = ?',
        whereArgs: [name]))
        .forEach((element) {
      companyID = element['CompanyID'];
      receivables = element['TotalReceivable'];
      payables = element['TotalPayable'];
    });
    int partyID;
    double rec;
    double pay;
    var temp = await db.rawQuery('''
    SELECT PartyID, Receivable, Payable FROM parties WHERE PartyName = ?
    ''', [partyName]);
    temp.forEach((element) {
      partyID = element['PartyID'];
      rec = element['Receivable'];
      pay = element['Payable'];

    });
    var query = await db.rawDelete('''
      DELETE FROM parties WHERE PartyID = ?
    ''', [partyID]);
    double newRec = receivables - rec;
    double newPay = payables - pay;
    if (query != 0){
      await db.rawQuery('''
       UPDATE company
        SET TotalReceivable = ?,
            TotalPayable = ?
        WHERE CompanyID=?
      ''', [newRec, newPay, companyID]);
    }
  }


  getLoanAmount()async{
    final db = await database;

    print('here');
    double val= 0;
    var temp = await db.rawQuery('''
        SELECT *
        FROM liabilities
      ''');

    temp.forEach((element) {
      val+= element['BaseAmount'];
    });

    print(val);
    return val;
  }
}

