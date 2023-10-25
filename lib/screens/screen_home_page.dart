import 'dart:developer';

import 'package:bike_price_prediction/components/custom_dialogue.dart';
import 'package:bike_price_prediction/network/helper.dart';
import 'package:bike_price_prediction/network/manager.dart';
import 'package:bike_price_prediction/utilities/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/custom_dropdown.dart';
import '../components/custom_field_header.dart';
import '../components/custom_input_field.dart';
import '../utilities/app_size.dart';
import '../utilities/image_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> brandList = [
    "Bajaj",
    "TVS",
    "Yamaha",
    "Suzuki",
    "Hero",
  ];

  TextEditingController yearController = TextEditingController();
  TextEditingController travelController = TextEditingController();
  TextEditingController engineController = TextEditingController();
  String brand = "";

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.predict),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Image.asset(
            ImagePath.cover,
            fit: BoxFit.fill,
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSize.gapH40,
                      CustomDropDown<String>(
                        key: const ValueKey("brands"),
                        items: brandList.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {
                          brand = value!;
                        },
                        validatorFunction: (value) {
                          if (value == null) {
                            return "Please select a brand";
                          } else {
                            return null;
                          }
                        },
                        title: AppTexts.brands,
                        isRequired: true,
                      ),
                      AppSize.gapH20,
                      CustomFieldHeader.get(
                        context: context,
                        title: AppTexts.manufacturedYear,
                        isRequired: true,
                      ),
                      AppSize.gapH10,
                      CustomInputField.get(
                        context: context,
                        controller: yearController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hint: "2020",
                        inputFormatters: [LengthLimitingTextInputFormatter(4)],
                        validatorFunction: (value) {
                          if (value!.isEmpty) {
                            return "Please set year";
                          } else {
                            return null;
                          }
                        },
                      ),
                      AppSize.gapH20,
                      CustomFieldHeader.get(
                        context: context,
                        title: AppTexts.totalTravel,
                        isRequired: true,
                      ),
                      AppSize.gapH10,
                      CustomInputField.get(
                        context: context,
                        controller: travelController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        hint: "50000",
                        validatorFunction: (value) {
                          if (value!.isEmpty) {
                            return "Please add total travel";
                          } else {
                            return null;
                          }
                        },
                      ),
                      AppSize.gapH20,
                      CustomFieldHeader.get(
                        context: context,
                        title: AppTexts.engine,
                        isRequired: true,
                      ),
                      AppSize.gapH10,
                      CustomInputField.get(
                        context: context,
                        controller: engineController,
                        textInputType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        hint: "125",
                        inputFormatters: [LengthLimitingTextInputFormatter(4)],
                        validatorFunction: (value) {
                          if (value!.isEmpty) {
                            return "Please add engine capacity";
                          } else {
                            return null;
                          }
                        },
                      ),
                      AppSize.gapH20,
                    ],
                  ),
                ),
                AppSize.gapH40,
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        CustomDialogue.loading(context: context);
                        showResult();

                      }
                    },
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      AppTexts.submit,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                AppSize.gapH40,
              ],
            ),
          ),
        ],
      ),
    );
  }
  void showResult() async {
    Manager manager = await Helper().connection(
        brand: brand,
        manufacturedYear: yearController.text,
        travel: travelController.text,
        engine: engineController.text);

    log("manger value ${manager.price}");
    if(mounted){
      Navigator.of(context).pop();
      if (manager.isOkay){
        CustomDialogue.done(context: context, price: manager.price.toString());
      }
      else{
        CustomDialogue.fail(context: context,);
      }
    }

  }
}
