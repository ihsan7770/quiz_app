import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answerbutton.dart';
import 'package:quiz_app/data/questions.dart';

class QustionScreen extends StatefulWidget {
  const QustionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QustionScreen> createState() => _QustionScreenState();
}

class _QustionScreenState extends State<QustionScreen> {

var currentQuestionIndex = 0;

void answerQustions(String selectedAnswer){

setState(() {
  widget.onSelectAnswer(selectedAnswer);
 

   currentQuestionIndex ++;
});

}
  
   @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return  Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [

       Text( 
        textAlign: TextAlign.center,
        
        currentQuestion.text,
        
        style: GoogleFonts.lato(
          color:const Color.fromARGB(255, 201, 153, 251),
          fontSize:24,
          fontWeight:FontWeight.bold,

        )                   ),


      const SizedBox(height: 30,),
     
     
      ...currentQuestion.getShuffledAnswers().map((answer){
        return AnswerButton(answerText:answer,onTap:() {
          answerQustions(answer);
        },);
      })
      
      
      
         
      
        
      
      ],),
    );
  }
}

