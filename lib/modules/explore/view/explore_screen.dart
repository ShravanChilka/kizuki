import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/component/button/primary_button.dart';
import '../../../shared/component/button/secondary_button.dart';
import 'widgets/explore_list_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 89),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Explore',
                        style: GoogleFonts.workSans(
                          fontSize: 52.34,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -3.14,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 27.73,
                        foregroundImage: AssetImage(
                          'assets/default_avatar.png',
                        ),
                        backgroundColor: Color(0xFFF5592A),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  PrimaryButton(
                    title: 'Latest',
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  SecondaryButton(
                    title: 'For You',
                    onTap: () {},
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF141414),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 12,
                            right: 10,
                          ),
                          child: Text(
                            'Disable Ads',
                            style: GoogleFonts.workSans(
                              fontSize: 10,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.525,
                              color: const Color(0XFFE6E6E6),
                            ),
                          ),
                        ),
                        CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
            const ExploreListView(),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }
}
