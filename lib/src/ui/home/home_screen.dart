import 'package:crypto/src/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Latest',
                    style: TextStyle(color: AppTheme.soft_black, fontSize: 16.0),
                  ),
                ),
                Tab(
                  child: Text(
                    'Favourite',
                    style: TextStyle(color: AppTheme.soft_black, fontSize: 16.0),
                  ),
                ),
              ],
              controller: tabController,
              labelColor: AppTheme.soft_black,
              isScrollable: true,
              indicatorColor: AppTheme.soft_black,
              unselectedLabelColor: AppTheme.soft_black,
            ),
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController, children: [LatestNews(), Container()]))
        ],
      ),
    );
  }
}

class LatestNews extends StatelessWidget {
  const LatestNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Image.network(
                      'https://mpng.subpng.com/20180604/zya/kisspng-bitcoin-com-cryptocurrency-logo-zazzle-kibuba-btc-5b15aa1f157d09.468430171528146463088.jpg',
                      width: 32,
                      height: 32,
                    ),
                    Text('Bit Coin')
                  ],
                ),
                Row(
                  children: [
                    Text('\$50,000'),
                    SizedBox(width: 8.0),
                    FaIcon(
                      FontAwesomeIcons.arrowAltCircleUp,
                      color: Colors.green,
                      size: 18,
                    )
                  ],
                ),
              ]),
            );
          },
        ))
      ],
    );
  }
}
