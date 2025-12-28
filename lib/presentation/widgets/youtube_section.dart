import 'package:flutter/material.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets/animated_positioned_text.dart';
import 'package:aerium/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeSection extends StatefulWidget {
  const YouTubeSection({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  _YouTubeSectionState createState() => _YouTubeSectionState();
}

class _YouTubeSectionState extends State<YouTubeSection> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    
    return Container(
      width: double.infinity,
      color: AppColors.accentColor2.withOpacity(0.35),
      padding: EdgeInsets.symmetric(
        vertical: responsiveSize(context, 60, 80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: responsiveSize(
                context,
                assignWidth(context, 0.10),
                assignWidth(context, 0.15),
                sm: assignWidth(context, 0.15),
              ),
            ),
            child: Column(
              children: [
                AnimatedTextSlideBoxTransition(
                  controller: widget.controller,
                  text: StringConst.YOUTUBE_SECTION_TITLE,
                  textStyle: textTheme.headlineSmall?.copyWith(
                    color: AppColors.black,
                    fontSize: responsiveSize(context, 30, 48, md: 40, sm: 36),
                    height: 2.0,
                  ),
                ),
                SizedBox(height: 16),
                AnimatedPositionedText(
                  controller: CurvedAnimation(
                    parent: widget.controller,
                    curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                  ),
                  text: StringConst.YOUTUBE_SECTION_SUBTITLE,
                  textStyle: textTheme.bodyLarge?.copyWith(
                    fontSize: responsiveSize(
                      context,
                      Sizes.TEXT_SIZE_16,
                      Sizes.TEXT_SIZE_18,
                    ),
                    height: 2,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              
              // Mobile view (scrollable)
              if (screenWidth <= RefinedBreakpoints().tabletNormal) {
                return Container(
                  height: 280,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemCount: Data.featuredVideos.length,
                    itemBuilder: (context, index) {
                      return _buildVideoCard(
                        context,
                        Data.featuredVideos[index],
                        isSmall: true,
                        margin: EdgeInsets.only(right: 16),
                      );
                    },
                  ),
                );
              } else {
                // Desktop view (grid layout)
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children: Data.featuredVideos.map((YouTubeVideoData video) {
                      return _buildVideoCard(context, video);
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildVideoCard(
    BuildContext context,
    YouTubeVideoData video, {
    bool isSmall = false,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    double cardWidth = isSmall ? 280 : 360;
    double cardHeight = isSmall ? 220 : 280;
    
    return InkWell(
      onTap: () {
        _launchYouTubeVideo(video.videoId);
      },
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Gradient background
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.grey100,
                      AppColors.grey300,
                    ],
                  ),
                ),
              ),
              
              // Video icon
              Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 80,
                  color: AppColors.primaryColor.withOpacity(0.6),
                ),
              ),
              
              // Overlay for text readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
              
              // Play button
              Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.black,
                    size: 30,
                  ),
                ),
              ),
              
              // Title at bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    video.title,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _launchYouTubeVideo(String videoId) async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=$videoId');
    try {
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}
