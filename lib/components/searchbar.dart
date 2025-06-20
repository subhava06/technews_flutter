import 'package:flutter/material.dart';
import 'package:technews_flutter/backend/functions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews_flutter/utils/colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  static TextEditingController searchcontroller = TextEditingController(text: '');


  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(
          height: 50,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: AppColors.darkGrey,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: CustomSearchBar.searchcontroller,
                  decoration: InputDecoration(
                    hintText: 'Search a keyword or a phrase',
                    hintStyle: GoogleFonts.lato(),
                    border: InputBorder.none,
                  ),
                ),),
              ],
            ),
          ),
        ),),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
              height: 45,
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}
