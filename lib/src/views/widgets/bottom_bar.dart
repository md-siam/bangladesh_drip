import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = GoogleFonts.montserrat(color: Colors.white);

    return Container(
      height: 310,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo-trans.png',
                  height: 60,
                ),
              ],
            ),
          ),
          const Divider(height: 2, color: Colors.orange),
          Wrap(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Newsletter', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Contact', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Stores', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Sustainability', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Apps', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Follow Us', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Legal & Privacy', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cookies', style: textStyle),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Jobs', style: textStyle),
              ),
            ],
          ),
          Image.asset('assets/images/payments.png'),
          const SizedBox(height: 10),
          Text(
            '© Bangladesh Drip. Design & Developed ♥\nBY 2A IT LIMITED',
            style: textStyle.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
