
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:quiztalent/text_with_style.dart';
import 'package:connectivity/connectivity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class LeadboardNormale extends StatefulWidget{
  @override
  StateLeadboardNormale createState() => StateLeadboardNormale();
}

class StateLeadboardNormale extends State<LeadboardNormale>{

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool result = await InternetConnectionChecker().hasConnection;
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if( result == true){
        return true;
      }else{
        return false;
      }
    } else {
      return false;
    }
  }



  bool? bool1;
  bool trouver = false;

  // Accéder aux données récupérées
  Map<String, int> scoresMap = {};


  Future init() async {

    bool isConnected = await checkInternetConnection();

    if(isConnected){
      bool1 = true;

      // Effectuer une requête JOIN pour récupérer les scores associés aux utilisateurs avec un niveau facile
      final response = await Supabase.instance.client
          .from('score')
          .select('''
              id,
              normale, 
              user:id ( id, nom_gamer )
            ''').order('normale',ascending: false);


      if (response == null) {
        print('Erreur lors de la récupération des scores');
        trouver = false;
        setState(() {
          this.trouver = trouver;
        });

        return;
      }else{
        // Accéder aux données récupérées
        Map<String, int> scoresMap = {};


        for (int i = 0; i < response.length && i<20; i++) {
          String nomGamer = response[i]['user']['nom_gamer'];
          int score = response[i]['normale'];
          scoresMap[nomGamer] = score;
        }
        trouver = true;

        setState(() {
          this.scoresMap = scoresMap;
          this.trouver = trouver;
        });

      }


    }else{
      final snackbar = SnackBar(content: TextWithStyle(data: "Veuillez vous connecter a internet", color: Colors.white,), backgroundColor: Colors.deepOrange,);
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      bool1 = false;
    }
    print(bool1);

  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LeadBoardNormale", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromRGBO(46, 66, 90, 1),
      ),
      body: Container(
          color: const Color.fromRGBO(36,42,64, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 50),child: Center(
                  child: Text("LeadBoard Des talentueux du Niveau Normale(Top20)", style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ), textAlign: TextAlign.center,),
                )
                ),
                Padding(padding: EdgeInsets.only(top: 20),
                  child: Card(
                    margin: EdgeInsets.all(25),
                    color: Color.fromRGBO(46, 66, 90, 1),
                    elevation: 8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: this.trouver ? meuilleure() : TextWithStyle(data: "Aucun joueur", color: Colors.white, size: 50,),
                    ),
                  ),
                )
              ],
            ),
          )
      ),
    );
  }


  Column meuilleure() {
    List<Widget> elements = [];
    scoresMap.forEach((key, value) {
      elements.add(
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWithStyle(data: "$key : $value", size: 30, color: Colors.white),
              const Divider(
                thickness: 10,
                color: Colors.deepOrange,
              ),
              // If Drawer was mistakenly included here, remove it
            ],
          ),
        ),
      );
    });
    return Column(
      mainAxisSize: MainAxisSize.min, // Adjust the mainAxisSize if needed
      children: elements,
    );
  }



}

