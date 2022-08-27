import 'package:avail_itech_hackfest/screens/contributers/contributer_intro.dart';
import 'package:avail_itech_hackfest/screens/contributers/verfication_progress.dart';
import 'package:avail_itech_hackfest/utils/constants.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/colors.dart';
import '../../utils/textstyle.dart';

class NGOForm extends StatefulWidget {
  const NGOForm({Key? key}) : super(key: key);

  @override
  State<NGOForm> createState() => _NGOFormState();
}

class _NGOFormState extends State<NGOForm> {
  final TextEditingController ngo_name=TextEditingController();
  final TextEditingController ngo_state=TextEditingController();
  final TextEditingController ngo_district=TextEditingController();
  final TextEditingController ngo_type=TextEditingController();
  final TextEditingController ngo_id=TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          toolbarHeight: 70,
          elevation: 2,
          leading: GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContributerIntro(),
                    ),
                        (route) => false);
              },
              child: Icon(Icons.arrow_back,size: 30,color: black,)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationProcess(),
                      ),
                          (route) => false);

                },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: HexColor('#FEED5F'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      )
                  ),
                  child:Text('Next',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: black)),
                ),
              ),
            )
          ],
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: vpad12+hpad12,
            child: Form(
              key: _key,
              child: Column(
               children: [
                 Row(
                   children: [
                     Text('Name of NGO',style: textFieldTitle,),
                     Text('*',style: TextStyle(color: red,fontSize: 24),),
                   ],
                 ),
                 sBoxH10,
                 FormsField(textEditingController: ngo_name,hintText: "Name",
                   validate: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter some text';
                     }
                   },
                   save: (value) {
                     ngo_name.text = value!;
                   },),
                 Row(
                   children: [
                     Text('State',style: textFieldTitle,),
                     Text('*',style: TextStyle(color: red,fontSize: 24),),
                   ],
                 ),
                 sBoxH10,
                 FormsField(textEditingController: ngo_state,hintText: "State",
                   validate: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter the state';
                     }
                   },
                   save: (value) {
                     ngo_state.text = value!;
                   },),
                 Row(
                   children: [
                     Text('State',style: textFieldTitle,),
                     Text('*',style: TextStyle(color: red,fontSize: 24),),
                   ],
                 ),
                 sBoxH10,
                 FormsField(textEditingController: ngo_district,hintText: "District",
                   validate: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter some text';
                     }
                   },
                   save: (value) {
                     ngo_district.text = value!;
                   },),
                 Row(
                   children: [
                     Text('NGO Type',style: textFieldTitle,),
                     Text('*',style: TextStyle(color: red,fontSize: 24),),
                   ],
                 ),
                 sBoxH10,
                 FormsField(textEditingController: ngo_type,hintText: "District",
                   validate: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter some text';
                     }
                   },
                   save: (value) {
                     ngo_type.text = value!;
                   },),
                 Row(
                   children: [
                     Text('Unique ID',style: textFieldTitle,),
                     Text('*',style: TextStyle(color: red,fontSize: 24),),
                   ],
                 ),
                 sBoxH10,
                 FormsField(textEditingController: ngo_id,hintText: "ID",
                   validate: (value) {
                     if (value == null || value.isEmpty) {
                       return 'Please enter some number';
                     }
                   },
                   keyboard: TextInputType.phone,
                   save: (value) {
                     ngo_id.text = value!;
                   },),
               ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
