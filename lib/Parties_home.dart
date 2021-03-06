//import 'package:asaanrozgar/Widgets/searchbar.dart';
import 'package:asaanrozgar/DataBase.dart';
import 'package:asaanrozgar/Widgets/filter_reports.dart';
import 'package:asaanrozgar/Widgets/inventory_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asaanrozgar/Widgets/long_circleBtt.dart';
import 'package:asaanrozgar/Widgets/textfield.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:asaanrozgar/Widgets/std_appbar.dart';
import 'package:asaanrozgar/Widgets/temp.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:asaanrozgar/Widgets/std_chinbar.dart';
import 'package:provider/provider.dart';
import 'package:asaanrozgar/Widgets/FAB.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:asaanrozgar/drawer.dart';

// void main() {
//   // TestWidgetsFlutterBinding.ensureInitialized();
//   runApp(MaterialApp(
//       theme: ThemeData(
//         primaryColor: Color.fromRGBO(11, 71, 109, 1.0),
//         accentColor: Colors.white,
//         textTheme: GoogleFonts.latoTextTheme(),
//       ),
//       home: partiesHome()
//   ));
// }

class ListItem extends StatelessWidget {

  const ListItem({this.name, this.amount, this.date});
  final name;
  final amount;
  final date;
  @override
  Widget build(BuildContext context) {
    return  Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget>[
      ],
      child: TextButton(
        onPressed: ()=> {
          Navigator.pushNamed(context, '/party', arguments:
          {'name': name})
        },
        child: Column(
          children: [
            ListTile(
              title: Text(name,
                style:TextStyle(
                  fontFamily: "Lato",
                  fontWeight: FontWeight.normal,
                  fontSize: 17.0,
                  color: Color.fromRGBO(38, 51, 58, 1.0),
                ),
              ),
              subtitle: Text(date == null ? '':date),
              trailing:
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(amount,
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color.fromRGBO(46, 189, 133, 1.0),
                    ),
                  ),
                  Text('You will get',
                    style:TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Color.fromRGBO(46, 189, 133, 1.0),
                    ),
                  ),
                ],
              ),

            ),
            Divider(height: 1, thickness: 0.5, endIndent: 15,),
          ],
        ),
      ),
    );
  }
}

class partiesHome extends StatefulWidget {

  @override
  _partiesHomeState createState() => _partiesHomeState();
}

class _partiesHomeState extends State<partiesHome> {
  @override
  Widget build(BuildContext context) {
    int color_Red = 109;
    int color_Green = 11;
    int color_Blue = 93;
    double phone_width = MediaQuery.of(context).size.width;
    double phone_height = MediaQuery.of(context).size.height;
    double longBtt_width = phone_width * 0.487;
    double longBtt_height = phone_height* 0.051;
    double textfield_gap = phone_height *0.0125; 
    double button_gap = phone_height *0.063;
    double divider_width = phone_width * 0.8;
    List<ChildButton> buttons = [ChildButton(label: 'Add Party', icon: Icon(Icons.add_shopping_cart, color: Colors.white,), route: '/addParty')];
    return ChangeNotifierProvider(
      create: (context) => PartyModel(),
      child: Scaffold(
          backgroundColor: Color.fromRGBO(color_Red, color_Green, color_Blue,1.0),
          endDrawer: drawer(),
          appBar: std_appbar(context, 'Partners', color_Red, color_Green, color_Blue),
            floatingActionButton: std_FAB(Colors.white, color_Red, color_Green, color_Blue, buttons, context),
              bottomNavigationBar: std_chinbar(context, color_Red,color_Green,color_Blue),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Column(
            //TODO: NEED TO IMPLEMENT SEARCH BAR
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                child: Consumer<PartyModel>(
                    builder:(context, party, child){
                      return TextField(
                        onChanged: (text){
                          party.searchItems(text);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.fromLTRB(20,3,20,3),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Search',
                          hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                const Radius.circular(16.0),)
                          ),
                        ),
                      );
                    })
              ),
              Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.0),
                      topRight: Radius.circular(22.0)
                    )
                  ),
                   child: Column(
                        children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top:20.0, left:10, right:10),
                                child: SizedBox(
                                  child: Consumer<PartyModel>(
                                    builder: (context, party, child){
                                        return SingleChildScrollView(
                                        child: Column(
                                        children: party.partyList.map<Widget>((item) => ListItem(name:item.name, amount:item.amount)).toList()

                                        ),
                                        );
                                        }),
                            ),
                              ),
                          )
                        ],
                      ),
                ),
              )
            ],
            ),

        ),
    );
  }
}
class Party{
  var name;
  var amount;
  bool display = true;
  Party({this.name, this.amount});
  setBool(bool newVal) {
    display = newVal;
  }
}

class PartyModel extends ChangeNotifier{
  List<Party> parties = [];
  List<Party> get partyList => parties.where((element)=>element.display == true).toList();
  PartyModel(){
    var initFuture = initializeScreen();
    initFuture.then((voidVal){
      notifyListeners();
    });
  }
  initializeScreen() async{
    var temp = await DBprovider.db.getPartyList();
    temp.forEach((element){
      parties.add(new Party(
        name:element['name'],
        amount: element['amount'].toString()
      ));
    });
  }
  searchItems(text){
    print(text);
    text = text.toLowerCase();
    RegExp match = new RegExp('^$text');
    parties.forEach((element) {
      if (!match.hasMatch(element.name.toLowerCase())){
        element.setBool(false);
      }
      else{
        element.setBool(true);
      }
    });
    notifyListeners();
  }
}
