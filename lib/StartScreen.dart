import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz,{super.key});
  
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return  Center(child:Column(
      mainAxisSize: MainAxisSize.min,
      
      children: [
      Image.asset("assets/quiz-logo.png",
      width: 300,
      color: Color.fromARGB(150, 255, 255, 255)
      ),
      
      const SizedBox(height: 80,),
      const Text('Learn Flutter the fun way!',
      style: TextStyle(color: Color.fromARGB(255, 248, 247, 242),
      fontSize: 24,
      ) ),
      const SizedBox(height: 30,),
      OutlinedButton.icon(onPressed:startQuiz,//as a variable
      
        //logic
            style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        
      ), icon: Icon(Icons.arrow_right_alt),
       label:  const Text('Start Quiz'),
    
      
      
      )
      
      


    
    
    
    ],));
  }
}