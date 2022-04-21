import 'package:flutter/material.dart';
import 'package:themoviedb/utils/utils.dart';

class ImageBackgroundWithTitle extends StatelessWidget {
  const ImageBackgroundWithTitle({
    Key? key,
    required this.imageUrl,
    this.title,
    this.subtitle,
    this.fontSize = 40,
    this.height = double.infinity,
    this.callToAction,
    this.content,
    this.borderRadius = 0,
    this.margin = 0,
  }) : super(key: key);

  final String imageUrl;
  final String? title;
  final String? subtitle;
  final double fontSize;
  final double height;
  final CallToAction? callToAction;
  final Widget? content;
  final double borderRadius;
  final double margin;

  @override
  Widget build(BuildContext context) {
    final isFull = height == double.infinity;
    final fontSizeTitle = isFull ? fontSize : fontSize - (fontSize * .2);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          color: Colors.transparent,
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.fill,
                height: double.maxFinite,
                width: double.infinity,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(isFull ? 0.3 : 0),
                      Colors.black.withOpacity(isFull ? 0.9 : 0.4),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null)
                      Text(
                        title as String,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeTitle,
                        ),
                      ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        subtitle as String,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize - (fontSize * .6),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                    if (callToAction != null) ...[
                      const SizedBox(height: 20),
                      MaterialButton(
                        elevation: 0,
                        color: Colors.white.withOpacity(0.2),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        onPressed: callToAction?.action,
                        child: Text(
                          callToAction?.title as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize - (fontSize * .6),
                          ),
                        ),
                      ),
                    ],
                    if (content != null) ...[
                      const SizedBox(height: 30),
                      content as Widget,
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
