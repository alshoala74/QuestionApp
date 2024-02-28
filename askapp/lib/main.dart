import 'package:flutter/material.dart';
import 'appbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(AskApp());
}

class AskApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar:AppBar(
          title: const Text('Exam'),
          backgroundColor: Colors.grey,
          ) ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Exampage(),
      ),
      
      
      ),
    );
  }
}



class Exampage extends StatefulWidget {
  @override
  State<Exampage> createState() => _ExampageState();
}

class _ExampageState extends State<Exampage> {
  
  List<Widget> result=[];
  int rightAnswer=0;
  Appbrain appBrain=Appbrain();
 
  void checkAnswer(bool userPicked){
          bool correctanswer =appBrain.getQuestionAnswer();
          setState((){
            if (correctanswer ==userPicked){
              rightAnswer++;
              result.add(        
              const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(Icons.thumb_up,color: Colors.green,),
              ),
              );
            }else{
              result.add(        
              const Padding(
              padding: EdgeInsets.all(3.0),
              child: Icon(Icons.thumb_down,color: Colors.red,),
              ),
              );
            }
            if(appBrain.isFinshed()==true){
            Alert(
                  context: context,
                  title: "Done!",
                  desc: "You got $rightAnswer out of 7",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Restart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
                appBrain.reset();
                result=[];
                rightAnswer=0;
            }else{
              appBrain.nextQuestion();
            }
             });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(
          children:result,
          ),

        //The Image And Text
        Expanded
        (flex: 5,
          child: Column
        (children: [
          Image.asset(appBrain.getQuestionImage()),
          const SizedBox(height: 20,),
          Text(appBrain.getQuestionText(),textAlign: TextAlign.center,style: const TextStyle(fontSize: 24,),),
        ],),),

        //The Button
        Expanded(child: 
        Padding(
          padding:const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(child:
          const Text('Correct',style: TextStyle(color: Colors.green,fontSize: 20,),),
         
          onPressed:(){
            checkAnswer(true);
          },

          ),
        ),),

        //The Button
        Expanded(child: 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ElevatedButton(child:
          const Text('Wrong',style: TextStyle(color: Colors.red,fontSize: 20,),),
            onPressed:(){
              checkAnswer(false);
          },

          ),
        ),),
      
      ],


    );
  }
}