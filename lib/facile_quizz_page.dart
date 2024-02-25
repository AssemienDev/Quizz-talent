import 'dart:async';
import 'dart:math';
import 'package:quiztalent/question.dart';
import 'package:quiztalent/datas.dart';
import 'package:flutter/material.dart';
import 'package:quiztalent/text_with_style.dart';
import 'home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';





class FacileQuizzPage extends StatefulWidget {


  @override
  FacileQuizzPageState createState() => FacileQuizzPageState();
}

class FacileQuizzPageState extends State<FacileQuizzPage> with SingleTickerProviderStateMixin{

  String? volume;
  int? ancScore;

  late final AnimationController _controller;
  late Animation<double> _textAnimation;
  late Animation<double> _imageAnimation;
  late Animation<double> _buttonAnimation;

  late SharedPreferences preferences;

  Future init() async {
    preferences = await SharedPreferences.getInstance();
    String? volume = preferences.getString('volume');
    int? ancScore = preferences.getInt('facile');

    setState(() {
      this.volume = volume;
      this.ancScore = ancScore;
    });

  }

  final player = AudioPlayer();

  Future<void> playAudioFromAsset(String link) async{
    await player.play(AssetSource(link));
  }


  List<int> usedQuestionIndices = [];
  static const maxSeconds = 20;
  int seconds = maxSeconds;
  List<Question> questions = DatasFacile().listeQuestions;
  int index = 0;
  int score = 0;
  Timer? timer;
  int i=0;

  bool bool1 = true;
  bool bool2 = true;
  bool bool3 = true;
  bool bool4 = true;
  bool bool5 = true;
  int etat=0;

  @override
  void initState() {
    super.initState();
    startTimer();
    init();

    // Initialiser le contrôleur d'animation
    _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 1000), // Durée de l'animation en millisecondes
    );


    _textAnimation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
    parent: _controller,
    curve: Interval(0.0, 1, curve: Curves.fastOutSlowIn), // Modifier la courbe au besoin
    ),
    );


    _imageAnimation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
    parent: _controller,
    curve: Interval(0.5, 0.75, curve: Curves.easeInOut),
    ),
    );


    _buttonAnimation = Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
    parent: _controller,
    curve: Interval(0.75, 1.0, curve: Curves.easeInOut),
    ),
    );

    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();

  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if(seconds <= 0){
          player.stop();
          toNextQuestion();
        }else{
          seconds--;
          if(this.volume == "activer"){
            playAudioFromAsset("Facile.mp3");
          }

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Question question = questions[index];
    return Scaffold(
        appBar: AppBar(
          title: Text("Score: $score ", style: TextStyle(color: Colors.white),),
          backgroundColor: const Color.fromRGBO(46, 66, 90, 1),
        ),
        body: Container(
          color: const Color.fromRGBO(36,42,64, 1),
          child: Center(
            child: Card(
                color: const Color.fromRGBO(46, 66, 90, 1),
                margin: EdgeInsets.all(8),
                child: Padding(padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildTime(),
                      Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon((bool1) ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                            Icon((bool2) ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                            Icon((bool3) ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                            Icon((bool4) ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                            Icon((bool5) ? Icons.favorite : Icons.favorite_border, color: Colors.red,),
                          ],
                        ),
                      ),
                      TextWithStyle(data: "Question numéro: ${i+1} / ${questions.length}", style: FontStyle.italic, color: Colors.deepOrange, size: 22,),
                      AnimatedBuilder(
                        animation: _textAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _textAnimation.value,
                            child: TextWithStyle(data: question.question, size: 19, weight: FontWeight.bold, color: Colors.white,),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _imageAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _imageAnimation.value,
                            child: Image.asset("images/17973872.png",),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AnimatedBuilder(
                            animation: _buttonAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _buttonAnimation.value,
                                child: answerButton(false),
                              );
                            },
                          ),
                          AnimatedBuilder(
                            animation: _buttonAnimation,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _buttonAnimation.value,
                                child: answerButton(true),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ),
        )
    );
  }

  Widget buildTime(){
    return TextWithStyle(
      data: "$seconds", size: 40, weight: FontWeight.bold, color: Colors.white,
    );
  }

  ElevatedButton answerButton(bool b){
    return ElevatedButton(
        onPressed: (){
          timer?.cancel();
          checkAnswers(b);
        },
        child: Text((b)?"VRAI":"FAUX", style: TextStyle(color: Colors.white),), style: ElevatedButton.styleFrom(
      backgroundColor: (b)?Colors.greenAccent: Colors.redAccent,
    )
    );
  }

  checkAnswers(bool answer){
    final question = questions[index];
    bool bonneReponse = (question.reponse == answer);

    if(bonneReponse){
      setState(() {
        score++;
      });
      if(volume == "activer"){
        playAudioFromAsset((bonneReponse) ? "correct-2-46134.mp3" : "negative_beeps-6008.mp3");
      }
      showAnswer(bonneReponse);
    }else{
      etat++;
      if(etat == 1){
        setState(() {

          bool1 = false;
        });
        if(volume == "activer"){
          playAudioFromAsset((bonneReponse) ? "correct-2-46134.mp3" : "negative_beeps-6008.mp3");
        }
        showAnswer(bonneReponse);
      }else if( etat == 2){
        setState(() {
          bool1 = false;
          bool2 = false;
        });
        if(volume == "activer"){
          playAudioFromAsset((bonneReponse) ? "correct-2-46134.mp3" : "negative_beeps-6008.mp3");
        }
        showAnswer(bonneReponse);
      }else if( etat == 3){
        setState(() {
          bool1 = false;
          bool2 = false;
          bool3 = false;
        });
        if(volume == "activer"){
          playAudioFromAsset((bonneReponse) ? "correct-2-46134.mp3" : "negative_beeps-6008.mp3");
        }
        showAnswer(bonneReponse);
      }else if( etat == 4){
        setState(() {
          bool1 = false;
          bool2 = false;
          bool3 = false;
          bool4 = false;
        });
        if(volume == "activer"){
          playAudioFromAsset((bonneReponse) ? "correct-2-46134.mp3" : "negative_beeps-6008.mp3");
        }
        showAnswer(bonneReponse);
      }else if( etat == 5){
        setState(() {
          bool1 = false;
          bool2 = false;
          bool3 = false;
          bool4 = false;
          bool5 = false;
        });
        player.stop();
        showResult();
      }
    }


  }

  Future<void> showAnswer(bool bonne) async{
    Question question = questions[index];
    String title = (bonne) ? "C'est gagné !" : "Raté !";
    Color color = (bonne) ? Colors.green : Colors.red;
    String imageToShow = (bonne) ? "vrai.png" : "faux.png";
    String path = "images/$imageToShow";
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext contex){
          return SimpleDialog(
            backgroundColor: Colors.white,
            title: Center(
              child: TextWithStyle(data: title,weight: FontWeight.bold, size: 20, color: color,),
            ),
            children: [
              Image.asset(path),
              Center(
                child: TextWithStyle(data: (bonne)? " " : question.explication, size: 18,),
              ),
              TextButton(onPressed: (){
                Navigator.of(context).pop();
                if(this.volume == "activer") {
                  playAudioFromAsset("select-sound-121244.mp3");
                }
                startTimer();
                toNextQuestion();
              }, child: TextWithStyle(data: "Question suivante", color: Colors.deepOrange,))
            ],
          );
        });
  }

  Future<void> showResult() async{

    Globals.facile = score;

    if(ancScore != null){
      if(ancScore! < score){
        preferences.setInt('facile', score);
      }
    }else{
      preferences.setInt('facile', score);
    }

    double scorePercent = (score*100)/questions.length;
    timer?.cancel();

    return await showDialog(barrierDismissible: false, context: context, builder: (BuildContext ctx){
      return AlertDialog(
        title: TextWithStyle(data: "C'est fini !", weight: FontWeight.bold,),
        content: Container(
          height: 500,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset((scorePercent>=50) ? "images/success.png" : "images/fail.png", width:MediaQuery.of(context).size.width/1.5
              ),
              Center(
                child: TextWithStyle(data:"Félicitation!", weight: FontWeight.bold, size: 25),
              ),
              Center(
                child: TextWithStyle(data: "$scorePercent% Score", size: 30, color: (scorePercent>=50) ? Colors.green : Colors.red ),
              ),
              Center(
                child: TextWithStyle(data: "Quiz terminé avec succès", weight: FontWeight.bold,size: 20,),
              ),
              TextWithStyle(data: "Vous avez répondu à ${questions.length} questions et il y a $score de correct(s) ",),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(ctx).pop();
            Navigator.of(context).pop();
            if(this.volume == "activer") {
              playAudioFromAsset("select-sound-121244.mp3");
            }
          }, child: TextWithStyle(data: "OK", color: Colors.deepOrange,))
        ],
      );
    });
  }


  void toNextQuestion() {
    if (usedQuestionIndices.length < questions.length - 1) {
      int randomIndex;
      do {
        randomIndex = Random().nextInt(questions.length);
      } while (usedQuestionIndices.contains(randomIndex));

      usedQuestionIndices.add(randomIndex);

      index = randomIndex;
      i++;

      seconds = maxSeconds;

      // Déclencher les animations
      _controller.reset();
      _controller.forward();

      setState(() {});
    } else {
      usedQuestionIndices.clear(); // Réinitialiser la liste des questions utilisées
      player.stop();
      showResult();
    }
  }



}

