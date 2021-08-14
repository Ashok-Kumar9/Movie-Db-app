import 'package:flutter/material.dart';
import 'package:teachedison/utils/reusable_widgets.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 50.0, color: Colors.white),
              SizedBox(height: 16.0),
              Text(
                'Haven\'t added anything yet',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.0),
              ReusableWidgets().elevatedButtonWithIcon(
                  Icons.add_circle, 'Add to Favorites', () => null)
            ],
          ),
        ),
      ),
    );
  }
}
