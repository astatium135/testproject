import 'package:flutter/material.dart';
import 'package:testproject/controllers/demo_controller.dart';
import 'package:testproject/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late DemoController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация')
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Имя пользователя'
              ),
              validator: (String? value){
                if(value==null||value.isEmpty){
                  return "поле не может быть пустым";
                }
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'пароль',
              ),
              obscureText: true,
              validator: (String? value){
                if(value==null||value.isEmpty){
                  return "поле не может быть пустым";
                }
              },
            ),
            Builder(
              builder: (context) => ElevatedButton(
                child: Text('Авторизироваться'),
                onPressed: () async {
                  _auth(context);
                }
              ),
            ),
          ])
        )
      ),
    );
  }
  void _auth (BuildContext context) async{
    final form = formKey.currentState;
    if(!form!.validate()){
      return;
    }
    final name = nameController.text;
    final password = passwordController.text;

    var user = await controller.auth(name:name, password:password);
    if(user!=null){
      Navigator.of(context).pop();
    } else {
      passwordController.clear();
      showBottomSheet(context: context, builder: (_)=>SafeArea(child: Container(child: Text("Вы ввели неправильную пару логин-пароль"))));
    }
  }
}
