import 'package:flutter/material.dart';

import 'package:netflix_practice/Pages/TabRoots/tv_show_page.dart';

class HomeTabRootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = Theme.of(context).textTheme.bodyText1;

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset('assets/icons/logo.png'),
        ),
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.network_cell),
          const SizedBox(width: 10.0),
          Icon(Icons.face),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text("TV Shows", style: defaultTextStyle.copyWith(fontSize: 15)),
                    onTap: () => TvShowsPage(), // push로 넘어가게 바꿔야됨.
                  ),
                  const SizedBox(width: 30.0),
                  InkWell(
                    child: Text("Movies", style: defaultTextStyle.copyWith(fontSize: 15)),
                    onTap: () => TvShowsPage(), // push로 넘어가게 바꿔야됨.
                  ),
                  const SizedBox(width: 30.0),
                  InkWell(
                    child: Text("Categories", style: defaultTextStyle.copyWith(fontSize: 15)),
                    onTap: () => TvShowsPage(), // push로 넘어가게 바꿔야됨.
                  ),
                ],
              ),
            ),
            const SizedBox(height: 400),
            Text("Something", style: defaultTextStyle.copyWith(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
