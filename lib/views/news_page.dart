import 'package:flutter/material.dart';
import 'package:testproject/controllers/demo_controller.dart';
import 'package:testproject/models/news.dart';
import 'package:testproject/provider.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late DemoController controller;
  @override
  Widget build(BuildContext context) {
    controller = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Новости")
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: FutureBuilder(
          future: controller.getNews(),
          builder: (BuildContext context, AsyncSnapshot<List<News>?> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data!=null){
                final news = snapshot.data!;
                return buildListView(news);
              } else return Center(child: Text("Новости недоступны"));
            } else return Center(child: CircularProgressIndicator());
          },
        ),
      )
    );
  }

  Widget buildListView(List<News> news) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index){
        return Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
            Text(
              news[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              Text(
                news[index].author,
                style: Theme.of(context).textTheme.subtitle1
              ),
              if(news[index].dateTime != null)
                Text("${news[index].dateTime!.year}."
                    "${news[index].dateTime!.month}."
                    "${news[index].dateTime!.day} "
                    "${news[index].dateTime!.hour}:"
                    "${news[index].dateTime!.minute}:"
                    "${news[index].dateTime!.second}",
                style: Theme.of(context).textTheme.subtitle2
              ),
            ]),
            SizedBox(height: 10),
            Text(news[index].description.trim(), style: Theme.of(context).textTheme.bodyText2,),
            SizedBox(height: 10),
          ])
        );
       },
    );
  }
}
