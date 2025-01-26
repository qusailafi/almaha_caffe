import 'package:almaha_app/presentation/controlers/auth/login_controler.dart';
import 'package:almaha_app/presentation/controlers/language/language_controler.dart';
import 'package:almaha_app/presentation/ui/signup/signup.dart';
import 'package:almaha_app/utils/color_helper.dart';
import 'package:almaha_app/utils/font_helper.dart';
import 'package:almaha_app/widgets/button.dart';
import 'package:almaha_app/widgets/card_widget.dart';
import 'package:almaha_app/widgets/text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginControler loginControler = Get.put(LoginControler());
  CacheControler cacheControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Form(
          child:
          Stack(children: [
           Container(height: MediaQuery.of(context).size.height,child:
           Image.asset("images/splash.jpg",fit: BoxFit.fitHeight,),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset("images/cup_white.png",height: Helper.calculateRatioHeight(context, .22),),

                cardWidget(
                    null,
                    textFiledWidgeth(
                        _emailController,
                        S.of(context).user_name,
                        TextInputType.emailAddress,
                        null,
                        false,
                        EdgeInsets.all(Helper.paddingViews)),
                    null, Helper.calculateRatioHeight(context, Helper.heightQueryRatio)),
                SizedBox(height: Helper.paddingViews),
                cardWidget(
                    null,
                    textFiledWidgeth(
                        _passwordController,
                        S.of(context).password,
                        null,
                        null,
                        true,
                        EdgeInsets.all(Helper.paddingViews)),
                    null,Helper.calculateRatioHeight(context, Helper.heightQueryRatio)),
                SizedBox(height: Helper.paddingViews),
                evelvatedButton(() {
                  loginControler.login(
                      _emailController.text, _passwordController.text);
                }, S.of(context).log_in, null,
                    EdgeInsets.all(Helper.paddingViews)),
                SizedBox(height: Helper.paddingViews),
                TextButton(
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: Text(S.of(context).sign_up,style: TextStyle(fontSize: Helper.midFont,color: Colors.white,fontWeight: FontWeight.bold),),),
              ],
            ),
          ],)

        ),
      ),
    );
  }
}
