import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OpenEmail {
  static Future openLink({
    @required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail({
    @required String toEmail,
    @required String subject,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}';

    await _launchUrl(url);
  }


  static Future _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    }
  }
}