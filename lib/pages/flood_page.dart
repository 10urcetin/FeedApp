import 'package:flutter/material.dart';

class Tweet {
  final String avatar;
  final String username;
  final String handle;
  final String tweetContent;
  final int likeCount;
  final DateTime date;

  Tweet({
    required this.avatar,
    required this.username,
    required this.handle,
    required this.tweetContent,
    required this.likeCount,
    required this.date,
  });
}

class FloodPage extends StatefulWidget {
  @override
  State<FloodPage> createState() => _FloodPage();
}

class _FloodPage extends State<FloodPage> {

 final List<Tweet> tweets = [
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'John Doe',
    handle: '@johndoe',
    tweetContent: 'This is a great day! #Flutter',
    likeCount: 20,
    date: DateTime(2023, 9, 28),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Alice Smith',
    handle: '@alicesmith',
    tweetContent: 'Just finished my Flutter project! Feeling accomplished. 😊',
    likeCount: 15,
    date: DateTime(2023, 9, 27),
  ),
  
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'David Johnson',
    handle: '@davidjohnson',
    tweetContent: 'Loving the Flutter framework! #MobileDev',
    likeCount: 30,
    date: DateTime(2023, 9, 26),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Sarah Brown',
    handle: '@sarahbrown',
    tweetContent: 'Excited to learn more about Flutter animations. 🚀',
    likeCount: 25,
    date: DateTime(2023, 9, 25),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Michael Clark',
    handle: '@michaelclark',
    tweetContent: 'Just attended a great Flutter workshop. So much to explore!',
    likeCount: 18,
    date: DateTime(2023, 9, 24),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Emily Davis',
    handle: '@emilydavis',
    tweetContent: 'Coffee and coding – my perfect combination! ☕💻',
    likeCount: 22,
    date: DateTime(2023, 9, 23),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Daniel Wilson',
    handle: '@danielwilson',
    tweetContent: 'Working on a cool Flutter project. Can\'t wait to share!',
    likeCount: 28,
    date: DateTime(2023, 9, 22),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Olivia Turner',
    handle: '@oliviaturner',
    tweetContent: 'Flutter is revolutionizing mobile app development. 🌟',
    likeCount: 21,
    date: DateTime(2023, 9, 21),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Matthew Harris',
    handle: '@matthewharris',
    tweetContent: 'Learning Flutter step by step. It\'s exciting!',
    likeCount: 19,
    date: DateTime(2023, 9, 20),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Sophia Lee',
    handle: '@sophialee',
    tweetContent: 'Had a productive day coding with Flutter. Feeling accomplished! 😊',
    likeCount: 24,
    date: DateTime(2023, 9, 19),
  ),
];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(tweets[index].avatar),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${tweets[index].username} ${tweets[index].handle}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(tweets[index].tweetContent),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(Icons.favorite_border),
                    SizedBox(width: 4.0),
                    Text('${tweets[index].likeCount} likes'),
                    SizedBox(width: 16.0),
                    Text(
                      '${tweets[index].date.day}/${tweets[index].date.month}/${tweets[index].date.year}',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      
    );
  }
}