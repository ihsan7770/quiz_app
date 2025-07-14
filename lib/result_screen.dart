import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summery.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,
  required this.chosenAnswers,
  required this.onRestart,
  
  });


  final void Function() onRestart;
  final List<String>chosenAnswers;

 List <Map<String,Object>> getSummeryData(){
  final List <Map<String,Object>> summary = [];

for (var i =0;i<chosenAnswers.length; i++){
summary.add({
'question_index':i,
'question':questions[i].text,
'correct_answer':questions[i].answers[0],
'user_answer':chosenAnswers[i]

},);

}

  return summary;

 }

  @override
  Widget build(BuildContext context) {

    
    final summaryData= getSummeryData();
    final numTotalQustions = questions.length;
    final numCorrectQustions = summaryData.where((data){
      return data['user_answer']== data['correct_answer'];
    }).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "You answered $numCorrectQustions out of $numTotalQustions questions correctly"
            ,style: GoogleFonts.lato(fontSize: 16,
             fontWeight: FontWeight.bold,
             color: Colors.white),
            ),

            const SizedBox(
              height: 30,
            ),

            QuestionsSummery(summaryData),
             const SizedBox(
              height: 30,
            ),
           

            TextButton.icon(
  onPressed:onRestart,
  icon: Icon(Icons.arrow_back,color: Colors.white,), // Back/return icon
  label: Text('Restart Quiz!',style: GoogleFonts.lato(fontSize: 16,
             fontWeight: FontWeight.bold,
             color: Colors.white),),
)
        
        
        ],),
      ),
    );
  }
}