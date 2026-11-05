// Public pages served by Firebase Hosting from app/web/ (see docs/release/play-store.md).
import 'package:url_launcher/url_launcher.dart';

const privacyPolicyUrl = 'https://njia.keevana.com/privacy/';
const deleteAccountUrl = 'https://njia.keevana.com/delete-account/';

Future<void> openPrivacyPolicy() => launchUrl(Uri.parse(privacyPolicyUrl), mode: LaunchMode.externalApplication);
