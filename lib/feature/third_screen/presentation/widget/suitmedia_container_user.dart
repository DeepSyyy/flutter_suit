import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuitmediaContainerUser extends StatelessWidget {
  const SuitmediaContainerUser(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.email});
  final String imageUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(email,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: const Color(0xff686777),
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
