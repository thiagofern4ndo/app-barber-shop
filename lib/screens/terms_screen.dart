import 'package:app_barber_shop/components/shared/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:app_barber_shop/components/theme/colors.dart';
import 'package:app_barber_shop/components/theme/fonts.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CustomScaffold(
      showBackButton: true,
      showInstagramButton: true,
      showContactButton: true,
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.68,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.03),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Text(
              '''1. Aceitação dos Termos: Ao utilizar este aplicativo, você concorda com os termos descritos neste documento.

2. Uso do Aplicativo: O app deve ser utilizado apenas para fins de agendamento de serviços oferecidos pela barbearia.

3. Coleta de Dados: Coletamos informações como nome, e-mail e preferências de agendamento para melhorar sua experiência.

4. Armazenamento de Dados: Seus dados são armazenados com segurança e não são compartilhados com terceiros sem sua autorização.

5. Cancelamentos: Cancelamentos devem ser realizados com pelo menos 2 horas de antecedência do horário agendado.

6. Política de Atrasos: Em caso de atraso superior a 10 minutos, o atendimento poderá ser reagendado conforme disponibilidade.

7. Alterações no Serviço: A barbearia se reserva o direito de alterar os serviços ou horários disponíveis sem aviso prévio.

8. Pagamentos: Os pagamentos podem ser realizados presencialmente ou por meio das formas aceitas no local.

9. Segurança: Tomamos todas as medidas necessárias para proteger suas informações durante o uso do aplicativo.

10. Responsabilidade: O uso do app é de responsabilidade do usuário. Não nos responsabilizamos por agendamentos feitos incorretamente.

11. Suporte: Em caso de dúvidas ou problemas, entre em contato pelo botão de contato no aplicativo.

12. Modificações nos Termos: Estes termos podem ser alterados a qualquer momento, sendo responsabilidade do usuário revisá-los periodicamente.''',
              style: AppFonts.main.copyWith(
                color: AppColors.background,
                fontSize: size.width * 0.038,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
