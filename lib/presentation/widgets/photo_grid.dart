import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatelessWidget {
  final List<String> photoPaths;
  final int crossAxisCount;

  const PhotoGrid({
    Key? key,
    required this.photoPaths,
    this.crossAxisCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int responsiveCrossAxisCount = responsiveSize(
      context,
      2.0, // Mobile: 2 columns
      5.0, // Desktop: 5 columns
      md: 3.0, // Tablet: 3 columns
    ).toInt();

    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsiveCrossAxisCount,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: photoPaths.length,
        itemBuilder: (context, index) {
          return _PhotoItem(
            imagePath: photoPaths[index],
            photoPaths: photoPaths,
            initialIndex: index,
          );
        },
      ),
    );
  }
}

class _PhotoItem extends StatelessWidget {
  final String imagePath;
  final List<String> photoPaths;
  final int initialIndex;

  const _PhotoItem({
    Key? key,
    required this.imagePath,
    required this.photoPaths,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => _PhotoViewer(
              photoPaths: photoPaths,
              initialIndex: initialIndex,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: AppColors.grey100,
                child: const Icon(
                  Icons.broken_image,
                  color: AppColors.grey500,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PhotoViewer extends StatefulWidget {
  final List<String> photoPaths;
  final int initialIndex;

  const _PhotoViewer({
    Key? key,
    required this.photoPaths,
    required this.initialIndex,
  }) : super(key: key);

  @override
  State<_PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<_PhotoViewer> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '${_currentIndex + 1} / ${widget.photoPaths.length}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.photoPaths.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return InteractiveViewer(
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.asset(
                widget.photoPaths[index],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white,
                      size: 64,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

