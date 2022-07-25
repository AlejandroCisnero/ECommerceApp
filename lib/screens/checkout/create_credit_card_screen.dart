import 'dart:developer';

import 'package:e_commerce_app/providers/credit_cards.dart';
import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:e_commerce_app/widgets/creditCardColorSelector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:month_year_picker/month_year_picker.dart';

import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CreateCreditCardScreen extends StatefulWidget {
  CreateCreditCardScreen({Key? key}) : super(key: key);
  static const route = '/CreateCreditCardScreen';

  @override
  State<CreateCreditCardScreen> createState() => _CreateCreditCardScreenState();
}

class _CreateCreditCardScreenState extends State<CreateCreditCardScreen> {
  final _creditCardFormKey = GlobalKey<FormState>();

  //--------------------------------Input controllers-----------------------------------------------
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController holderController = TextEditingController();
  final TextEditingController aliasController = TextEditingController();
  Enum creditCardIcon = CreditsCard.green;
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
  //-----------------------------------Functions-------------------------------------------------
  //-------------------------------------------Functions--------------------------------------------
  void changeSelectedCreditCardIcon(Enum newIcon) {
    creditCardIcon = newIcon;
    log('Card icon changed');
  }

  void saveCreditCard() {}
  //-----------------------------------Variables------------------------------------------------------
  bool isLoading = false;
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
        body: Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height:
                MediaQuery.of(context).size.height - kBottomNavigationBarHeight,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.27,
                    child: Form(
                        key: _creditCardFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onEditingComplete: () => _creditCardFormKey
                                        .currentState!
                                        .validate(),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please provide a valid card number';
                                      }
                                      return null;
                                    },
                                    controller: numberController,
                                    onChanged: (value) {
                                      if (value.length == 19) {
                                        changeCardIcon(numberController.text
                                            .substring(
                                                numberController.text.length -
                                                    1));
                                      }
                                    },
                                    inputFormatters: [maskFormatter],
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 10.0),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextFormField(
                                      onEditingComplete: () =>
                                          _creditCardFormKey.currentState!
                                              .validate(),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Provide a valid expiry date';
                                        }
                                        return null;
                                      },
                                      controller: expirationDateController,
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
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextFormField(
                                      onEditingComplete: () =>
                                          _creditCardFormKey.currentState!
                                              .validate(),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Provide a valid CVC code';
                                        }
                                        return null;
                                      },
                                      controller: cvcController,
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
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  _creditCardFormKey.currentState!.validate(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide a card holder';
                                }
                                return null;
                              },
                              textCapitalization: TextCapitalization.words,
                              controller: holderController,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(),
                                labelText: 'Card Holder',
                                labelStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextFormField(
                              onEditingComplete: () =>
                                  _creditCardFormKey.currentState!.validate(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please provide an alias for this card';
                                }
                                return null;
                              },
                              textCapitalization: TextCapitalization.words,
                              controller: aliasController,
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(),
                                labelText: 'Alias',
                                labelStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                            CreditCardColorSelector(
                                changeSelectedCreditCardIcon)
                          ],
                        )),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width - 20, 40))),
                      onPressed: () {
                        if (_creditCardFormKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (ctx) => CupertinoAlertDialog(
                                    title: const Text('Are you sure?'),
                                    content: const Text(
                                        'Is all the data provided right?'),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          Navigator.of(ctx).pop(true);
                                          setState(() {
                                            isLoading = true;
                                          });
                                          _creditCardFormKey.currentState!
                                              .save();
                                          Provider.of<CreditCards>(context,
                                                  listen: false)
                                              .addCreditCard(
                                                  holderController.text,
                                                  numberController.text,
                                                  expirationDateController.text,
                                                  cvcController.text,
                                                  aliasController.text,
                                                  creditCardIcon);
                                          await Future.delayed(
                                              const Duration(seconds: 4));
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(ctx).pop(false);
                                        },
                                      )
                                    ],
                                  ));
                        } else {}
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircularProgressIndicator(),
                      Text(
                        'Checking info',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.background),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.only(bottom: 70),
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
