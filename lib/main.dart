import 'package:acs_task/ui/bloc/login_bloc.dart';
import 'package:acs_task/ui/login_page.dart';
import 'package:acs_task/utils/ui_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ACS Task',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with UiUtility {
  _goToLoginPage() {
    Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            child: TextButton(
              child: const Text('اذهب لصفحة تسجيل الدخول'),
              onPressed: _goToLoginPage,
            ),
          ),
        ),
      ),
    );
  }
}
