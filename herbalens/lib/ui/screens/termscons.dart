import 'package:flutter/material.dart';
import 'package:herbalens/ui/screens/Account/signin_page.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  @override
  _TermsAndConditionsScreenState createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(41, 110, 72, 1),
        title: const Text(
          'Terms and Condition',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Disclaimer:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          "\nAn application for an intelligent herbal plant identification and classification called HerbaLens submitted by TriCo contains the following warning. Before you use the application, please keep this warning in mind. \n\n"),
                  TextSpan(
                      text: 'No medical advice:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " The information provided by this application shall be only for a general informational purpose and should not be regarded as medical advice. It is not intended for diagnosis, treatment or prevention of any disease. Before you use any herbal medicinal product or natural remedy, please consult a qualified healthcare professional. \n\n"),
                  TextSpan(
                      text: 'Accuracy of information:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " While we're trying to provide the correct and updated information, application identification and recommendation results are generated by algorithms and user inputs. The accuracy, completeness and reliability of the information provided cannot be guaranteed. Users should be responsible for independently verifying the information and using it at their own risk. \n\n"),
                  TextSpan(
                      text: 'Responsibility of the user:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " The application is intended to be just a tool for information purposes. On the basis of the information provided by the application, users are solely responsible for their decisions and actions. The Application does not substitute professional medical advice or judgment. \n\n"),
                  TextSpan(
                      text: 'Allergies and Sensitivities:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " Some herbal plants may cause allergic reactions or have interactions with medications or pre-existing conditions. Before using herbal products or medicinal products, users should exercise due care and consult a healthcare professional if they have known allergies, sensitivities or medical conditions. \n\n"),
                  TextSpan(
                      text: 'External links for further information:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " The application may be accompanied by an external website or resource. We provide these links for convenience, and no responsibility shall be assumed or accepted in relation to the content or accuracy of such external sources. \n\n"),
                  TextSpan(
                      text: 'Technical limitations:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " Various factors such as image quality, light conditions, user input and database constraints may influence the accuracy of identification and recommendation results. The performance of the application may be different, and its results must be interpreted with caution. \n\n"),
                  TextSpan(
                      text: 'No liability:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          " for the direct, indirect, incidental, consequential or exemplary loss incurred because of using an application or relying on information provided where this is permitted by law, TriCo and its associated entities, officers, employees or agents shall not be liable. \n\n"),
                  TextSpan(
                      text:
                          "When using this application, you acknowledge that you have read, understood and agreed to the set of clauses. If you do not agree to any part of the warning, please refrain from using this application."),
                ],
              ),
              textAlign: TextAlign.justify,
            ),
            // Add more Text widgets for additional terms and conditions
            SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked =
                          value ?? false; // Update the state of the checkbox
                    });
                  },
                ),
                Text('I agree to the terms and conditions'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SignIn()));
                    }
                  : null, // Disable the button if _isChecked is false
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
