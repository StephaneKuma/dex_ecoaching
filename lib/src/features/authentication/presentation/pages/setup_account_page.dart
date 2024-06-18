import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:line_icons/line_icon.dart';

import 'package:e_coaching/src/core/constants/dimensions.dart';
import 'package:e_coaching/src/core/widgets/button.dart';
import 'package:e_coaching/src/core/widgets/custom_text_form_field.dart';

@RoutePage()
class SetupAccountPage extends StatefulWidget {
  const SetupAccountPage({super.key});

  @override
  State<SetupAccountPage> createState() => _SetupAccountPageState();
}

class _SetupAccountPageState extends State<SetupAccountPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  XFile? image;

  void pickImage({required ImageSource source}) async {
    image = await picker.pickImage(source: source);
    setState(() {});
    if (mounted) {
      context.router.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.completeYourProfile),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: image == null
                            ? Image.asset(
                                'assets/images/user.png',
                                height: 200.h,
                                width: 200.h,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                File(image!.path),
                                height: 200.h,
                                width: 200.h,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Positioned(
                        bottom: 12.h,
                        right: 0.h,
                        child: GestureDetector(
                          onTap: () {
                            _showModalBottomSheet(context);
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              color: Colors.green.shade900,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: const LineIcon.editAlt(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.name,
                    prefixIcon: const LineIcon.userAlt(),
                    label: AppLocalizations.of(context)!.fullName,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.text,
                    prefixIcon: const LineIcon.userTag(),
                    label: AppLocalizations.of(context)!.pseudo,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.datetime,
                    prefixIcon: const LineIcon.calendar(),
                    label: AppLocalizations.of(context)!.dateOfBirth,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  CustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const LineIcon.envelopeAlt(),
                    label: AppLocalizations.of(context)!.email,
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {},
                    onInputValidated: (bool value) {},
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: PhoneNumber(isoCode: 'TG'),
                    textFieldController: TextEditingController(),
                    hintText: AppLocalizations.of(context)!.phone,
                    errorMessage:
                        AppLocalizations.of(context)!.invalidPhoneNumber,
                    formatInput: true,
                    keyboardType: const TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  DropdownButtonFormField<String>(
                    validator: (value) {
                      return null;
                    },
                    items: <String>[
                      AppLocalizations.of(context)!.male,
                      AppLocalizations.of(context)!.female,
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    decoration: const InputDecoration(
                      prefixIcon: LineIcon.genderless(),
                    ),
                    hint: Text(AppLocalizations.of(context)!.gender),
                  ),
                  SizedBox(height: kDefaultSizedBoxHeight.h),
                  Button(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    label: AppLocalizations.of(context)!.continuea,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (builder) {
        return SizedBox(
          height: 150.h,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 10.h,
                width: (MediaQuery.of(context).size.width * 0.5).w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    10.r,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(AppLocalizations.of(context)!.chooseProfilePicture),
              SizedBox(
                height: kDefaultSizedBoxHeight.h,
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width * .75).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        pickImage(source: ImageSource.camera);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LineIcon.camera(
                            size: 50.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(AppLocalizations.of(context)!.camera),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pickImage(source: ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LineIcon.image(
                            size: 50.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(AppLocalizations.of(context)!.gallery),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
