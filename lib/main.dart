import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MaterialApp(home: InputWidgetsDemo(),
debugShowCheckedModeBanner: false,
));

class InputWidgetsDemo extends StatefulWidget {
  @override
  _InputWidgetsDemoState createState() => _InputWidgetsDemoState();
}

class _InputWidgetsDemoState extends State<InputWidgetsDemo> {
  // Variables to hold widget states
  bool isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  double rating = 3.0;
  String selectedRadio = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                Text('Checkbox'),
              ],
            ),

            SizedBox(height: 20),

            // RadioButtons
            Text('Radio Buttons:'),
            Row(
              children: [
                Radio(
                  value: 'Option 1',
                  groupValue: selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      selectedRadio = value ?? '';
                    });
                  },
                ),
                Text('Option 1'),
                Radio(
                  value: 'Option 2',
                  groupValue: selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      selectedRadio = value ?? '';
                    });
                  },
                ),
                Text('Option 2'),
              ],
            ),

            SizedBox(height: 20),

            // RatingBar
            Text('Rating Bar:'),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (ratingValue) {
                setState(() {
                  rating = ratingValue;
                });
              },
            ),
            SizedBox(height: 10),
            Text('Rating: $rating'),

            SizedBox(height: 20),

            // Slider (SeekBar)
            Text('SeekBar (Slider):'),
            Slider(
              value: sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 10,
              label: sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Text('Value: ${sliderValue.round()}'),

            SizedBox(height: 20),

            // Switch
            Row(
              children: [
                Switch(
                  value: isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                ),
                Text('Switch: ${isSwitched ? "ON" : "OFF"}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
