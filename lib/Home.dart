// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_2/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final List<String> profile = [
    'assets/benzama.jpeg',
    'assets/mane.jpeg',
    'assets/marcelo.jpeg',
    'assets/messi.jpeg',
    'assets/neymar.jpeg',
    'assets/ramos.jpeg',
    'assets/ronaldo.jpeg',
    'assets/sahal.jpeg',
    'assets/sunil.jpeg',
  ];
  final List<String> name = [
    'Ben',
    'mane',
    'marce',
    'mechi',
    'ney..',
    'r4',
    'cr 7',
    'S.A.S',
    'chett',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Telegram',
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          IconButton(
              onPressed: () {
                showSignOutDialog(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: profile.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      show(context, name[index]);
                    },
                    child: Column(
                      children: [
                        chatContact(
                            index: index,
                            profile: profile[index],
                            name: name[index]),
                        Divider(),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  void showSignOutDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("sign out"),
          content: Text('are you sure you want to signout?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('no')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  signOut(context);
                },
                child: Text('yes'))
          ],
        );
      },
    );
  }

  void signOut(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  show(context,name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('alert'),
            content: Text('you take $name'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:Text('ok'))
            ],
          );
        });
  }
}

class chatContact extends StatelessWidget {
  final int index;
  final String name;
  final String profile;

  const chatContact({
    required this.index,
    required this.name,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final bool roundProfile = index % 2 == 0;
    return ListTile(
      leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: roundProfile ? BoxShape.circle : BoxShape.rectangle),
          child: roundProfile
              ? CircleAvatar(
                  backgroundImage: AssetImage(profile),
                )
              : Image.asset(profile)),
      title: Text(name),
      subtitle: Text("last massge from $name"),
    );
  }
}
