import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:e_commerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreateCreditCardScreen extends StatefulWidget {
  CreateCreditCardScreen({Key? key}) : super(key: key);
  static const route = '/CreateCreditCardScreen';

  @override
  State<CreateCreditCardScreen> createState() => _CreateCreditCardScreenState();
}

class _CreateCreditCardScreenState extends State<CreateCreditCardScreen> {
  final GlobalKey _creditCardFormKey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(
      mask: '####-####-####-####',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CheckoutAppbar('Add a credit card'),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
              key: _creditCardFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(),
                        labelText: 'Number',
                        icon: SvgPicture.asset(
                          'assets/icons/visa_icon.svg',
                          height: 48,
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
