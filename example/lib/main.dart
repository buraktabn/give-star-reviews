import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Give Star Reviews Example',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  StarRating(onChanged: (rate) {
                    _showToast(context, rate.toString());
                  }),
                  Divider(height: 20),
                  GiveStarReviews(
                    starData: [
                      GiveStarData(
                          text: 'Review 1',
                          onChanged: (rate) {
                            _showToast(context, rate.toString());
                          }),
                      GiveStarData(
                          text: 'Review 2',
                          onChanged: (rate) {
                            _showToast(context, rate.toString());
                          }),
                      GiveStarData(
                          text: 'Review 3',
                          onChanged: (rate) {
                            _showToast(context, rate.toString());
                          }),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Read only'),
                      StarRating(value: 2),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('7 Starts'),
                      StarRating(
                        value: 2,
                        starCount: 7,
                        onChanged: (rate) {
                          _showToast(context, rate.toString());
                        },
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(txt),
      ),
    );
  }
}
