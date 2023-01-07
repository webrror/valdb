import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import 'package:valdb/models/home_list_model.dart';
import 'package:valdb/utils/dimensions.dart';
import 'package:valdb/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    List<HomeListOption> option = HomeListOption.option;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimensions.height60),
          child: const AppBarCustom(
              title: 'Val-DB', bgColor: Color.fromRGBO(253, 69, 86, 1)),
        ),
        body: Builder(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10,
                            right: Dimensions.width10),
                        child: HomeListOptions(
                          option: option[index].name,
                          icon: option[index].icon,
                          route: option[index].routeName
                          
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: option.length),
              ],
            );
          },
        ));
  }
}

class HomeListOptions extends StatelessWidget {
  final String option;
  final Iconify icon;
  final String route;
  const HomeListOptions({
    Key? key,
    required this.option,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimensions.radius10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 9,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: Dimensions.height60,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: EdgeInsets.all(Dimensions.width10),
          child: Row(
            children: [
              Expanded(flex: 1, child: icon),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 10,
                child: Text(
                  option,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                CupertinoIcons.right_chevron,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
