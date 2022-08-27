import 'package:avail_itech_hackfest/screens/contributers/verfication_progress.dart';
import 'package:flutter/material.dart';
import 'package:avail_itech_hackfest/widgets/textformfield.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/textstyle.dart';
import 'contributer_intro.dart';

class OrganizationForm extends StatefulWidget {
  const OrganizationForm({Key? key}) : super(key: key);

  @override
  State<OrganizationForm> createState() => _OrganizationFormState();
}

class _OrganizationFormState extends State<OrganizationForm> {
  final TextEditingController tradeName=TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController state=TextEditingController();
  final TextEditingController district=TextEditingController();
  final TextEditingController DCDM=TextEditingController();
  final TextEditingController address=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
            padding: vpad12+hpad12,
          child: Form(
              key: _key,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Trade Name',style: textFieldTitle,),
                    Text('*',style: TextStyle(color: red,fontSize: 24),),
                  ],
                ),
                sBoxH10,
                FormsField(textEditingController: tradeName,hintText: "Name",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                  },
                  save: (value) {
                    tradeName.text = value!;
                  },),
                Row(
                  children: [
                    Text('State',style: textFieldTitle,),
                    Text('*',style: TextStyle(color: red,fontSize: 24),),
                  ],
                ),
                sBoxH10,
                FormsField(textEditingController: state,hintText: "State",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the state';
                    }
                  },
                  save: (value) {
                    state.text = value!;
                  },),
                Row(
                  children: [
                    Text('District',style: textFieldTitle,),
                    Text('*',style: TextStyle(color: red,fontSize: 24),),
                  ],
                ),
                sBoxH10,
                FormsField(textEditingController: district,hintText: "District",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the District';
                    }
                  },
                  save: (value) {
                    district.text = value!;
                  },),
                Row(
                  children: [
                    Text('Date of Registration of Business',style: textFieldTitle,),
                    Text('*',style: TextStyle(color: red,fontSize: 24),),
                  ],
                ),
                sBoxH10,
                FormsField(textEditingController: DCDM,hintText: "DD/MM/YYYY",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Date of Registration of Business';
                    }
                  },
                    keyboard: TextInputType.number,
                  save: (value) {
                    DCDM.text = value!;
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
