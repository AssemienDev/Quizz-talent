
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiztalent/historique.dart';
import 'package:quiztalent/page_game.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quiztalent/text_with_style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';




class Globals {
  static int facile = 0;
  static int normale = 0;
  static int avancer = 0;
}

class HomePage extends StatefulWidget{

  @override
  StateHomePage createState() => StateHomePage();
}


class StateHomePage extends State<HomePage> {

  String? volume;
  String? erreur;

  final player = AudioPlayer();

  Future<void> playAudioFromAsset() async{
    await player.play(AssetSource("select-sound-121244.mp3"));
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }


  late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? volume = preferences.getString('volume');
    setState(() {
      this.volume = (volume) != null ? volume : "activer";
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
    checkInternetConnection();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Quizz Talent", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromRGBO(46, 66, 90, 1),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height-80,
          child: Container(
              color: const Color.fromRGBO(36,42,64, 1),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Card(
                      color: const Color.fromRGBO(46, 66, 90, 1),
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(padding: const EdgeInsets.all(8), child:Column(
                            children: [
                              Image.asset("images/cover.jpg",
                                height: height/2.1, width: width*0.9, fit: BoxFit.cover ,),
                              Container(
                                child: const Text("<<Quizz Talent>> est un jeu de quiz sur l'informatique, l'alimentation, culture générale chronométré avec trois niveaux de difficulté où les joueurs choisissent entre vrai ou faux pour répondre aux questions.",
                                  style: TextStyle(color: CupertinoColors.white, fontSize: 20),),
                              )
                            ],
                          ),),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async{
                                  if(preferences.getString('volume') == "activer") {

                                    playAudioFromAsset();
                                    if( preferences.getString('username') != null){
                                      Navigator.of(context).push(_createRoute());
                                    }else{
                                      simpleDialog(context);
                                    }
                                  }else{
                                    if( preferences.getString('username') != null){
                                      Navigator.of(context).push(_createRoute());
                                    }else{
                                      simpleDialog(context);
                                    }
                                  }
                                }, style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                minimumSize: Size(100, 50),
                              ),
                                child: const Text("Commencer" , style: TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.bold,fontSize: 18 ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]
              )
          ),
        ),
      )
    );
  }


  Future<void> simpleDialog(BuildContext context) async{

    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext contex){
          return SimpleDialog(
            backgroundColor: CupertinoColors.white,
            title: Center(
              child: TextWithStyle(data: "Nom Gamer",weight: FontWeight.bold, size: 17),
            ),
            children: [
              TextFormField(
                onFieldSubmitted: (value) async{
                  bool isConnected = await checkInternetConnection();
                  if(isConnected){
                      insertData(value);
                      preferences.setString('username', value);
                      Navigator.of(context).pop();
                      Navigator.of(context).push(_createRoute());
                  }else{
                   final snackbar = SnackBar(content: TextWithStyle(data: "Veuillez vous connecter a internet", color: Colors.white,), backgroundColor: Colors.deepOrange,);
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
              ),
             TextWithStyle(data: "${erreur != null ? erreur : ""} "),
             Center(child:  TextWithStyle(data: "(Être connecter a internet)", color: Colors.deepOrange,),)
            ],
          );
        });
  }


  Future<void> insertData(String value) async {

    var response = await Supabase.instance.client.from('user').select('nom_gamer').eq('nom_gamer', value);


    if (!response.isEmpty) {
      print('La valeur existe déjà');
      setState(() {
        this.erreur = "Username existe déja";
      });

    } else {
        await Supabase.instance.client.from('user').insert({'nom_gamer':value});
        print('Données insérées avec succès');

      }
    }
  }



  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PageGame(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
