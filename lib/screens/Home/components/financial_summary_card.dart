import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class FinancialSummaryCard extends StatefulWidget {
  const FinancialSummaryCard({super.key});

  @override
  State<FinancialSummaryCard> createState() => _FinancialSummaryCardState();
}

class _FinancialSummaryCardState extends State<FinancialSummaryCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: size.height * 0.25,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Setembroooo'),
                  SizedBox(width: 20),
                  Icon(Icons.arrow_circle_down),
                ],
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                foregroundColor: whiteColor,
                child: IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    // Implemente a ação ao pressionar o botão aqui
                    log('Abrir página de perfil');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
