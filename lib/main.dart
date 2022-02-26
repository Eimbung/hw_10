import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'instaa.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaMaPet',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<Insta> InstaList = [
    Insta(imguser: 'android/assets/images/20220215_213627.jpg', img: 'android/assets/images/Screenshot 2022-02-26 170302.png',
        userpost: 'Im_Eimmmm', comments: [Comments(user: 'A_Aum', comment: "😍😍😍🥰🥰🥰❤"),Comments(user: 'E_eimbung', comment: 'Aww❤ He so cute🥰')],
        caption: "How cute!!!!!!!🥰 \n #Chockchock"),
    Insta(imguser: 'android/assets/images/1644214700806.jpg', img: 'android/assets/images/1644214700806.jpg',
        userpost: 'Gimari',comments: [Comments(user: 'Im_Eimmmm', comment: 'His hair look so soft💙😇🥺🥺🥺'),Comments(user: 'Lit_Co', comment: 'cute!👍👍👍')],
        caption: 'ค.นัลลัคของโชคๆ💙😇🥺  \n#นัลลลลรัคคึ ใจเจบ \n#จายยยฉ้านนนน \n #Chockchock'),
    Insta(imguser: 'android/assets/images/th.jfif', img: 'assets/images/6667437.jpg',
        userpost: 'HOhohho',comments: [Comments(user: 'Gobli', comment: 'อ๊ากกกกก🔥🔥🔥'),Comments(user: 'Ninaca', comment: 'wanna cry🥲')],
        caption: 'Thats hurt😂 🤣 🥲\n#meme'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F1DBC4),
      appBar: AppBar(title: Text('InstaMaPet',
          style: TextStyle(fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,))),
      body: ListView.builder(
          itemCount: InstaList.length,
          itemBuilder: (context, index) =>
              MyCard(insta: InstaList[index])),

    );
  }
}
class MyCard extends StatefulWidget {
  final Insta insta;

  const MyCard({
    Key? key,
    required this.insta,
  }) : super(key: key);

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  final controller = TextEditingController();
  var like = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text(covid.date),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('${widget.insta.imguser}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                    child: Text(
                        '${widget.insta.userpost}'
                    )
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert),)
              ],
            ),
          ),
          Image.asset('${widget.insta.img}',fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                /*SizedBox(width: 5.0),*/
                Expanded(
                    child: Text(
                        '${widget.insta.caption}'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0,left: 16.0,right: 16.0),
            child: Column(
              children: [
                for(int i=0;i<widget.insta.comments.length;i++)
                  Row(
                    children: [
                      SizedBox(height: 23.0,),
                      Text(
                        '${widget.insta.comments[i].user}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                          fontSize: 15.0,
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text(
                        '${widget.insta.comments[i].comment}',
                        style: TextStyle(

                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),


          Row(
            children: [
              IconButton(onPressed: (){
                setState(() {
                  like = !like;
                });
              }, icon: like? Icon(Icons.favorite,color: Colors.pink,): Icon(Icons.favorite_border),),
              Expanded(
                child: TextField(
                  onSubmitted: (value){

                    setState(() {
                      widget.insta.comments.add(Comments(user: 'Flutter', comment: value));
                      controller.clear();

                    });
                  },
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ],
          )


        ],
      ),
    );
  }
}