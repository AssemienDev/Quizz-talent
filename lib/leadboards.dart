
import 'package:flutter/material.dart';
import 'package:quiztalent/leadboard_difficile.dart';
import 'package:quiztalent/leadboard_facile.dart';
import 'package:quiztalent/leardboard_normale.dart';
import 'package:quiztalent/text_with_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';


class Leadboard extends StatefulWidget{
  @override
  StateLeadboard createState() => StateLeadboard();
}

class StateLeadboard extends State<Leadboard>{

  String? volume;

  final player = AudioPlayer();

  Future<void> playAudioFromAsset() async{
    await player.play(AssetSource("select-sound-121244.mp3"));
  }


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

  late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? volume = preferences.getString('volume');
    setState(() {
      this.volume = (volume) != null ? volume : "activer";
    });

    bool isConnected = await checkInternetConnection();

    if(isConnected){
      bool1 = true;

      String? nomGamer = preferences.getString('username');
      int id = -1;

      if (nomGamer != null) {
        var response = await Supabase.instance.client.from('user').select('id').eq('nom_gamer', nomGamer).single();

        if (response.values != null) {
          // L'utilisateur a été trouvé, récupérer son ID
          id = response['id'] as int;
          print(id);
        }
      }

      if (id != -1) {
        // Construire les données à insérer ou mettre à jour
        Map<String, dynamic> data = {
          'id': id,
          'facile': preferences.getInt('facile') ?? 0,
          'normale': preferences.getInt('normale') ?? 0,
          'avancer': preferences.getInt('avancer') ?? 0,
        };

        // Exécuter l'opération upsert
        var result = await Supabase.instance.client.from('score').upsert(data);

        if (result != null && result.error != null) {
          // Une erreur s'est produite lors de l'opération upsert
          print('Erreur lors de l\'opération upsert: ${result.error!.message}');
        } else {
          print('Données insérées ou mises à jour avec succès');
        }

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
          title: const Text("LeadBoard", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromRGBO(46, 66, 90, 1),
        ),
      body: Container(
        color: const Color.fromRGBO(36,42,64, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 130),child: TextWithStyle(data: "LeadBoard Des talentueux", color: Colors.white, size: 30,),),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 50), child: TextButton(onPressed: (){
                      if(preferences.getString('volume') == "activer"){
                        playAudioFromAsset();
                      }
                            Navigator.of(context).push(leadBoardFacile());
                    }, child: TextWithStyle(data: "Niveau: Facile",color: Colors.white, size: 30,), style: TextButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      fixedSize: Size(300, 70)
                    ),

                    ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50) , child: TextButton(onPressed: (){
                      if(preferences.getString('volume') == "activer"){
                        playAudioFromAsset();
                      }
                      Navigator.of(context).push(leadBoardNormale());
                    }, child: TextWithStyle(data: "Niveau: Normale",color: Colors.white, size: 30,), style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        fixedSize: Size(300, 70)
                    ),
                    ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50), child: TextButton(onPressed: (){
                      if(preferences.getString('volume') == "activer"){
                        playAudioFromAsset();
                      }
                      Navigator.of(context).push(leadBoardAvancer());
                    }, child: TextWithStyle(data: "Niveau: Avancer",color: Colors.white, size: 30,), style: TextButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        fixedSize: Size(300, 70)
                    ),
                    ),
                    )
                  ],
                )
              )
            ],
          )
      ),
    );
  }

  Route leadBoardFacile() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LeadboardFacile(),
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

  Route  leadBoardNormale() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LeadboardNormale(),
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

  Route  leadBoardAvancer() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LeadboardAvancer(),
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

}