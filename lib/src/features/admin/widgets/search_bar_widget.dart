import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.05,
       //width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Background color
        borderRadius: BorderRadius.circular(15.0), // Border radius
         // Border color (optional)
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                // fillColor: Color.fromRGBO(0, 0, 0, 5),
                 hintText: 'Search flight',
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search,color: Colors.black87,),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              ),
              onChanged: (value) {
                print('Search query: $value');
              },
            ),
          ),
          Container(
            decoration:  BoxDecoration(
              color: Colors.black.withOpacity(0.4), // Background color
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15),
              ), // Border radius
            ),

            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white, // Text color
              ),
              onPressed: () {
                print('Search query: ${_searchController.text}');
              },
              child: Text(
                'Search',style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
