import 'package:acs_task/utils/bottom_section.dart';
import 'package:acs_task/utils/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = const AssetImage(
      'assets/front_car.gif',
    );
    super.initState();
  }

  @override
  void dispose() {
    image.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(height: 0.31.sh),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: image,
              )),
            ),
          ),
          const BottomSection(),
        ],
      ),
    );
  }
}