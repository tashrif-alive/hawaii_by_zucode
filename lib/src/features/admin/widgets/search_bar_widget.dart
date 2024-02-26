import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminSearchBarWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onSearch;

  const AdminSearchBarWidget({
    super.key,
    required this.hintText,
    required this.onSearch,
  });

  @override
  State<AdminSearchBarWidget> createState() => _AdminSearchBarWidgetState();
}

class _AdminSearchBarWidgetState extends State<AdminSearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {
              if (_searchController.text.isNotEmpty) {
                widget.onSearch(_searchController.text);
                print(_searchController.text); // Trigger search
              }
            },
          ),
        ),
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        onSubmitted: widget.onSearch,
      ),
    );
  }
}
