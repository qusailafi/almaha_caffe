import 'package:almaha_app/presentation/controlers/categories/categories_binding.dart';
import 'package:almaha_app/presentation/controlers/errors/error_controler.dart';
import 'package:almaha_app/presentation/controlers/language/language_controler.dart';
import 'package:almaha_app/presentation/ui/about_us/abous_us.dart';
import 'package:almaha_app/presentation/base/base_state_less.dart';
import 'package:almaha_app/presentation/ui/contact_us/contact_us.dart';
import 'package:almaha_app/presentation/ui/orders/my_orders.dart';
import 'package:almaha_app/presentation/ui/products/cart.dart';
import 'package:almaha_app/presentation/ui/products/products.dart';
import 'package:almaha_app/utils/color_helper.dart';
import 'package:almaha_app/utils/font_helper.dart';
import 'package:almaha_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../generated/l10n.dart';
import '../../widgets/card_widget.dart';
import '../controlers/categories/categories_controler.dart';
class Home extends BaseStateLess {
  @override
  Widget build(BuildContext context)   {
    CategoriesBinding().dependencies();
    final CategoriesControler controler = Get.find<CategoriesControler>();
    final CacheControler languageControler = Get.find<CacheControler>();
NetWorkErrorControler netWorkErrorControler=Get.find<NetWorkErrorControler>();
netWorkErrorControler.context=context;
    Get.updateLocale(Locale(languageControler.local.value));
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).app_name),centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(0.0),
            children: [
              DrawerHeader(
                child: Container(
                  child: Image.asset(
                    Utils.getImgePath("menu.png"),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              ListTile(
                title:   Text(S.of(context).home,style: TextStyle(fontSize:  Helper.smallfont,color:  ColorHelper.brown)),
                onTap: () {
                  Get.offAll(Home());

                },
              ),
              ListTile(
                title:   Text(S.of(context).my_cart,style: TextStyle(fontSize:  Helper.smallfont,color:  ColorHelper.brown)),
                onTap: () {
                  Get.to(MyCart());

                },
              ),
              ListTile(
                title:   Text(S.of(context).my_orders,style: TextStyle(fontSize:  Helper.smallfont,color:  ColorHelper.brown)),
                onTap: () {
                  Get.to(MyOrders());

                },
              ),
              ListTile(
                title: Text(
                  S.of(context).change_language,
                  style: TextStyle(
                      fontSize: Helper.smallfont, color: ColorHelper.brown),
                ),
                onTap: () {
                  languageControler.setLang(context);
                  Get.to(Home());
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).about_us,
                  style: TextStyle(
                      fontSize: Helper.smallfont, color: ColorHelper.brown),
                ),
                onTap: () {
                   Get.to(AboutUsWebView());
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).contac_us,
                  style: TextStyle(
                      fontSize: Helper.smallfont, color: ColorHelper.brown),
                ),
                onTap: () {
                  Get.to(ContactUsPage());
                },
              ),
              ListTile(
                title: Text(
                  S.of(context).log_out,
                  style: TextStyle(
                      fontSize: Helper.smallfont, color:ColorHelper.brown),
                ),
                onTap: () {
                  languageControler.LogOut();


                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Obx(() {
          if (controler.isLoading.value) {
            return CircularProgressIndicator();
          } else if (controler.categories.isNotEmpty) {
            return ListView.builder(
              itemCount: controler.categories.value.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    controler.selectedCategory.value=controler.categories[index];

                    Get.to(ProductsScreen());


                  },
                  child: cardWidget(
                      null,
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 10),
                          Container(alignment:Alignment.center,child:
                          Text(                  textAlign: TextAlign.center,        controler.categories[index],
                            style:   TextStyle(
                              fontSize: Helper.smallfont,

                              color: ColorHelper.brown,
                            ),
                          ),)
                        ],
                      ),
                      EdgeInsets.all(5),
                      MediaQuery.of(context).size.height*.095 ),
                );
              },
            );
          } else {
            return Text(controler.message.value);
          }
        }),
      ),
    );
  }
}
