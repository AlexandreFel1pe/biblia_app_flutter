import 'package:biblia/widgets/book_card_list.dart';
import 'package:flutter/material.dart';

class BibliaScreen extends StatelessWidget {
 const BibliaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  Expanded(child: BookCardList()),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}