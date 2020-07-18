import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_clippings_web/ui/signin/widgets/google_sign_in_button.dart';
import 'package:my_clippings_web/ui/signin/widgets/sign_in_form.dart';
import 'package:provider/provider.dart';

import 'sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInViewModel>(
      create: (_) => SignInViewModel(context.read),
      builder: (_, child) {
        return const Scaffold(
          body: SignInViewBody._(),
        );
      },
    );
  }
}

class SignInViewBody extends StatelessWidget {
  const SignInViewBody._({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isLoading = context.select((SignInViewModel viewModel) => viewModel.isLoading);
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                color: Colors.lightBlueAccent,
                alignment: Alignment.centerLeft,
                width: 0.5 * MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.indigo,
                alignment: Alignment.centerRight,
                width: 0.5 * MediaQuery.of(context).size.width,
              )
            ],
          ),
          Padding(
              padding:
                  EdgeInsets.only(top: 70, left: 80, right: 80, bottom: 70),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.5 - 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                Image.asset(
                                  'assets/logo.jpg',
                                  width: 60,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Linotte',
                                  ),
                                ),
                                SizedBox(height: 20),
                                GoogleSignInButton(),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 1,
                                      color: Colors.grey,
                                      margin: EdgeInsets.only(right: 5),
                                    ),
                                    Text(
                                      'OR LOGIN WITH EMAIL',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Linotte',
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 1,
                                      color: Colors.grey,
                                      margin: EdgeInsets.only(left: 5),
                                    )
                                  ],
                                ),
                                SizedBox(height: 40),
                                LoginScreen(),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 80,
                            decoration: BoxDecoration(
                                color: Color(0xff597eb1),
                                image: DecorationImage(
                                  image: AssetImage('assets/intro.png'),
                                  fit: BoxFit.contain,
                                  alignment: Alignment.bottomRight,
                                  scale: 0.4,
                                )),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 40,
                                    left: MediaQuery.of(context).size.width * 0.3,
                                    right: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'New Update Available',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        fontFamily: 'Linotte',
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      'We have added some new structure design to your clippings',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'Linotte',
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

// --------------------
/*
Expanded(
  child: isLoading
      ? Center(child: CircularProgressIndicator(),)
      : LoginScreen(),
),
 */
