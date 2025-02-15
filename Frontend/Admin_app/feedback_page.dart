/*import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      
      body: Column(
        children: [
          Text('How was the experience using the app?'),
          CheckboxListTile(title: Text('Good'), value: false, onChanged: (val) {}),
          CheckboxListTile(title: Text('Bad'), value: false, onChanged: (val) {}),
          Text('How was the hospital?'),
          CheckboxListTile(title: Text('Good'), value: false, onChanged: (val) {}),
          CheckboxListTile(title: Text('Bad'), value: false, onChanged: (val) {}),
        ],
      ),
      
    );
  }
}*/

/*class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('How was your experience using the app?'),
            CheckboxListTile(title: Text('Good'), value: false, onChanged: (bool? value) {}),
            CheckboxListTile(title: Text('Average'), value: false, onChanged: (bool? value) {}),
            Text('How was your hospital experience?'),
            CheckboxListTile(title: Text('Satisfied'), value: false, onChanged: (bool? value) {}),
            CheckboxListTile(title: Text('Not Satisfied'), value: false, onChanged: (bool? value) {}),
          ],
        ),
      ),
    );
  }
}*/


import 'package:flutter/material.dart';
class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('How was your experience using the app?'),
            CheckboxListTile(title: Text('Good'), value: false, onChanged: (bool? value) {}),
            CheckboxListTile(title: Text('Average'), value: false, onChanged: (bool? value) {}),
            Text('How was your hospital experience?'),
            CheckboxListTile(title: Text('Satisfied'), value: false, onChanged: (bool? value) {}),
            CheckboxListTile(title: Text('Not Satisfied'), value: false, onChanged: (bool? value) {}),
          ],
        ),
      ),
    );
  }
}
