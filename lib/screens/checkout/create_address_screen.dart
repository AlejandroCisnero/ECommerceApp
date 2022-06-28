import 'package:e_commerce_app/widgets/checkout/checkout_appbar.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CreateAddressScreen extends StatefulWidget {
  const CreateAddressScreen({Key? key}) : super(key: key);
  static const route = '/address/add';

  @override
  State<CreateAddressScreen> createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  String selectedCountry = 'Select a Country';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CheckoutAppbar('Add an address'),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: nameController,
                        style: const TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid entry';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: addressController,
                        maxLines: 4,
                        minLines: 4,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'Address'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid entry';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: countryController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Country',
                        ),
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country country) {
                              countryController.text = country.displayName;
                              setState(() {
                                selectedCountry = country.displayName;
                              });
                              print('Select country: ${country.displayName}');
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: stateController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'State'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid entry';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: cityController,
                        decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: 'City'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid entry';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: zipCodeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Zip code',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid entry';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        dismissDirection: DismissDirection.startToEnd,
                        padding: const EdgeInsets.all(0),
                        content: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary),
                          child: Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Processing Data',
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                    width: double.infinity,
                    child: const Text(
                      'Save',
                      textAlign: TextAlign.center,
                    )))
          ],
        ),
      ),
    );
  }
}
