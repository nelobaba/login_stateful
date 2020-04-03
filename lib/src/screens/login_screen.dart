import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  // Create a global key and associate it with FormState
  // Global key is used to reference a particular element
  // That is rendered to the screen of our device.
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        // associate our Global key to the FormState
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton()
          ]
        )
      )
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit!'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(email);
          print('----------');
          print(password);
        }
      }
    );
  }
}




// import 'dart:async';
// import 'dart:html';

// class Cake {}

// class Order {
//   String type;
//   Order(this.type);
// }

// void main() {
//   final controller = new StreamController();

//   final order = new Order('chocolate');

//    controller.sink.add(order);

//   final baker = new StreamTransformer.fromHandlers(
//     handleData: (cakeType, sink){
//       if(cakeType == 'chocolate'){
//         sink.add(new Cake());
//       }else{
//         sink.addError('I cant bake that type!!!');
//       }
//     }
//   );

//   // returns cakeType
//   controller.stream
//     .map((order) => order.type)
//     .transform(baker)
//     // take data coming out of a stream and do something with it
//     .listen(
//       (cake) => print('Heres your cake $cake'),
//       onError: (err) => print(err)
//     );
// }

// void main() {
//   // final inputElement input = querySelector('input');
//   // final DivElement  divElement = querySelector('div');

//   final validator = new StreamTransformer(
//     handleData: (inputValue, sink){
//       if(inputValue.contains('@')){
//         sink.add(inputValue);
//       }else{
//         sink.addError('Enter a valid Email');
//       }
//     }
//   );

// // set up an event on input element, a stream of event objects
//   input.onInput
//   .map((dynamic event) => event.target.value)
//   .transform(validator)
    //  .transform(notBlank)
//   .listen(
//     (inputValue) => div.innerHtml = '',
//     onError: (err) => div.innerHtml = err
//   );
// }