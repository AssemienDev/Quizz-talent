import 'package:flutter/material.dart';
import 'package:quiztalent/avancer_quizz_page.dart';
import 'package:quiztalent/facile_quizz_page.dart';
import 'package:quiztalent/historique.dart';
import 'package:quiztalent/leadboards.dart';
import 'package:quiztalent/normale_quizz_page.dart';
import 'package:quiztalent/text_with_style.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';





class Globals {
  static int facile = 0;
  static int normale = 0;
  static int avancer = 0;
}

class PageGame extends StatefulWidget{

  @override
  StatePageGame  createState() => StatePageGame();
}


class StatePageGame extends State<PageGame> {

  final player = AudioPlayer();
  String? volume;

  Future<void> playAudioFromAsset() async{
    await player.play(AssetSource("select-sound-121244.mp3"));
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
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizz Talent", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromRGBO(46, 66, 90, 1),
        actions: [
          (this.volume == "desactiver") ?
          IconButton(onPressed: (){
            setState(() {
              preferences.setString('volume', 'activer');
              this.volume = "activer";
            });
          }, icon: Icon(Icons.volume_off, color: Colors.white,)) : IconButton(onPressed: (){
            setState(() {
              preferences.setString('volume', 'desactiver');
              this.volume = "desactiver";
            });
          }, icon: Icon(Icons.volume_up, color: Colors.white))
        ],
      ),
      body: Container(
        color: const Color.fromRGBO(36,42,64, 1),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Spacer(),
              Card(
                color: const Color.fromRGBO(46, 66, 90, 1),
                elevation: 10,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(padding: const EdgeInsets.all(19), child: Image.asset("images/cover.jpg",
                      height: height/2.1, width: width*0.9, fit: BoxFit.cover ,),),
                    Center(
                      child: TextWithStyle(data: "Choisi ton niveau:", color: Colors.white,),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(this.volume == "activer"){
                              playAudioFromAsset();
                            }
                            Navigator.of(context).push(_createRouteFacile());
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange
                        ),
                          child: const Text("Facile" , style: TextStyle(color: Colors.white),),),
                        ElevatedButton(
                          onPressed: (){
                            if(this.volume == "activer"){
                              playAudioFromAsset();
                            }
                            Navigator.of(context).push(_createRouteNormale());
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange
                        ),
                          child: const Text("Normal" , style: TextStyle(color: Colors.white),),),
                        ElevatedButton(
                          onPressed: (){
                            if(this.volume == "activer"){
                              playAudioFromAsset();
                            }
                            Navigator.of(context).push(_createRouteAvancer());
                          }, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange
                        ),
                          child: const Text("Avancé" , style: TextStyle(color: Colors.white),),),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width:320,
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(46, 66, 90, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, color: Color.fromARGB(255,230,129,47,), size: 45),
                    TextButton(onPressed: (){
                      if(this.volume == "activer"){
                        playAudioFromAsset();
                      }
                      Navigator.of(context).push(_historique());
                    }, child: Icon(Icons.history, color: Colors.white, size: 45)),
                    TextButton(onPressed: (){
                      if(this.volume == "activer"){
                        playAudioFromAsset();
                      }
                      Navigator.of(context).push(leadRoute());
                    }, child: Icon(Icons.leaderboard, color: Colors.white, size: 45)),
                  ],
                ),
              )
            ]
        ),
      ),
    );
  }


  Route _createRouteFacile() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FacileQuizzPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = 0.0;
        final end = 1.0;
        final curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },

    );
  }


  Route _createRouteNormale() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => NormaleQuizzPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = 0.0;
        final end = 1.0;
        final curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },

    );
  }


  Route _createRouteAvancer() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AvancerQuizzPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = 0.0;
        final end = 1.0;
        final curve = Curves.ease;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },

    );
  }


  Route _historique() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Historique(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = 0.5; // Taille moyenne
        final end = 1.0; // Pleine taille
        final curve = Curves.bounceOut; // Courbe de rebondissement

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },

    );
  }

  Route leadRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Leadboard(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = 0.5; // Taille moyenne
        final end = 1.0; // Pleine taille
        final curve = Curves.bounceOut; // Courbe de rebondissement

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        final scaleAnimation = animation.drive(tween);

        return ScaleTransition(
          scale: scaleAnimation,
          child: child,
        );
      },

    );
  }
}