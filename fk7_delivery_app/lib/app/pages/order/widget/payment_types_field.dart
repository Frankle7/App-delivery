import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/models/payment_type_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentTypeModel> paymentTypes;
  final ValueChanged<int> valueChanged;
  final bool valid;
  final String valueSelected;

  const PaymentTypesField(
      {super.key,
      required this.paymentTypes,
      required this.valueChanged,
      required this.valid,
      required this.valueSelected
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forma de Pagamento',
            style: context.textStyles.textRegular
                .copyWith(fontSize: 16, color: Colors.white),
          ),
          SmartSelect<String>.single(
            title: '',
            selectedValue: valueSelected,
            modalType: S2ModalType.bottomSheet,
            onChange: (selected) {
              valueChanged(int.parse(selected.value
              )); 
            },
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,   
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? '',
                            style: context.textStyles.textRegular
                                .copyWith(color: Colors.white),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !valid,
                      child: const Divider(
                        height: 1,
                        color: Colors.red,
                      ),
                      ),
                      Visibility(
                      visible: !valid,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 9.0,),
                        child: Text(
                          '* Selecione uma forma de pagamento',
                          style: context.textStyles.textRegular
                            .copyWith(fontSize: 13, color: Colors.red, ),
                        ),
                      ),
                      )
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom<String, Map<String, String>>(
              source: [
                {'value': 'VA', 'title': 'Vale Alimentação'},
                {'value': 'VR', 'title': 'Vale Refeição'},
                {
                  'value': 'CC',
                  'title': 'Cartão de Crédito',
                },
              ],
              title: (index, item) => item['title'] ?? '',
              value: (index, item) => item['value'] ?? '',
              group: (index, item) => 'Selecione uma forma de pagamento',
            ),
            choiceType: S2ChoiceType.radios,
            choiceGrouped: true,
            modalFilter: false,
            placeholder: '',
          ),
        ],
      ),
    );
  }
}