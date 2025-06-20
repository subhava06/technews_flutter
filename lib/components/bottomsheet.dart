import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews_flutter/components/components.dart';
import 'package:technews_flutter/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet (
   BuildContext context, String title, String description, String imageurl, String url
)
{
  showBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20),
          )),
      elevation: 20,
      context: context,
      builder: (context){
        return MyBottomSheetLayout(
          url : url,
          imageurl:imageurl,
          title: title,
          description: description,
        ); //returns your bottomSheet widget
      },);
}

void _launchURL(String url) async {
final Uri _url = Uri.parse(url);
if(await canLaunchUrl(_url)) {
  await launchUrl(_url);
}
else {
  throw 'Could not launch $url';
}
}

//bottom sheet widget class
// could employ things like, buttons, callbacks and layout
class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;

  const MyBottomSheetLayout(
{
  Key ? key,
required this.title,
required this.description,
required this.imageurl,
required this.url})
: super(key : key);


  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
         )
       ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: EdgeInsets.all(10),
            child: ModifiedText(text: description, size: 16, color: Colors.white),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Read full article',
                  recognizer: TapGestureRecognizer()..onTap = () {
                    _launchURL(url);
                  },
                  style: GoogleFonts.lato(
                    color: Colors.blue.shade400,
                  )
                ),
              ]
            ),),
          ),
        ],
      ),
    );
  }
}
