import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_test2/model/model_quiz.dart';
import 'package:quiz_app_test2/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({ 'title':'안녕하신가', 'candidates':['a','b','c','d'], 'answer':0 } ),
    Quiz.fromMap({ 'title':'크랄라', 'candidates':['a','b','c','d'], 'answer':0 } ),
    Quiz.fromMap({ 'title':'test', 'candidates':['a','b','c','d'], 'answer':0 } ),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    print("width: " + width.toString() + " / height: " + height.toString());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child:Text('마이 퀴즈 앱')
          ),
          backgroundColor: Colors.deepPurple,
          leading: null,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                  'images/quiz.jpeg',
                  width: width * 0.5,
              )
            ),
            Text(
              '플러터 퀴즈 앱',
              style:TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              '퀴즈를 풀기 전 안내사항입니다.\n꼼꼼히 읽고 퀴즈 풀기를 눌러주세요.',
              textAlign: TextAlign.center,
            ),
            _buildStep(width,'1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width,'2. 문제를 잘 읽고 정답을 고른 뒤\n다음 문제를 눌러주세요.'),
            _buildStep(width,'3. 만점을 향해 도전해보세요!'),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child:Center(
                child: ButtonTheme(
                  minWidth: width*0.8,
                  height: height * 0.08,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child:RaisedButton(
                      child: Text(
                          '지금 퀴즈 풀기',
                        style: TextStyle(color: Colors.white)
                      ),
                      color:Colors.deepPurple,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              quizs: quizs
                            )
                          )
                        );
                      },
                    )
                ),
              )
            ),
          ],
        ),
      ),

    );
  }
  Widget _buildStep(double width, String title){
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.all(width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}

