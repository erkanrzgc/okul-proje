import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ana Sayfa')),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: ()=>{
                  Navigator.pushNamed(context, '/giris'),
                },
                child: const Text("Login Sayfasına Git"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
