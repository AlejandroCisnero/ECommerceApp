import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:e_commerce_app/widgets/creditCardColorSelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CreateCreditCardScreen extends StatefulWidget {
  CreateCreditCardScreen({Key? key}) : super(key: key);
  static const route = '/CreateCreditCardScreen';

  @override
  State<CreateCreditCardScreen> createState() => _CreateCreditCardScreenState();
}

class _CreateCreditCardScreenState extends State<CreateCreditCardScreen> {
  final GlobalKey _creditCardFormKey = GlobalKey<FormState>();

  //--------------------------------Input controllers-----------------------------------------------
  final TextEditingController cvcTextFieldController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  //--------------------------------Input formatters------------------------------------------------
  final maskFormatter = MaskTextInputFormatter(
    mask: '####-####-####-####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final expiryDateFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  ); //This formatter does not work yet, get back after you learn more aboy regular expressions.
  final cvcCodeFormatter = MaskTextInputFormatter(
    mask: '###',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  //------------------------------------------------------------------------------------------------

  RegExp exp = RegExp(r'[1-12]/[22-37]');

  bool isVisa = false;
  void changeCardIcon(String lastNumber) {
    int lastIntNumber = int.parse(lastNumber);
    if (lastIntNumber > 5) {
      setState(() {
        isVisa = false;
      });
    } else {
      setState(() {
        isVisa = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CheckoutAppbar('Add a credit card'),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height:
              MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Form(
                    key: _creditCardFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: cardNumberController,
                                  onChanged: (value) {
                                    if (value.length == 19) {
                                      changeCardIcon(cardNumberController.text
                                          .substring(
                                              cardNumberController.text.length -
                                                  1));
                                    }
                                  },
                                  inputFormatters: [maskFormatter],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder(),
                                    labelText: 'Card Number',
                                    labelStyle: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              isVisa
                                  ? SizedBox(
                                      width: 60,
                                      child: SvgPicture.asset(
                                        'assets/icons/visa_icon.svg',
                                        height: 48,
                                      ),
                                    )
                                  : SizedBox(
                                      width: 60,
                                      child: SvgPicture.asset(
                                        'assets/icons/master_icon.svg',
                                        height: 48,
                                      ),
                                    )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: TextFormField(
                                  controller: expiryDateController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                  inputFormatters: [expiryDateFormatter],
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    labelText: 'Expiry date',
                                    labelStyle: TextStyle(fontSize: 16),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: TextFormField(
                                    controller: cvcTextFieldController,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                    inputFormatters: [cvcCodeFormatter],
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      labelText: 'CVC',
                                      labelStyle: TextStyle(fontSize: 16),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(),
                              labelText: 'Card Holder',
                              labelStyle: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            controller: aliasController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              border: OutlineInputBorder(),
                              labelText: 'Alias',
                              labelStyle: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        const CreditCardColorSelector()
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
