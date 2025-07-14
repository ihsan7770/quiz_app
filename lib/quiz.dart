import 'package:flutter/material.dart';
import 'package:quiz_app/QustionScreen.dart';
import 'package:quiz_app/StartScreen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';



class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {


List<String> selectedAnswers = [];
var activeScreen='start-screen';


void switchScreen(){
 setState(() {
    activeScreen='questions-screen';
    });
}
  
  void ChooseAnswer(String answer){
   selectedAnswers.add(answer);

   if(selectedAnswers.length==questions.length){

    setState(() {
    
      activeScreen = 'result-screen';

    });

   }



  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }




  @override
  Widget build(BuildContext context) {
    Widget screenWidget= StartScreen(switchScreen);
    if (activeScreen=='questions-screen'){
      screenWidget= QustionScreen(onSelectAnswer: ChooseAnswer,);
    }

if(activeScreen =="result-screen"){
  screenWidget =  ResultScreen(chosenAnswers: selectedAnswers,onRestart:restartQuiz,);
}

     
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 78, 13, 151),
            Color.fromARGB(255, 107, 15, 168)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          
          
          )


        ),
        
        child: screenWidget

        ))
      
      
      );
  }
}