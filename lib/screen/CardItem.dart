import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/WorkingBaseModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/AppColors.dart';

class CardItem extends StatefulWidget {
  final Data item;

  const CardItem({super.key, required this.item});

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch URL')),
        );
      }
    }
  }

  // Helper method to determine responsive values based on screen width
  double _getResponsiveValue(
    BuildContext context, {
    required double extraSmall, // For screens < 400 (e.g., very small mobile)
    required double small, // For screens < 600 (e.g., mobile)
    required double medium, // For screens < 900 (e.g., tablet)
    required double large, // For screens < 1200 (e.g., small desktop)
    required double infinity, // For screens >= 1200 (e.g., large desktop)
  }) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    if (screenWidth < 400) {
      return extraSmall;
    } else if (screenWidth < 600) {
      return small;
    } else if (screenWidth < 900) {
      return medium;
    } else if (screenWidth < 1200) {
      return large;
    } else {
      return infinity;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final cardWidth = _getResponsiveValue(
      context,
      extraSmall: screenWidth * 0.95,
      small: screenWidth * 0.9,
      medium: screenWidth * 0.8,
      large: screenWidth * 0.7,
      infinity: screenWidth * 0.6,
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          _isHovered = !_isHovered;
        });
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _getResponsiveValue(
            context,
            extraSmall: screenHeight * 0.3,
            small: screenHeight * 0.3,
            medium: screenHeight * 0.5,
            large: screenHeight * 0.7,
            infinity: screenHeight * 0.7,
          ),
          transform: Matrix4.translationValues(0, _isHovered ? -30 : 0, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              _getResponsiveValue(context,
                  extraSmall: 6, small: 8, medium: 10, large: 12, infinity: 14),
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.textLightBlueColor.withOpacity(0.5)
                    : Colors.black.withOpacity(0.1),
                blurRadius: _getResponsiveValue(context,
                    extraSmall: 4,
                    small: 6,
                    medium: 8,
                    large: 10,
                    infinity: 12),
                offset: Offset(
                    0,
                    _getResponsiveValue(context,
                        extraSmall: 1,
                        small: 2,
                        medium: 3,
                        large: 4,
                        infinity: 5)),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              _getResponsiveValue(context,
                  extraSmall: 6, small: 8, medium: 10, large: 12, infinity: 14),
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.identity()..scale(_isHovered ? 1.0 : 1.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CachedNetworkImage(
                      imageUrl: widget.item.imageUrl.toString(),
                      height: _getResponsiveValue(
                        context,
                        extraSmall: screenHeight * 0.17,
                        small: screenHeight * 0.17,
                        medium: screenHeight * 0.20,
                        large: screenHeight * 0.22,
                        infinity: screenHeight * 0.28,
                      ),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(color: AppColors.yellowBackground,),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(
                          Icons.error,
                          size: _getResponsiveValue(context,
                              extraSmall: 30,
                              small: 40,
                              medium: 45,
                              large: 50,
                              infinity: 55),
                        ),
                      ),
                      cacheManager: CachedNetworkImageProvider.defaultCacheManager,
                      fadeInDuration: Duration(milliseconds: 300),
                      fadeOutDuration: Duration(milliseconds: 300),
                      errorListener: (error) {
                        debugPrint('Error loading image: $error');
                      },
                    ),
                  ),
                  Positioned(
                    bottom: _isHovered ? 0 : -500,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      width: cardWidth,
                      child: Padding(
                        padding: EdgeInsets.all(
                          _getResponsiveValue(context,
                              extraSmall: 6,
                              small: 8,
                              medium: 10,
                              large: 12,
                              infinity: 14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.title.toString(),
                              style: GoogleFonts.outfit(
                                fontSize: _getResponsiveValue(context,
                                    extraSmall: 10,
                                    small: 11,
                                    medium: 12,
                                    large: 16,
                                    infinity: 18),
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlueColor,
                              ),
                            ),
                            SizedBox(
                              height: _getResponsiveValue(
                                context,
                                extraSmall: screenHeight * 0.002,
                                small: screenHeight * 0.005,
                                medium: screenHeight * 0.01,
                                large: screenHeight * 0.01,
                                infinity: screenHeight * 0.01,
                              ),
                            ),
                            Text(
                              widget.item.description.toString(),
                              style: GoogleFonts.outfit(
                                fontSize: _getResponsiveValue(context,
                                    extraSmall: 8,
                                    small: 10,
                                    medium: 11,
                                    large: 12,
                                    infinity: 12),
                                color: AppColors.textBlueColor,
                              ),
                            ),
                            SizedBox(
                              height: _getResponsiveValue(
                                context,
                                extraSmall: screenHeight * 0.002,
                                small: screenHeight * 0.005,
                                medium: screenHeight * 0.01,
                                large: screenHeight * 0.01,
                                infinity: screenHeight * 0.01,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () =>
                                  _launchUrl(widget.item.liveUrl.toString()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.textBlueColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    _getResponsiveValue(context,
                                        extraSmall: 4,
                                        small: 6,
                                        medium: 7,
                                        large: 8,
                                        infinity: 10),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: _getResponsiveValue(context,
                                      extraSmall: 8,
                                      small: 12,
                                      medium: 16,
                                      large: 20,
                                      infinity: 24),
                                  vertical: _getResponsiveValue(context,
                                      extraSmall: 6,
                                      small: 8,
                                      medium: 10,
                                      large: 12,
                                      infinity: 14),
                                ),
                              ),
                              child: Text(
                                'Go Live',
                                style: GoogleFonts.outfit(
                                  fontSize: _getResponsiveValue(context,
                                      extraSmall: 8,
                                      small: 10,
                                      medium: 11,
                                      large: 12,
                                      infinity: 14),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
