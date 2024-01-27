import 'package:flutter/material.dart';

class GetTicketScreen extends StatefulWidget {
  const GetTicketScreen({super.key});

  @override
  State<GetTicketScreen> createState() => _GetTicketScreenState();
}

class _GetTicketScreenState extends State<GetTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Get a Ticket',
          style: TextStyle(
            color: Color(0xFF110C26),
            fontSize: 24,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
