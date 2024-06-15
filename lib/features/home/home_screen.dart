import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shiv_super_app/features/OLX/screens/olx_feed_screen.dart';
import 'package:shiv_super_app/features/ads/ads_screen.dart';
import 'package:shiv_super_app/features/jobs/screens/job_seeker/screens/job_feed_screen.dart';
import 'package:shiv_super_app/features/news/screens/news_feed_screen.dart';
import 'package:shiv_super_app/features/shopping/screens/shopping_category_screen.dart';
import 'package:shiv_super_app/features/tweets/screens/tweet_feed_sceen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: homeContents.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (content) => homeContents[i].screen,
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  homeContents[i].imagePath,
                  height: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  homeContents[i].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 15),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           //1111
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 CupertinoPageRoute(
      //                   builder: (content) => const TweetFeedScreen(),
      //                 ),
      //               );
      //             },
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Image.asset(
      //                   "assets/home/social-media.png",
      //                   height: 40,
      //                 ),
      //                 const SizedBox(height: 8),
      //                 Text(
      //                   "Tweets",
      //                   textAlign: TextAlign.center,
      //                   style: Theme.of(context).textTheme.labelLarge,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           //22
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 CupertinoPageRoute(
      //                   builder: (content) => const ShoppingCategoryScreen(),
      //                 ),
      //               );
      //             },
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Image.asset(
      //                   "assets/home/shopping-bag.png",
      //                   height: 40,
      //                 ),
      //                 const SizedBox(height: 8),
      //                 Text(
      //                   "Shop",
      //                   textAlign: TextAlign.center,
      //                   style: Theme.of(context).textTheme.labelLarge,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           //3333
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 CupertinoPageRoute(
      //                   builder: (content) {
      //                     return const JobFeedScreen();
      //                   },
      //                 ),
      //               );
      //             },
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Image.asset(
      //                   "assets/home/job-offer.png",
      //                   height: 40,
      //                 ),
      //                 const SizedBox(height: 8),
      //                 Text(
      //                   "Jobs",
      //                   textAlign: TextAlign.center,
      //                   style: Theme.of(context).textTheme.labelLarge,
      //                 ),
      //               ],
      //             ),
      //           ),
      //           //4444
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.of(context).push(
      //                 CupertinoPageRoute(
      //                     builder: (content) => const NewsFeedScreen()),
      //               );
      //             },
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.center,
      //               children: [
      //                 Image.asset(
      //                   "assets/home/news.png",
      //                   height: 40,
      //                 ),
      //                 const SizedBox(height: 8),
      //                 Text(
      //                   "News",
      //                   textAlign: TextAlign.center,
      //                   style: Theme.of(context).textTheme.labelLarge,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               CupertinoPageRoute(
      //                   builder: (content) => const JobFeedScreen()),
      //             );
      //           },
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Image.asset(
      //                 "assets/home/news.png",
      //                 height: 40,
      //               ),
      //               const SizedBox(height: 8),
      //               Text(
      //                 "Bills",
      //                 textAlign: TextAlign.center,
      //                 style: Theme.of(context).textTheme.labelLarge,
      //               ),
      //             ],
      //           ),
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               CupertinoPageRoute(
      //                   builder: (content) => const JobFeedScreen()),
      //             );
      //           },
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Image.asset(
      //                 "assets/home/news.png",
      //                 height: 40,
      //               ),
      //               const SizedBox(height: 8),
      //               Text(
      //                 "Bills",
      //                 textAlign: TextAlign.center,
      //                 style: Theme.of(context).textTheme.labelLarge,
      //               ),
      //             ],
      //           ),
      //         ),
      //         const Column(
      //           children: [
      //             Text(""),
      //           ],
      //         ),
      //         const Column(
      //           children: [
      //             Text(""),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

class HomeContent {
  final String title;
  final String imagePath;
  final Widget screen;

  HomeContent({
    required this.title,
    required this.imagePath,
    required this.screen,
  });
}

List<HomeContent> homeContents = [
  HomeContent(
    title: "Tweets",
    imagePath: "assets/home/social-media.png",
    screen: const TweetFeedScreen(),
  ),
  HomeContent(
    title: "Shop",
    imagePath: "assets/home/shopping-bag.png",
    screen: const ShoppingCategoryScreen(),
  ),
  HomeContent(
    title: "Jobs",
    imagePath: "assets/home/job-offer.png",
    screen: const JobFeedScreen(),
  ),
  HomeContent(
    title: "News",
    imagePath: "assets/home/news.png",
    screen: const NewsFeedScreen(),
  ),
  // HomeContent(
  //   title: "Bills",
  //   imagePath: "assets/home/news.png",
  //   screen: const JobFeedScreen(),
  // ),
  HomeContent(
    title: "OLX",
    imagePath: "assets/home/OLX_Logo.jpg",
    screen: const OLXFeedScreen(),
  ),
  HomeContent(
    title: "Ads",
    imagePath: "assets/home/ads.png",
    screen: const AddAdsScreen(),
  ),
  HomeContent(
    title: "Pay",
    imagePath: "assets/icons/pay.png",
    screen: const AddAdsScreen(),
  ),
];
