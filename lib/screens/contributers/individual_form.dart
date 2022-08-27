import 'package:avail_itech_hackfest/screens/contributers/verfication_progress.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:avail_itech_hackfest/screens/contributers/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyle.dart';
import 'contributer_intro.dart';

class IndividualForm extends StatefulWidget {
  const IndividualForm({Key? key}) : super(key: key);

  @override
  State<IndividualForm> createState() => _IndividualFormState();
}

class _IndividualFormState extends State<IndividualForm> {
  @override
  final TextEditingController name=TextEditingController();
  final TextEditingController aadhar=TextEditingController();
  final TextEditingController address=TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController intialdateval = TextEditingController();

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null) {
      var data;
      setState(
              () => { data.registrationdate = picked.toString(),
            intialdateval.text = picked.toString()
          }
      );
    }
  }
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
                          builder: (context) => const TermsAndCondtion(),
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
          body: SingleChildScrollView(
            child: Padding(
              padding: vpad12+hpad12,
              child: Form(
                  key: _key,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Name',style: textFieldTitle,),
                        Text('*',style: TextStyle(color: red,fontSize: 24),),
                      ],
                    ),
                    sBoxH10,
                    FormsField(textEditingController: name,hintText: "Name",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                      },
                      save: (value) {
                        name.text = value!;
                      },),
                    Row(
                      children: [
                        Text('Date',style: textFieldTitle,),
                        Text('*',style: TextStyle(color: red,fontSize: 24),),
                      ],
                    ),
                    sBoxH10,
                    FormsField(textEditingController: intialdateval,hintText: "DD/MM/YYYY",
                    validate: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the date';
                      }
                    },
                    ),
                    Row(
                      children: [
                        Text('Aadhar Number',style: textFieldTitle,),
                        Text('*',style: TextStyle(color: red,fontSize: 24),),
                      ],
                    ),
                    sBoxH10,
                    FormsField(textEditingController: aadhar,hintText: "Aadhar Number",
                      validate: (value) {
                        if (value.length != null || value.isEmpty) {
                          return 'Please enter Aadhar Number';
                        }
                      },
                      keyboard: TextInputType.number,
                      save: (value) {
                        aadhar.text = value!;
                      },),
                    Row(
                      children: [
                        Text('Address',style: textFieldTitle,),
                        Text('*',style: TextStyle(color: red,fontSize: 24),),
                      ],
                    ),
                    sBoxH10,
                    FormsField(textEditingController: address,hintText: "House No. / Street",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the House No. / Street';
                        }
                      },
                      save: (value) {
                        address.text = value!;
                      },),
                    FormsField(textEditingController: address,hintText: "Locality",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the Locality';
                        }
                      },
                      save: (value) {
                        address.text = value!;
                      },),
                    FormsField(textEditingController: address,hintText: "City",
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the City';
                        }
                      },
                      save: (value) {
                        address.text = value!;
                      },),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
