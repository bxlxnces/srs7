import 'package:flutter/material.dart';

class Words {
  String title;

  Words(this.title);
}

class Insta extends StatelessWidget {
  final List<Words> listWords = [
    Words('Привет'),
    Words('Hello'),
    Words('Bye'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            for (var news in listWords)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: WordsCard(news: news),
              ),
          ],
        ),
      ),
    );
  }
}

class WordsCard extends StatefulWidget {
  final Words news;

  const WordsCard({Key? key, required this.news}) : super(key: key);

  @override
  _WordsCardState createState() => _WordsCardState();
}

class _WordsCardState extends State<WordsCard> {
  int likes = 0;
  int dislikes = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.news.title),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: isLiked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  if (isLiked) {
                    likes--;
                  } else {
                    likes++;
                  }
                  isLiked = !isLiked;
                });
              },
            ),
            Text('$likes'),
            IconButton(
              icon: Icon(Icons.thumb_down),
              onPressed: () {
                setState(() {
                  dislikes++;
                });
              },
            ),
            Text('$dislikes'),
          ],
        ),
      ],
    );
  }
}
