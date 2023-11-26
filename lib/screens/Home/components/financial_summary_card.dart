import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../providers/user-provider.dart';
import '../../../styles/colors.dart';
import 'package:provider/provider.dart';

class FinancialSummaryCard extends StatefulWidget {
  const FinancialSummaryCard({super.key});

  @override
  State<FinancialSummaryCard> createState() => _FinancialSummaryCardState();
}

class _FinancialSummaryCardState extends State<FinancialSummaryCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userProvider = Provider.of<UserProvider>(context);
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
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Setembro', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 20),
                  Icon(Icons.arrow_circle_down),
                  Text('  ')
                ],
              ),
            ),
            Positioned(
                top: 25,
                right: 25,
                child: InkWell(
                  onTap: () {
                    userProvider.removeUser();
                  },
                  child: const Text(
                    'SAIRkjh',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blue,
                    ),
                  ),
                )),
            const Positioned(
              top: 90,
              child: Column(
                children: [
                  Text(
                    "Saldo em conta",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "R\$95,00",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Relatorio extends StatelessWidget {
  const Relatorio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        left: 20,
        top: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor,
                  foregroundColor: whiteColor,
                  radius: 25,
                  child: const Icon(Icons.arrow_downward, size: 32),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Receita"),
                    Text(
                      "R\$30,00",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: whiteColor,
                  radius: 25,
                  child: const Icon(Icons.arrow_downward, size: 32),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Despesa"),
                    Text(
                      "R\$30,00",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
