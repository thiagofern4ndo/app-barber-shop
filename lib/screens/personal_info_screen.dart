import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';
import 'package:app_barber_shop/components/theme/colors.dart'; // Certifique-se de importar AppColors
import 'package:app_barber_shop/components/buttons/button_secondary.dart';
import 'package:app_barber_shop/components/buttons/button_main.dart';


class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScaffold(
      showBackButton: true,
      showContactButton: true,
      body: Column(
        
        children: [
          SizedBox(height: size.height * 0.15), 
          Text(
            'Informações Pessoais',
            style: AppFonts.main.copyWith(
              fontSize: size.width * 0.06, 
              color: AppColors.primaryText,
            ),
          ),


          SizedBox(height: size.height * 0.09), 

          
          CustomButton2(
            text: 'giovanni gustavo santos sousa ',
            onPressed: () {},
            height: size.height * 0.055, 
            width: size.width * 0.75, 
            textStyle: TextStyle(
            fontSize: size.width * 0.045, 
            color: AppColors.primaryText,
            ),
          ),

           SizedBox(height: size.height * 0.05), 

         CustomButton2(
          text: 'giovannigustavos@gmail.com',
          onPressed: () {},
          height: size.height * 0.055,
          width: size.width * 0.75,
          textStyle: TextStyle(
          fontSize: size.width * 0.045, 
          color: AppColors.primaryText,
            ),
        ),

           SizedBox(height: size.height * 0.05), 

          CustomButton2(
            text: 'telefone: (11) 9 9999-9999',
            onPressed: () {},
            height: size.height * 0.055, 
            width: size.width * 0.75,
            textStyle: TextStyle(
            fontSize: size.width * 0.045, 
            color: AppColors.primaryText,
              ), 
          ),

            SizedBox(height: size.height * 0.08),

           CustomButton(
            text: 'Salvar alterações',
            onPressed: () {},
            height: size.height * 0.05, 
            width: size.width * 0.5, 
            color: AppColors.primary,
            fontSize: size.width * 0.04,
           )
        ],
      ),
    );
  }
}