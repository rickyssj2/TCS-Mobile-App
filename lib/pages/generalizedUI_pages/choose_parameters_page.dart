import 'package:flutter/material.dart';
import 'package:flutter_login_ui/models/potato_data_model.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_appearance_of_potato_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_chips_color_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_ph_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_reducing_sugar_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_sprout_status_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_starch_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_total_sugar_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_transpiration_page.dart';
import 'package:flutter_login_ui/pages/generalizedUI_pages/stepper_form_pages/stepper_form_weight_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseParametersPage extends StatefulWidget {

  ChooseParametersPage({Key? key}) : super(key: key);

  @override
  State<ChooseParametersPage> createState() => _ChooseParametersPageState();
}

class _ChooseParametersPageState extends State<ChooseParametersPage> {
  PotatoData potatoData = PotatoData(
    variety: 'Kennebec',
    T_ref_reciprocal: 0.00358744,
    k_ref: -0.0099,
    E: 158.8,
    minT: 2,
    maxT: 10,
  );

  String selectedParameter = 'pH';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Choose parameter',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body:SafeArea(
            child: ListView(
              children: [
                buildListTile('Weight','assets/images/generalizedUI_page/parameters/weight.png',context,),
                buildListTile('Transpiration','assets/images/generalizedUI_page/parameters/transpiration.png', context,),
                buildListTile('Reducing sugar','assets/images/generalizedUI_page/parameters/reducing_sugar.png',context,),
                buildListTile('pH','assets/images/generalizedUI_page/parameters/pH.png',context,),
                buildListTile('Total sugar','assets/images/generalizedUI_page/parameters/total_sugar.png',context,),
                buildListTile('Chips Color','assets/images/generalizedUI_page/parameters/chips_color.png',context,),
                buildListTile('Starch','assets/images/generalizedUI_page/parameters/starch.png',context,),
                buildListTile('Sprout Status','assets/images/generalizedUI_page/parameters/sprout_status.png',context,),
                buildListTile('Appearance of potato','assets/images/generalizedUI_page/parameters/appearance_of_potato.png',context,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildCard(HexColor color1, HexColor color2, String title, IconData icon, BuildContext context, ) {
  Widget buildListTile(String title, String assetName, BuildContext context,) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: HexColor('#606060').withOpacity(0.5),
        boxShadow: [BoxShadow(
          color: Colors.black12,
          blurRadius: 3,
          offset: Offset(2,2),
        ),],
      ),

      child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(assetName),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          onTap: () {
            setState(()=> selectedParameter = title);
            print(selectedParameter);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => stepperFormPage()),
            );
          },
        ),
    );
  }

  stepperFormPage() {
    switch(selectedParameter){
      case 'Weight':
        return StepperFormWeightPage(selectedParameter: selectedParameter,);
      case 'Transpiration':
        return StepperFormTranspirationPage(selectedParameter: selectedParameter,);
      case 'Reducing sugar':
        return StepperFormReducingSugarPage(selectedParameter: selectedParameter,);
      case 'pH':
        return StepperFormPhPage(selectedParameter: selectedParameter,);
      case 'Total sugar':
        return StepperFormTotalSugarPage(selectedParameter: selectedParameter,);
      case 'Chips Color':
        return StepperFormChipsColorPage(selectedParameter: selectedParameter,);
      case 'Starch':
        return StepperFormStarchPage(selectedParameter: selectedParameter,);
      case 'Sprout Status':
        return StepperFormSproutStatusPage(selectedParameter: selectedParameter,);
      case 'Appearance of potato':
        return StepperFormAppearanceOfPotatoPage(selectedParameter: selectedParameter,);

      default:
        return null;
    }
  }
}

