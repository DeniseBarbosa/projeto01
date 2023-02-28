import 'package:flutter/material.dart';

import 'src/pages/autenticacao/tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        // todas as scaffold vai receber essa cor
        scaffoldBackgroundColor:
            Color.fromARGB(255, 241, 221, 191).withAlpha(190),
      ),
      home: const TelaLogin(),
    );
  }
}
