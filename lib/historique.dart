import 'package:flutter/material.dart';
import 'package:quiztalent/home_page.dart';
import 'package:quiztalent/leadboards.dart';
import 'package:quiztalent/text_with_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';



class Historique extends StatefulWidget{

  @override
  StateHistorique createState() => StateHistorique();

}


class StateHistorique extends State<Historique> {

  final player = AudioPlayer();
  String? volume;

  Future<void> playAudioFromAsset() async{
    await player.play(AssetSource("select-sound-121244.mp3"));
  }

  late SharedPreferences preferences;
  int? facile;
  int? normale;
  int? avancer;

  Future init() async {
    preferences = await SharedPreferences.getInstance();

    int? facile = preferences.getInt('facile');
    int? normale = preferences.getInt('normale');
    int? avancer = preferences.getInt('avancer');
    String? volume = preferences.getString('volume');

    setState(() {
      this.facile = facile;
      this.normale = normale;
      this.avancer = avancer;
      this.volume = volume;
    });
  }




  @override
  void initState() {
    super.initState();
    init();
  }


  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Historique du Quizz", style: TextStyle(color: Colors.white),), backgroundColor: const Color.fromRGBO(46, 66, 90, 1),),
      child:
      Container(
        color: const Color.fromRGBO(36,42,64, 1),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Spacer(),
              Card(
                color: const Color.fromRGBO(46, 66, 90, 1),
                elevation: 10,
                child: Center(
                  child: Container(
                    width: 200,
                    height: 400,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 50), child: TextWithStyle(data:"Historique", weight: FontWeight.bold,size: 40, color: Colors.white,),),
                        Padding(padding: EdgeInsets.only(top: 30), child: TextWithStyle( data: "Facile: ${(this.facile!=null) ? this.facile : "0"}", color: Colors.white, weight: FontWeight.w800,size: 30,),),
                        Padding(padding: EdgeInsets.only(top: 30), child: TextWithStyle( data: "Normale: ${(this.normale!=null) ? this.normale : "0"}", color: Colors.white, weight: FontWeight.w800,size: 30,),),
                        Padding(padding: EdgeInsets.only(top: 30), child: TextWithStyle( data: "Avancer: ${(this.avancer!=null) ? this.avancer: "0"}", color: Colors.white, weight: FontWeight.w800,size: 30,),)
                      ],
                    ),
                  ),
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
                    TextButton(onPressed: (){
                      if(this.volume == "activer"){
                        playAudioFromAsset();
                      }
                      Navigator.of(context).pop();
                    }, child: Icon(Icons.home, color: Colors.white, size: 45)),
                    Icon(Icons.history, color: Color.fromARGB(255,230,129,47,), size: 45),
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