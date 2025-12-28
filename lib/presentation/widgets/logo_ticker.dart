import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aerium/values/values.dart';

class LogoTicker extends StatefulWidget {
  const LogoTicker({
    Key? key,
    required this.logos,
    this.height = 60.0,
    this.spacing = 100.0,
    this.duration = const Duration(seconds: 20),
  }) : super(key: key);

  final List<String> logos;
  final double height;
  final double spacing;
  final Duration duration;

  @override
  _LogoTickerState createState() => _LogoTickerState();
}

class _LogoTickerState extends State<LogoTicker> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late Timer _timer;
  late double _maxScrollExtent;
  late double _currentScrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    
    // Start the scrolling after a short delay to ensure the ListView is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maxScrollExtent = _scrollController.position.maxScrollExtent;
      _startScrolling();
    });
  }

  void _startScrolling() {
    const scrollStep = 1.0; // Pixels to scroll per timer tick
    
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      _currentScrollPosition += scrollStep;
      
      // Loop back to start when we reach the end
      if (_currentScrollPosition >= _maxScrollExtent) {
        _currentScrollPosition = 0.0;
      }
      
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_currentScrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: 20, // Repeat logos multiple times for infinite appearance
        itemBuilder: (context, outerIndex) {
          return Row(
            children: List.generate(widget.logos.length, (innerIndex) {
              final String logoPath = widget.logos[innerIndex];
              final bool isSvg = logoPath.endsWith('.svg');
              
              return Container(
                height: widget.height,
                padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
                child: Center(
                  child: isSvg
                      ? SvgPicture.asset(
                          logoPath,
                          height: widget.height * 0.7,
                          width: widget.height * 1.5, // Make logos wider relative to height
                          placeholderBuilder: (context) => Container(
                            height: widget.height * 0.7,
                            width: widget.height * 1.5,
                            color: Colors.grey[200],
                          ),
                        )
                      : Image.asset(
                          logoPath,
                          height: widget.height * 0.7,
                          width: widget.height * 1.5, // Make logos wider relative to height
                          fit: BoxFit.contain,
                        ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
