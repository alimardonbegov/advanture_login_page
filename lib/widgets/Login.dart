import 'package:advanture/assets/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final List<InputLabels> inputTexts = [
    InputLabels("Ваш e-mail", "your@email.com"),
    InputLabels("Пароль", "password"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: backgroundColor,
            child: Column(
              children: [
                _Logo(),
                _Inputs(inputTexts: inputTexts),
                SizedBox(height: 50),
                _ButtonLogin()
              ],
            )));
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          child: Text("Login"),
          onPressed: () => {null},
          style: ElevatedButton.styleFrom(
              backgroundColor: blueColor,
              padding: EdgeInsets.fromLTRB(50, 25, 50, 25))),
    );
  }
}

class _Inputs extends StatelessWidget {
  const _Inputs({
    Key? key,
    required this.inputTexts,
  }) : super(key: key);

  final List<InputLabels> inputTexts;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _ValidationArea(labelText: inputTexts),
          _ForgetPassword(linkPage: "https://advanture.me/"),
        ],
      ),
    );
  }
}

class _ForgetPassword extends StatelessWidget {
  final String linkPage;
  const _ForgetPassword({
    Key? key,
    required this.linkPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Link(
          uri: Uri.parse(linkPage),
          builder: (context, followLink) {
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Забыли пароль? ",
                  style: TextStyle(color: greyColor),
                ),
                TextSpan(
                  text: "Вам сюда!",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: blueColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = followLink,
                ),
              ])),
            );
          }),
    );
  }
}

class InputLabels {
  final String name;
  final String placeholder;
  InputLabels(this.name, this.placeholder);
}

class _ValidationArea extends StatelessWidget {
  final List<InputLabels> labelText;
  const _ValidationArea({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: labelText.map((e) => _ValidationWidget(data: e)).toList(),
        ));
  }
}

class _ValidationWidget extends StatelessWidget {
  final InputLabels data;
  const _ValidationWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(data.name,
                  style: TextStyle(
                      color: blueColor, fontWeight: FontWeight.w500))),
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: blueColor)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 2, color: blueColor),
                ),
                hintText: data.placeholder),
          ),
        ]));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      alignment: Alignment.center,
      color: blueColor,
      child: FittedBox(
        child: Text(
          "ADVANTURE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
