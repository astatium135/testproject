import 'package:flutter/material.dart';
import 'package:testproject/provider.dart';
import 'package:testproject/views/login_page.dart';
import 'package:testproject/views/news_page.dart';
import 'package:testproject/views/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Главный экран'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              if(controller.user!=null) IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_)=>ProfilePage()
                  )
                ),
              ),
              if(controller.user!=null) IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => controller.logout().then(
                  (_) => setState((){}),
                ),
              )
              else IconButton(
                icon: Icon(Icons.input),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_)=>LoginPage()
                  )
                ).then((_) => setState((){})),
              ),
              IconButton(
                icon: Icon(Icons.description_outlined),
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_)=>NewsPage()
                    )
                ),
              ),
            ])
          ),
        ]
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Spacer(),
            Text(
              'Демонстратор FLutter',
              style: Theme.of(context).textTheme.headline6
            ),
            Text('Вы находитесь на главном экране приложения. Для перехода '
                'на другие экраны воспользуйтесь кнопками на верхней панели.'
            ),
            Spacer(),
          ]
        ),
      ),
    );
  }
}
