import 'package:feedapp/pages/comment_dialog.dart';
import 'package:feedapp/pages/create_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Tweet {
  final String avatar;
  final String username;
  final String handle;
  final String tweet;
  int likeCount;
  final DateTime date;
  bool isLiked; // Beğenilip beğenilmediği
  List<Comment> comments; // Yorumlar


  

  
    Tweet({
    required this.avatar,
    required this.username,
    required this.handle,
    required this.tweet,
    required this.likeCount,
    required this.date,
    this.isLiked = false,
    List<Comment>? comments, // Varsayılan değer kaldırıldı
  }) : comments = comments ?? []; // comments null ise boş liste ile başlat
}


class Comment {
  final String username;
  final String text;

  Comment({
    required this.username,
    required this.text,
  });
}



class FloodPage extends StatefulWidget {
  @override
  State<FloodPage> createState() => _FloodPage();
}

class _FloodPage extends State<FloodPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

 List<Tweet> tweets = [
   Tweet(
    avatar: 'assets/images/pp.jpeg',
    username: 'Onur Çetin',
    handle: '@o',
    tweet: 'Hi Milu',
    likeCount: 20,
    date: DateTime(2023, 9, 20),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'John Doe',
    handle: '@johndoe',
    tweet: 'This is a great day! #Flutter',
    likeCount: 20,
    date: DateTime(2023, 9, 28),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Alice Smith',
    handle: '@alicesmith',
    tweet: 'Just finished my Flutter project! Feeling accomplished. 😊',
    likeCount: 15,
    date: DateTime(2023, 9, 27),
  ),
  
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'David Johnson',
    handle: '@davidjohnson',
    tweet: 'Loving the Flutter framework! #MobileDev',
    likeCount: 30,
    date: DateTime(2023, 9, 26),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Sarah Brown',
    handle: '@sarahbrown',
    tweet: 'Excited to learn more about Flutter animations. 🚀',
    likeCount: 25,
    date: DateTime(2023, 9, 25),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Michael Clark',
    handle: '@michaelclark',
    tweet: 'Just attended a great Flutter workshop. So much to explore!',
    likeCount: 18,
    date: DateTime(2023, 9, 24),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Emily Davis',
    handle: '@emilydavis',
    tweet: 'Coffee and coding – my perfect combination! ☕💻',
    likeCount: 22,
    date: DateTime(2023, 9, 23),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Daniel Wilson',
    handle: '@danielwilson',
    tweet: 'Working on a cool Flutter project. Can\'t wait to share!',
    likeCount: 28,
    date: DateTime(2023, 9, 22),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Olivia Turner',
    handle: '@oliviaturner',
    tweet: 'Flutter is revolutionizing mobile app development. 🌟',
    likeCount: 21,
    date: DateTime(2023, 9, 21),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Matthew Harris',
    handle: '@matthewharris',
    tweet: 'Learning Flutter step by step. It\'s exciting!',
    likeCount: 19,
    date: DateTime(2023, 9, 20),
  ),
  Tweet(
    avatar: 'assets/images/60111.jpeg',
    username: 'Sophia Lee',
    handle: '@sophialee',
    tweet: 'Had a productive day coding with Flutter. Feeling accomplished! 😊',
    likeCount: 24,
    date: DateTime(2023, 9, 19),
  ),
];
  
  // Function to add a new tweet to Firestore
Future<Tweet?> addNewTweet(Tweet newTweet) async {
  try {
    // Add the new tweet to Firestore
    await FirebaseFirestore.instance.collection('tweets').add({
      'avatar': newTweet.avatar,
      'username': newTweet.username,
      'handle': newTweet.handle,
      'tweet': newTweet.tweet,
      'likeCount': newTweet.likeCount,
      'date': newTweet.date,
    });

    // Return the new tweet
    return newTweet;
  } catch (e) {
    // Handle any errors that occur during Firestore write
    print('Error adding tweet: $e');
    return null;
  }
}
Future<List<Tweet>> getTweets() async {
  try {
    QuerySnapshot querySnapshot = await _firestore.collection('tweets').get();

    List<Tweet> tweets = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      return Tweet(
        avatar: data['avatar'],
        username: data['username'],
        handle: data['handle'],
        tweet: data['tweet'],
        likeCount: data['likeCount'],
        date: (data['date'] as Timestamp).toDate(),
      );
    }).toList();

    return tweets;
  } catch (e) {
    // Handle any errors that occur during data retrieval
    print('Error fetching tweets: $e');
    return [];
  }
}
  // Beğeni işlemini gerçekleştirmek için işlev
  void toggleLike(int index) {
    setState(() {
      if (tweets[index].isLiked) {
        tweets[index].likeCount--;
        tweets[index].isLiked = false;
      } else {
        tweets[index].likeCount++;
        tweets[index].isLiked = true;
      }
    });
  }
  // Yorum eklemek için bir işlev ekleyin
void addComment(int index, Comment comment) {
  setState(() {
    tweets[index].comments.addAll([comment]);
  });
}

@override
Widget build(BuildContext context) {
  // Tweetleri tarihe göre sırala
  tweets.sort((a, b) => a.date.compareTo(b.date));

          return Scaffold(
  appBar: AppBar(
    title: Text('Flow'),
  ),
  body: ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: tweets.length,
    itemBuilder: (context, index) {
      return Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey, // Sınırların rengi
      width: 1.0,          // Sınırların kalınlığı
    ),
    borderRadius: BorderRadius.all(Radius.circular(8.0)), // Köşeleri yuvarlama
  ),
  margin: EdgeInsets.all(8.0), // Tweet aralarında boşluk bırak
  padding: EdgeInsets.all(8.0), // Tweet içeriğine iç boşluk bırak
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(tweets[index].avatar),
          ),
          SizedBox(width: 8.0), // CircleAvatar ile username arasında boşluk ekler
          Text(
            '${tweets[index].username} ${tweets[index].handle}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.0),
            Text(tweets[index].tweet),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: tweets[index].isLiked
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    // Beğeni butonuna basıldığında beğeni işlemini gerçekleştir
                    toggleLike(index);
                  },
                ),
                SizedBox(width: 4.0),
                Text('${tweets[index].likeCount} likes'),
                SizedBox(width: 16.0),
                Text(
                  '${tweets[index].date.day}/${tweets[index].date.month}/${tweets[index].date.year}',
                ),
              ],
            ),
            SizedBox(height: 8.0),
            // Yorumları göster
            if (tweets[index].comments.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  for (final comment in tweets[index].comments)
                    Text(
                      '${comment.username}: ${comment?.text}',
                      style: TextStyle(color: Colors.grey),
                    ),
                ],
              ),
                  // Yorum eklemek için bir düğme ekleyin
                  ElevatedButton(
                    onPressed: () async {
                      final Comment? newComment = await showDialog<Comment>(
                        context: context,
                        builder: (context) => CommentDialog(),
                      );
                      if (newComment != null) {
                        // Yorum eklemek için işlevi çağırın
                        addComment(index, newComment);
                      }
                    },
                    child: Text('Add Comment'),
                  ),
                ],
              ),
            ),
    ],
  ),
      );
    },
  ),
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        // Navigate to the CreatePage to create a new tweet
        final newTweet = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatePage()),
        );

        if (newTweet != null) {
          // Add the new tweet to Firestore and the tweets list
          final addedTweet = await addNewTweet(newTweet);
          if (addedTweet != null) {
            setState(() {
              tweets.insert(0, addedTweet); // Yeni tweeti en üstte görmek için ekler
            });
          }
        }
      },
      child: Icon(Icons.add),
    ),
  );
}  
}

