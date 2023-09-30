import 'package:flutter/material.dart';

class TrendTopicPage extends StatelessWidget {
  final List<String> trendingTopics = [
    "#Milu",
    "#Flutter",
    "#DartProgramming",
    "#MobileAppDevelopment",
    "#OpenAI",
    "#TrendingTopics",
    "#TwitterClone",
    // Daha fazla trend konusu ekleyebilirsiniz.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Topics'),
      ),
      body: ListView.builder(
        itemCount: trendingTopics.length,
        itemBuilder: (context, index) {
          final topic = trendingTopics[index];
          return ListTile(
            leading: Icon(Icons.trending_up),
            title: Text(topic),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Trend konusu tıklandığında yapılacak işlemleri burada tanımlayabilirsiniz.
            },
          );
        },
      ),
    );
  }
}
