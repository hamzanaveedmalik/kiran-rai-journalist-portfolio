import 'package:aerium/presentation/pages/project_detail/project_detail_page.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'functions_stub.dart'
    if (dart.library.html) 'functions_web.dart' as web_functions;

class Functions {
  static void launchUrl(String url) async {
    try {
      // Ensure URL has a protocol
      String urlWithProtocol = url;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        urlWithProtocol = 'https://$url';
      }
      final Uri uri = Uri.parse(urlWithProtocol);
      await url_launcher.launchUrl(
        uri,
        mode: url_launcher.LaunchMode.externalApplication,
      );
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static void navigateToProject({
    required BuildContext context,
    required List<ProjectItemData> dataSource,
    required ProjectItemData currentProject,
    required int currentProjectIndex,
  }) {
    ProjectItemData? nextProject;
    bool hasNextProject;
    if ((currentProjectIndex + 1) > (dataSource.length - 1)) {
      hasNextProject = false;
    } else {
      hasNextProject = true;
      nextProject = dataSource[currentProjectIndex + 1];
    }
    Navigator.of(context).pushNamed(
      ProjectDetailPage.projectDetailPageRoute,
      arguments: ProjectDetailArguments(
        dataSource: dataSource,
        currentIndex: currentProjectIndex,
        data: currentProject,
        nextProject: nextProject,
        hasNextProject: hasNextProject,
      ),
    );
  }

  static String formatProjectTitle(String title) {
    // Special case: GQ should be all caps
    if (title.toLowerCase() == 'gq') {
      return 'GQ';
    }
    // Special case: AP News should have "AP" in all caps
    if (title.toLowerCase() == 'ap news') {
      return 'AP News';
    }
    // Convert to title case (capitalize first letter of each word)
    return title.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }

  static void downloadResume(String assetPath) async {
    try {
      if (kIsWeb) {
        // For web, create a download link
        web_functions.downloadResumeWeb(assetPath);
      } else {
        // For mobile, use url_launcher
        final Uri uri = Uri.parse(assetPath);
        await url_launcher.launchUrl(
          uri,
          mode: url_launcher.LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      print('Error downloading resume: $e');
    }
  }
}
