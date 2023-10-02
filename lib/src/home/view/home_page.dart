import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Supabase.instance.client.auth.signOut();
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  print('Card tapped.');
                },
                child: Container(
                  width: 300,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Card ${index + 1}'),
                      Text('A card that can be tapped'),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
