import 'package:flutter/material.dart';
import 'package:quiz_app/qustion_identifer.dart';

class Summeryitem extends StatelessWidget {
  const Summeryitem(this.itemData,{super.key});

  final Map<String,Object>itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer=itemData['user_answer']== itemData['correct_answer'];
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifer(isCorrectAnswer: isCorrectAnswer, 
        questionIndex: itemData['question_index'] as int),

        const SizedBox(width: 20,),
        Expanded(child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [
          Text(
            itemData['question'] as String,

            style: TextStyle(fontSize: 15,color: Colors.white),
          
          
          ),
          const SizedBox(height: 5,),

          Text(itemData['user_answer']as String,
          style: TextStyle(color: Colors.red[200]),
          ),
          Text(itemData['correct_answer']as String,
          style: TextStyle(color: Colors.green[200]),
          ),

          
          
          
          ],
        ))



      ],


    );
  }
}