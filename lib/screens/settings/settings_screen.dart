import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../constants/app_strings.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/common/custom_app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.settingsTitle,
        onBackPressed: () {
          context.pop();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildThemeSection(context),
            _buildDivider(),
            _buildAboutSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
  return Consumer<ThemeProvider>(
    builder: (context, themeProvider, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              AppStrings.themeTitle,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          RadioGroup<ThemeMode>(
            groupValue: themeProvider.themeMode,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
              }
            },
            child: Column(
              children: [
                ListTile(
                  title: const Text(AppStrings.themeLightMode),
                  leading: const Radio<ThemeMode>(
                    value: ThemeMode.light,
                  ),
                ),
                ListTile(
                  title: const Text(AppStrings.themeDarkMode),
                  leading: const Radio<ThemeMode>(
                    value: ThemeMode.dark,
                  ),
                ),
                ListTile(
                  title: const Text(AppStrings.themeSystemMode),
                  leading: const Radio<ThemeMode>(
                    value: ThemeMode.system,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            AppStrings.aboutTitle,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ListTile(
          title: const Text(AppStrings.versionTitle),
          subtitle: const Text('1.0.0'),
          leading: const Icon(Icons.info_outline),
        ),
        ListTile(
          title: const Text(AppStrings.privacyTitle),
          leading: const Icon(Icons.privacy_tip_outlined),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            _showInfoDialog(
              context,
              AppStrings.privacyTitle,
              'Your privacy is important to us. We collect only necessary data.',
            );
          },
        ),
        ListTile(
          title: const Text(AppStrings.termsTitle),
          leading: const Icon(Icons.description_outlined),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            _showInfoDialog(
              context,
              AppStrings.termsTitle,
              'By using this app, you agree to our terms and conditions.',
            );
          },
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
