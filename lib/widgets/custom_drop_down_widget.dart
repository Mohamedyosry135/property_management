import 'package:flutter/material.dart';
import 'package:property_managment/consts/colors.dart';
import 'package:property_managment/consts/text_styles.dart';
import 'package:property_managment/lang/translation_service.dart';
import 'package:property_managment/resources/common_assets.dart';
import 'package:property_managment/widgets/custom_text.dart';


class CustomDropDownWidget<T> extends StatelessWidget {
  final T value;
  final String label;
  final List<T> items;
  final Function(T?) onChange;
  final Function()? onRemove;
  final String? Function(T?)? validator;
   TextStyle?textStyles;
   CustomDropDownWidget({Key? key,this.onRemove,this.validator,required this.value,required this.items,required this.onChange,this.textStyles,this.label = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label.isNotEmpty)
          Container(
            // margin: const EdgeInsetsDirectional.only(bottom: 3),
            child: CustomText(
              text: label,
              textStyle: TextStyles.textMedium18.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black.withOpacity(.6)
              ),
              maxLines: 1,
            ),
          ),
        Container(
          height: 50,
          child: DropdownButtonFormField<T>(
            value: value.toString().isEmpty ? null : value,
            icon:  Image.asset(
              AppAssets.dropDown(),
            ),
            elevation: 0,

            style: TextStyles.textMedium16.copyWith(
              color: const Color(ColorCode.black),
            ),
            hint: Container(

              alignment: AlignmentDirectional.centerStart,
              child: CustomText(
                text:"${CommonLang.select.tr()} $label",
                textStyle: TextStyles.textMedium13.copyWith(
                    color: Color(ColorCode.lightGray),
                    fontWeight: FontWeight.w100
                ),
              ),
            ),
            validator: validator,

            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(ColorCode.gray2), width: 1),
              ),
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(ColorCode.gray2), width: 1),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(ColorCode.gray2), width: 1),
              ),
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              focusedErrorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.red, width: 1),
              ),
              disabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                    color: Color(ColorCode.gray2), width: 1),
              ),


            ),
            items: items.map((T items)  {
              return DropdownMenuItem(
                value: items,

                child: CustomText(
                  text: items.toString(),
                  textStyle:  textStyles ??  TextStyles.textMedium16.copyWith(
                    color: const Color(ColorCode.black),

                  ),
                ),
              );
            }).toList(),
            selectedItemBuilder: (context){
              return items.map((e){
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: e.toString(),
                        textStyle: TextStyles.textMedium16,
                      ),
                      if(onRemove != null)
                        InkWell(
                          onTap: onRemove,
                          child: const Icon(
                              Icons.close
                          )
                        )
                    ],
                  ),
                );
              }).toList();
            },
            dropdownColor: const Color(ColorCode.white),
            menuMaxHeight: 300,
            borderRadius: BorderRadius.circular(25),

            isExpanded: true,
            onChanged: (T? val){
              onChange(val);
            },
          ),
        ),
      ],
    );
  }
}
