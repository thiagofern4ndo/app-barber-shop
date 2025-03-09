/*import 'package:flutter/material.dart';
import 'package:app_barber_shop/widgets/buttons/custom_buttonGreen.dart'; // Importa o CustomButton
import 'package:app_barber_shop/widgets/buttons/button_instagram.dart';
import 'package:app_barber_shop/widgets/buttons/button_contact.dart'; // Importa o ContactButton
import 'package:app_barber_shop/widgets/buttons/button_back.dart'; // Importa o CustomBackButton
import 'package:app_barber_shop/widgets/text/text_direitos.dart'; // Importa o TextWidget

class PagEs extends StatefulWidget {
  @override
  _PagEsState createState() => _PagEsState();
}

class _PagEsState extends State<PagEs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 20,
            child: CustomBackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ), // Adiciona o CustomBackButton no canto superior esquerdo
          ),
          Positioned(
            top: 10,
            right: 20,
            child: InstagramIconButton(), // Adiciona o IconButton no canto superior direito
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: 
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: CustomButton(
                    text: 'Continuar',
                    onPressed: () {
                      // Ação ao pressionar o botão Continuar
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ContactButton(
                    text: 'Contato',
                    onPressed: () {
                      // Ação ao pressionar o botão de contato
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: TextWidget(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/
