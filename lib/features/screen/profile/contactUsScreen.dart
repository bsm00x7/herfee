import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});
  // Color scheme matching your profile screen
  static const Color primaryColor = Color(0xFF6366F1); // Indigo
  static const Color secondaryColor = Color(0xFF8B5CF6); // Purple
  static const Color accentColor = Color(0xFF06B6D4); // Cyan
  static const Color successColor = Color(0xFF10B981); // Emerald
  static const Color warningColor = Color(0xFFF59E0B); // Amber
  static const Color surfaceColor = Color(0xFFF8FAFC); // Light gray
  static const Color cardColor = Color(0xFFFFFFFF); // White
  static const Color gradientStart = Color(0xFF667EEA);
  static const Color gradientEnd = Color(0xFF764BA2);

  // Your contact information
  static const String email = 'bassemnaser124@gmail.com';
  static const String phoneNumber = '+216 20 492 801';
  static const String location = 'Mahdia, Tunisia';
  static const String address = 'Mahdia , kerker Tunisia';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [surfaceColor, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with gradient background
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [gradientStart, gradientEnd],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Back button and title
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),

                        // Contact header info
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.headset,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Get in Touch',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'We\'d love to hear from you!\nReach out to us anytime.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withValues(alpha: 0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Contact Cards
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Email Card
                    _buildContactCard(
                      context: context,
                      icon: FontAwesomeIcons.envelope,
                      iconColor: accentColor,
                      title: 'Email',
                      subtitle: 'Send us an email',
                      value: email,
                      onTap: () => _launchEmail(),
                      onLongPress: () =>
                          _copyToClipboard(context, email, 'Email'),
                    ),

                    SizedBox(height: 16),

                    // Phone Card
                    _buildContactCard(
                      context: context,
                      icon: FontAwesomeIcons.phone,
                      iconColor: successColor,
                      title: 'Phone',
                      subtitle: 'Give us a call',
                      value: phoneNumber,
                      onTap: () => _launchPhone(),
                      onLongPress: () => _copyToClipboard(
                        context,
                        phoneNumber,
                        'Phone number',
                      ),
                    ),

                    SizedBox(height: 16),

                    // Location Card
                    _buildContactCard(
                      context: context,
                      icon: FontAwesomeIcons.locationDot,
                      iconColor: warningColor,
                      title: 'Location',
                      subtitle: 'Visit our office',
                      value: location,
                      onTap: () => _launchMaps(),
                      onLongPress: () =>
                          _copyToClipboard(context, address, 'Address'),
                    ),

                    SizedBox(height: 30),

                    // Tunisia Info Card
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor.withValues(alpha: 0.1),
                            secondaryColor.withValues(alpha: 0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryColor.withValues(alpha: 0.2),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: primaryColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '🇹🇳',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tunisia Office',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                    Text(
                                      'Located in the heart of Tunis',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Mon - Fri: 9:00 AM - 6:00 PM',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.globe,
                                size: 16,
                                color: Colors.grey[600],
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Timezone: GMT+1 (CET)',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                    // Social Media Section
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Follow Us',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildSocialButton(
                                FontAwesomeIcons.facebook,
                                Color(0xFF1877F2),
                                () => _launchSocial('facebook'),
                              ),
                              _buildSocialButton(
                                FontAwesomeIcons.instagram,
                                Color(0xFFE4405F),
                                () => _launchSocial('instagram'),
                              ),
                              _buildSocialButton(
                                FontAwesomeIcons.linkedin,
                                Color(0xFF0A66C2),
                                () => _launchSocial('linkedin'),
                              ),
                              _buildSocialButton(
                                FontAwesomeIcons.twitter,
                                Color(0xFF1DA1F2),
                                () => _launchSocial('twitter'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String value,
    required VoidCallback onTap,
    required VoidCallback onLongPress,
  }) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                FontAwesomeIcons.chevronRight,
                size: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  // Launch email app
  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contact from Fitness App',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  // Launch phone dialer
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  // Launch maps
  Future<void> _launchMaps() async {
    final Uri mapsUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=Mahdia,Tunisia',
    );

    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri, mode: LaunchMode.externalApplication);
    }
  }

  // Launch social media
  Future<void> _launchSocial(String platform) async {
    String url = '';
    switch (platform) {
      case 'facebook':
        url = 'https://www.facebook.com/bassem.nasr07';
        break;
      case 'instagram':
        url = 'https://www.instagram.com/bassem_nasr_/';
        break;
      case 'linkedin':
        url = 'https://www.linkedin.com/in/bassem-naser-462249265/';
        break;
      case 'twitter':
        url = 'https://x.com/DevBassemX07?t=VtaU0HUm9wwVkNSUEEFbuQ&s=09';
        break;
    }

    if (url.isNotEmpty) {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  // Copy to clipboard
  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(FontAwesomeIcons.check, color: Colors.white, size: 16),
            SizedBox(width: 8),
            Text('$label copied to clipboard'),
          ],
        ),
        backgroundColor: successColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
