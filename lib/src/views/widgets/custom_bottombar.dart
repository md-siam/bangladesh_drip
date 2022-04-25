import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
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
                child: Text(
                  'Newsletter',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Contact',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Stores',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sustainability',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Apps',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Follow Us',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Legal & Privacy',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Cookies',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Jobs',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ],
          ),
          Text(
            '© Bangladesh Drip. Design & Developed ♥\nBY 2A IT LIMITED',
            style: GoogleFonts.montserrat(color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
