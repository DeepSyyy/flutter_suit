import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suit_media/feature/first_screen/presentation/provider/first_screen_provider.dart';
import 'package:suit_media/feature/first_screen/presentation/widget/alert_dialog.dart';
import 'package:suit_media/feature/first_screen/presentation/widget/button_widget.dart';
import 'package:suit_media/feature/first_screen/presentation/widget/circle_avatar_widget.dart';
import 'package:suit_media/feature/first_screen/presentation/widget/name_textfield.dart';
import 'package:suit_media/feature/first_screen/presentation/widget/palindrome_textfield.dart';

class SuitMediaScreenFirst extends StatefulWidget {
  const SuitMediaScreenFirst({super.key});

  @override
  State<SuitMediaScreenFirst> createState() => _SuitMediaScreenFirstState();
}

class _SuitMediaScreenFirstState extends State<SuitMediaScreenFirst> {
  TextEditingController controllerPalindrome = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background_first_page.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SuitmediaAvatarCircleAvatar(),
                  const SizedBox(height: 52),
                  SuitmediaTextFieldName(controllerName: controllerName),
                  const SizedBox(height: 15),
                  SuitmediaTextFieldPalindrome(
                      controllerPalindrome: controllerPalindrome),
                  const SizedBox(height: 45),
                  Consumer<FirstScreenProvider>(builder: (context, state, _) {
                    return SuitmediaButton(
                        name: "CHECK",
                        onSubmit: () {
                          var check = state.checkPalindrome(
                              palindromeParams: controllerPalindrome.text);
                          if (check == true) {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const SuitmediaAlertDialog(
                                        isPalindrome: "This is a palindrome"));
                          } else if (check == false) {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const SuitmediaAlertDialog(
                                        isPalindrome:
                                            "This is not a palindrome"));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    const SuitmediaAlertDialog(
                                        isPalindrome:
                                            "Please input palindrome"));
                          }
                          controllerPalindrome.clear();
                        });
                  }),
                  const SizedBox(height: 15),
                  SuitmediaButton(name: "NEXT", onSubmit: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
