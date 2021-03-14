import 'package:flutter/material.dart';

import 'package:netflix_practice/Pages/TabRoots/comingsoon_tab.dart';
import 'package:netflix_practice/Pages/TabRoots/download_tab.dart';
import 'package:netflix_practice/Pages/TabRoots/home_tab.dart';
import 'package:netflix_practice/Pages/TabRoots/search_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
            ),
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  LandingPage({
    Key key,
    this.title = "",
  }) : super(key: key);

  final String title;

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _tabIndex = 0;

  final List<Widget> _pages = [HomeTabRootPage(), ComingsoonTabRootPage(), SearchTabRootPage(), DownloadTabRootPage()];

  PageController _pageController = PageController(viewportFraction: 1, keepPage: true);

  List<_CustomTabBarItem> items = [
    _CustomTabBarItem(
      title: "Home",
      icon: Icons.home,
      index: 0,
      // tabIndex: _tabIndex,
      // pageController: _pageController,
      // onTap: (index) {
      //   setState(() {
      //     _tabIndex = index;
      //   });
      // },
    ),
    _CustomTabBarItem(
      title: "ComingSoon",
      icon: Icons.multitrack_audio,
      index: 1,
      // tabIndex: _tabIndex,
      // pageController: _pageController,
      // onTap: (index) {
      //   setState(() {
      //     _tabIndex = index;
      //   });
      // },
    ),
    _CustomTabBarItem(
      title: "Searh",
      icon: Icons.search,
      index: 2,
      // tabIndex: _tabIndex,
      // pageController: _pageController,
      // onTap: (index) {
      //   setState(() {
      //     _tabIndex = index;
      //   });
      // },
    ),
    _CustomTabBarItem(
      title: "Downloads",
      icon: Icons.file_download,
      index: 3,
      // tabIndex: _tabIndex,
      // pageController: _pageController,
      // onTap: (index) {
      //   setState(() {
      //     _tabIndex = index;
      //   });
      // },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: SizedBox(
      //     height: kToolbarHeight,
      //     child: Image.asset('assets/icons/logo.png'),
      //   ),
      //   backgroundColor: Colors.black,
      //   actions: [
      //     Icon(Icons.network_cell),
      //     const SizedBox(width: 10.0),
      //     Icon(Icons.face),
      //     const SizedBox(width: 16.0),
      //   ],
      // ),
      // buildPages해서 PageController에 따라 4개의 Pages를 보여줄 수 있도록 해야됨.
      // default는 0번째 페이지.
      // 각각의 페이지를 만들 것
      body: _buildTabPages(),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),

        // TODO: 몇번째 tab을 선택했는지 index / isSelected? color / tabPage
        child: _CustomTabBar(
            currentIndex: _tabIndex,
            items: items,
            onTap: (index) {
              _pageController.jumpToPage(index);
            }),
      ),
    );
  }

  Widget _buildTabPages() {
    return PageView.builder(
      controller: _pageController,
      itemCount: 4,
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        setState(() {
          _tabIndex = index;
        });
      },
    );
  }
}

class _CustomTabBar extends StatelessWidget {
  const _CustomTabBar({
    Key key,
    this.currentIndex,
    this.items,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final List<_CustomTabBarItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(items.length, (index) {
            return _CustomTabBarItem(
              tabIndex: currentIndex,
              icon: items[index].icon,
              title: items[index].title,
              index: items[index].index,
              onPressed: () => onTap(index),
            );
          }),
        ],
      ),
    );
  }
}

class _CustomTabBarItem extends StatelessWidget {
  const _CustomTabBarItem({
    Key key,
    this.tabIndex,
    this.title,
    this.index,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final int index;
  final int tabIndex;
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    TextStyle _defaultStyle = TextStyle(fontSize: 14.0, fontFamily: 'Spoqa', fontWeight: FontWeight.w200, color: Colors.grey);
    TextStyle _activeStyle = TextStyle(fontSize: 14.0, fontFamily: 'Spoqa', fontWeight: FontWeight.w700, color: Colors.white);

    print(">>>>>>> title : $title");

    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(icon, color: tabIndex == index ? Colors.white : Colors.grey), onPressed: null),
            Text(title, style: tabIndex == index ? _activeStyle : _defaultStyle),
          ],
        ),
      ),
    );
  }
}
