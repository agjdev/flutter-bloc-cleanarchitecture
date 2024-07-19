import 'package:flutter/material.dart';
import 'package:postblocapp/application/core/services/theme_service.dart';
import 'package:postblocapp/application/features/posts/post_page.dart';
import 'package:postblocapp/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServiceProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
        builder: (context,themeService,child){
          return MaterialApp(
            themeMode: themeService.isDarkModeOn?ThemeMode.dark:ThemeMode.light,
            title: 'Flutter Demo',
            theme:AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
           home: PostWrapper(),
            debugShowCheckedModeBanner: false,
          );


        }
    );


  }
}
