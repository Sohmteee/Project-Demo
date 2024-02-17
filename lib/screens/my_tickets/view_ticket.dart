import 'package:flutter/material.dart';
import 'package:yeerlo/colors/app_colors.dart';

class ViewTicketScreen extends StatefulWidget {
  const ViewTicketScreen({super.key});

  @override
  State<ViewTicketScreen> createState() => _ViewTicketScreenState();
}

class _ViewTicketScreenState extends State<ViewTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Theme.of(context).colorScheme.,),),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            lightOrangeColor,
            darkOrangeColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      ),
    );
  }
}
