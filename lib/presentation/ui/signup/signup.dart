import 'package:almaha_app/utils/font_helper.dart';
import 'package:almaha_app/widgets/button.dart';
import 'package:almaha_app/widgets/card_widget.dart';
import 'package:almaha_app/widgets/text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SignUp extends StatelessWidget {
  TextEditingController userNameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:

          Stack(children: [
            Container(height: MediaQuery.of(context).size.height,child:
            Image.asset("images/splash.jpg",fit: BoxFit.fitHeight,),),
            Column(
              children: [
                SizedBox(height: Helper.calculateRatioHeight(context, .2),),
                cardWidget(null,
                    textFiledWidgeth(userNameControler,
                        S.of(context).user_name, null, null, null,EdgeInsets.symmetric(horizontal: Helper.paddingViews,vertical:0 )),
                    null ,MediaQuery.of(context).size.height*Helper.heightQueryRatio),
                cardWidget(null,
                    textFiledWidgeth(passwordControler,
                        S.of(context).password, null, null, true,EdgeInsets.symmetric(horizontal: Helper.paddingViews,vertical:0 )),
                    null ,MediaQuery.of(context).size.height*Helper.heightQueryRatio),
                cardWidget(null,
                    textFiledWidgeth(
                        emailControler, S.of(context).email, null, null, null,EdgeInsets.symmetric(horizontal: Helper.paddingViews  )),
                    null ,MediaQuery.of(context).size.height*Helper.heightQueryRatio ),
                evelvatedButton(() {}, S.of(context).sign_up, null,EdgeInsets.symmetric(horizontal: Helper.paddingViews,vertical:Helper.paddingViewsVertical ))
              ],
            )
          ],),


        appBar: AppBar(
            title: Text(S.of(context).sign_up), centerTitle: true, actions: []));
  }
}
