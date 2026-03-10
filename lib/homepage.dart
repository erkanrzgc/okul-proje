import 'package:flutter/material.dart';
import 'package:myapp/Menuler/appdrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ana Sayfa')),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              /*
              ElevatedButton(
                onPressed: ()=>{
                  Navigator.pushNamed(context, '/giris'),
                },
                child: const Text("Login Sayfasına Git"),
              ),
              */
            ],
          ),
        ],
      ),
    );
  }
}
