// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wevr_app/core/components/card_utils.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/components/input_formatters.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../../widgets/payment/credit_card_form_filed.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var formKey = GlobalKey<FormState>();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardHolderNameController = TextEditingController();
  TextEditingController _cardExpiryController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  CardType cardType = CardType.other;
  void getCardTypeFrmNum() {
    // With in first 6 digits we can identify the type so
    if (_cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(_cardNumberController.text);
      CardType type = CardUtils.getCardTypeFromNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    _cardNumberController.addListener(() {
      getCardTypeFrmNum();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.payment,
          style: getBoldStylePoppins(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CreditCard(
              cardNumber: _cardNumberController.text,
              cardExpiry: _cardExpiryController.text,
              cardHolderName: _cardHolderNameController.text,
              cvv: _cvvController.text,
              bankName: "WEVR",
              cardType: cardType, // Optional if you want to override Card Type
              showBackSide: false,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
              textExpDate: 'Exp. Date',
              textName: 'Name',
              textExpiry: 'MM/YY',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    PaymentTextFormField(
                      textEditingController: _cardNumberController,
                      hintText: 'Card Number',
                      prefixIcon: FontAwesomeIcons.creditCard,
                      suffix: CardUtils.getCardIcon(cardType),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                        CardNumberInputFormatter(),
                      ],
                      onChanged: (text) {
                        // Get the current cursor position
                        final cursorPos = _cardNumberController.selection;

                        setState(() {
                          // Update the card number property of the CreditCard widget
                          _cardNumberController.text = text;
                        });

                        // Reset the cursor position to its previous value
                        _cardNumberController.selection = cursorPos;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: PaymentTextFormField(
                            textEditingController: _cvvController,
                            hintText: 'CVV',
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3)
                            ],
                            prefixIcon: FontAwesomeIcons.lock,
                            onChanged: (text) {
                              // Get the current cursor position
                              final cursorPos = _cvvController.selection;

                              setState(() {
                                // Update the cvv property of the CreditCard widget
                                _cvvController.text = text;
                              });
                              // Reset the cursor position to its previous value
                              _cvvController.selection = cursorPos;
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.04, // 4% of screen width
                        ),
                        Expanded(
                          child: PaymentTextFormField(
                            textEditingController: _cardExpiryController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter(),
                            ],
                            hintText: 'MM/YY',
                            prefixIcon: FontAwesomeIcons.calendarDays,
                            onChanged: (text) {
                              // Get the current cursor position
                              final cursorPos = _cardExpiryController.selection;

                              setState(() {
                                // Update the card expiry property of the CreditCard widget
                                _cardExpiryController.text = text;
                              });
                              // Reset the cursor position to its previous value
                              _cardExpiryController.selection = cursorPos;
                            },
                          ),
                        ),
                      ],
                    ),
                    PaymentTextFormField(
                      textEditingController: _cardHolderNameController,
                      keyboardType: TextInputType.name,
                      hintText: 'Card Holder Name',
                      prefixIcon: FontAwesomeIcons.userLarge,
                      onChanged: (text) {
                        // Get the current cursor position
                        final cursorPos = _cardHolderNameController.selection;

                        setState(() {
                          // Update the card holder name property of the CreditCard widget
                          _cardHolderNameController.text = text;
                        });

                        // Reset the cursor position to its previous value
                        _cardHolderNameController.selection = cursorPos;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                    ),
                    Container(
                      width: double.infinity,
                      height: AppSize.s50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorManager.transparent,
                          width: AppSize.s3,
                        ),
                        borderRadius: BorderRadius.circular(
                          AppSize.s10,
                        ),
                      ),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          'Scann Card',
                          style: getMediumStylePoppins(
                            color: ColorManager.black,
                            fontSize: AppSize.s20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: defaultButton(
                            function: () {},
                            text: 'Save',
                            background: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.04, // 4% of screen width
                        ),
                        Expanded(
                          child: defaultButton(
                            function: () {},
                            text: 'Cancel',
                            background: ColorManager.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
