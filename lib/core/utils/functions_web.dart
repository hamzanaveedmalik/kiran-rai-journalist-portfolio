import 'dart:html' as html;

void downloadResumeWeb(String assetPath) {
  final path = assetPath.startsWith('/') ? assetPath : '/$assetPath';
  final anchor = html.AnchorElement(href: path)
    ..setAttribute('download', 'KR-Resume.pdf')
    ..click();
}

