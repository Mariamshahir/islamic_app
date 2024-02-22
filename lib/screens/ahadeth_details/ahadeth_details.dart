import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/model/screen_details_arg.dart';
import 'package:islamic/utils/aap_theme.dart';
import 'package:islamic/utils/app_colors.dart';
import 'package:islamic/utils/app_language.dart';
import 'package:islamic/widgets/app_scaffold.dart';

class AhadethDetails extends StatefulWidget {
  static const String rountName = "ahadethdetails";
  const AhadethDetails({super.key});

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  String fileContent="";
  late ScreenDetailsArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if(fileContent.isEmpty){
      readAhadethFile();
    }
    return AppScaffold(title: context.getLocalizations.islami,
        bady: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .07,
            horizontal: 28,),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Color(0xccf8f8f8),
              borderRadius: BorderRadius.circular(25)
          ),

          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(args.name,textAlign:TextAlign.center,style: AppTheme.mediumTitleTextStyle,),
                    ),
                    Icon(Icons.play_circle ,size: 25,),
                  ],
                ),
              ),
              Divider(thickness: 2,color: AppColors.lightBlack,),
              Expanded(child: SingleChildScrollView(child: Text(fileContent,
                textAlign:TextAlign.center,
                textDirection: TextDirection.rtl,
                style: AppTheme.smallTitleTextStyle,))),
            ],
          ) ,
        ));
  }

  Future <void> readAhadethFile() async{
    Future<String> futureFileContent= rootBundle.loadString("assets/files/ahadeth/${args.fileName}");
    fileContent = await futureFileContent;
    List <String> fileLine = fileContent.split("\n");
    fileContent=fileLine.join(" ");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

}