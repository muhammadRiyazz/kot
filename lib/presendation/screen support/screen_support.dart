import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:restaurant_kot/application/support/support_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SupportBloc>(context).add(const SupportEvent.getinfoData());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: mainclr,
        title: const Text(
          'Support',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<SupportBloc, SupportState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildShimmerLoading();
          }

          if (state.supportInfo == null) {
            return const Center(child: Text('Failed to load support data.'));
          }

          final supportInfo = state.supportInfo!;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: [
                      const Icon(LucideIcons.globe,
                          size: 60, color: Colors.blueAccent),
                      const SizedBox(height: 8),
                      Text(
                        supportInfo.companyName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Empowering traders since 2010',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(LucideIcons.info, color: Colors.blueAccent),
                          SizedBox(width: 8),
                          Text(
                            'Company Overview',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        supportInfo.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1),
                ListTile(
                  leading: const Icon(LucideIcons.phone, color: Colors.green),
                  title: const Text('Contact Us'),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        supportInfo.phoneNumbers.length,
                        (index) {
                          return InkWell(
                            onTap: () {
                              _makePhoneCall(supportInfo.phoneNumbers[index]);
                            },
                            child: Text(
                              'Phone: ${supportInfo.phoneNumbers[index]}',
                              style: const TextStyle(),
                            ),
                          );
                        },
                      )),
                ),
                const Divider(thickness: 1),
                ListTile(
                  leading:
                      const Icon(LucideIcons.mail, color: Colors.redAccent),
                  title: const Text('Email Us'),
                  subtitle: Text(supportInfo.email),
                ),
                const Divider(thickness: 1),
                ListTile(
                  leading:
                      const Icon(LucideIcons.clock, color: Colors.orangeAccent),
                  title: const Text('Support Hours'),
                  subtitle: Text(supportInfo.workingHours),
                ),
                const Divider(thickness: 1),
                ListTile(
                  onTap: () {
                    final Uri url = Uri.parse(supportInfo.websiteUrl);

                    _launchUrl(url);
                  },
                  leading: const Icon(Icons.link, color: Colors.blue),
                  title: const Text('Website'),
                  subtitle: Text(
                    supportInfo.websiteUrl,
                    style: const TextStyle(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 200,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 150,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 150,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
