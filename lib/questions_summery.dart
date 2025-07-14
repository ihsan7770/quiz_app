import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/summery_item.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summaryData,{super.key});

  
  
  final List<Map<String,Object>>summaryData;
  
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Summeryitem(data);
          },).toList()
        ),
      ),


    );
  }
}