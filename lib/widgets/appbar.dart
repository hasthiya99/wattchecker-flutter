import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const StandardAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'Lexend', fontSize: 16, fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
    );
  }
}

class FeaturePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const FeaturePageAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(200.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
        color: appGreen
      ),
      child: Stack(
        children: [
          SvgPicture.asset('assets/images/appbar_pattern.svg', width: 250,height: 250,),
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: null,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            centerTitle: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // const SizedBox(
                //     height: 50), // Add space between title and search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              defaultShadow(),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for product',
                              hintStyle: TextStyle(
                                fontFamily: 'Mulish',
                                color: Color(0xFFB4BDC4),
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                              prefixIcon: Icon(Icons.search,
                                  size: 16, color: Colors.black),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: FloatingActionButton(
                          key: UniqueKey(),
                          backgroundColor: appCream,
                          onPressed: (){}, 
                          child: SvgPicture.asset('assets/icons/sort.svg',)
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}


class AppBarWithoutSearch extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWithoutSearch({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(110.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
        color: appGreen
      ),
      child: Stack(
        children: [
          SvgPicture.asset('assets/images/appbar_pattern.svg', ),
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: null,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            centerTitle: false,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 50), // Add space between title and search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}