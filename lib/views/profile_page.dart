import 'package:flutter/material.dart';
import 'package:testproject/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of(context);
    if(controller.user == null){
      Navigator.of(context).pop();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль")
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                width: 200,
                height: 200,
                child: ClipOval(
                  child: Image.asset(controller.user!.image)
                ),
              ),
              Text(
                controller.user!.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Text(controller.user!.description),
              Spacer(),
            ],
          ),
        )
      )
    );
  }
}
