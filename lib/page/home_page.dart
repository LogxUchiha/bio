import 'package:bio/main.dart';
import 'package:bio/page/fingerprint_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Succesfully Logged in using Local Auth --nalla pulle',
                  style: TextStyle(fontSize: 40),
                ),
                const SizedBox(height: 48),
                buildLogoutButton(context)
              ],
            ),
          ),
        ),
      );

  Widget buildLogoutButton(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => FingerprintPage()),
        ),
      );
}