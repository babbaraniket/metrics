import 'package:bubbleproject/widgets/appbar.dart';
import 'package:bubbleproject/widgets/metrics.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String label = "Upper Body";
  int weight = 45;
  final labelController = TextEditingController();
  final weightController = TextEditingController();

  @override
  void dispose() {
    labelController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: metricsAppBar(widget.title),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40.0,
            ),

            /* metricsWidget is the final Widget which renders the bubble on the screen
            *  This widget is located in widgets folder in file named metrics.dart
            */
            metricsWidget(label, weight),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: form(),
            ),
          ],
        ),
      ),
    );
  }

  /* Function: form function build and display widgets on the sceen and 
  *             calls methods to validate user input.
  *  Parameter: N/A
  *  Required functions: labelValidator, weightValidator
  *  Return: a form widget to be drawn on the screen */
  Form form() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: labelController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a label'),
            validator: (value) => labelvalidator(value),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: weightController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a weight'),
            validator: (value) => weightValidator(value),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(150.0, 45.0),
              primary: const Color(0x3827ae96).withOpacity(1.0),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  label = labelController.text;
                  weight = int.parse(weightController.text);
                });
                weightController.clear();
                labelController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Values saved'),
                  ),
                );
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /* Function: labelValidator function which validates the text in label field.
  *  Parameter: value submitted into the label field.
  *  Return: null is input is valid else return error message string. */
  String? labelvalidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter label';
    }
    return null;
  }

  /* Function: weightValidator function which validates the text in weight field.
  *  Parameter: value submitted into the weight field.
  *  Return: null is input is valid else return error message string. */
  String? weightValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter weight';
    } else if (int.parse(value) < 0 || int.parse(value) > 350) {
      return 'Weight must be between 0 and 350';
    }
    return null;
  }
}
