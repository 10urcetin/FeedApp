import 'package:feedapp/pages/flood_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  
  TextEditingController tweetController = TextEditingController();

 void createTweet(String tweetContent) {
  FirebaseFirestore.instance.collection('tweets').add({
    'avatar': 'assets/images/pp.jpeg',
    'username': 'Your Name',
    'handle': '@yourhandle',
    'tweetContent': tweetContent,
    'likeCount': 0,
    'date': DateTime.now(),
  }).then((value) {
    // Tweet başarıyla kaydedildiğinde işlem tamamlandı.
    // FloodPage'e yönlendirme yapabilirsiniz.
    Navigator.of(context).pop(); // Create sayfasını kapat
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => FloodPage()),
    );
  }).catchError((error) {
    // Hata durumunda kullanıcıya bir hata mesajı gösterilebilir.
    // Hata işleme için uygun bir strateji belirleyebilirsiniz.
    print('Tweet oluşturulamadı: $error');
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Tweet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: tweetController,
              decoration: InputDecoration(
                hintText: 'Enter your ideas...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String tweetContent = tweetController.text;
                if (tweetContent.isNotEmpty) {
                  createTweet(tweetContent);
                } else {
                  // Kullanıcıdan bir tweet içeriği girmesi gerektiğini bildirin
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Enter tweets...'),
                    ),
                  );
                }
              },
              child: Text('Create tweet'),
            ),
          ],
        ),
      ),
    );
  }
}