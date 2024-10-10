import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/custom_button.dart';
import 'package:flutter_application_2/components/custom_input.dart';
import 'package:flutter_application_2/components/social_auth.dart';
import 'package:flutter_application_2/views/register_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 180,),
            CustomInput(labelText: 'Email',),
            CustomInput(labelText: 'Senha', obscure: true,),
            CustomButton(
              titleButton: 'Entrar',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ainda não tem uma conta?'),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=> RegisterPage(),
                        )
                      );
                    },
                    child: Text('Cadastre-se')
                    )
                ],
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/174/174855.png',),
                  SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/3128/3128304.png',),
                  SocialAuth(image: 'https://cdn-icons-png.flaticon.com/128/300/300221.png',),
                ],
              )
              

          ],
        ),
      ),
    );
  }
}