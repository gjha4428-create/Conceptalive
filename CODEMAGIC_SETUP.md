# CodeMagic Build Configuration Guide for ConceptAlive

## 📋 Setup Instructions for CodeMagic CI/CD

### 1. Connect Repository to CodeMagic

1. Go to [CodeMagic](https://codemagic.io/)
2. Sign in with GitHub account
3. Click **"Add application"**
4. Select the `conceptalive` repository
5. Click **"Finish"**

### 2. Configure Signing Credentials

#### Android Signing Setup

1. Go to CodeMagic Dashboard → Select ConceptAlive app
2. Navigate to **Settings → Integrations**
3. Click **"Create new"** under Android signing
4. Upload your `keystore` file (or generate a new one)
5. Set the following environment variable names:
   - `KEYSTORE_PATH` - Path to your keystore
   - `KEYSTORE_PASSWORD` - Your keystore password
   - `KEY_ALIAS` - Your key alias
   - `KEY_PASSWORD` - Your key password

**To generate a new keystore:**
```bash
keytool -genkey -v -keystore release.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias conceptalive
```

#### iOS Signing Setup

1. Go to CodeMagic Dashboard → **Settings → Integrations**
2. Click **"Create new"** under iOS signing
3. Choose **"Certificate + Provisioning Profile"** option
4. Upload your:
   - iOS Distribution Certificate (`.cer`)
   - Provisioning Profile (`.mobileprovision`)
5. CodeMagic will securely store these credentials

### 3. Configure Environment Variables

1. Go to **Settings → Environment variables**
2. Add the following (optional but recommended):
   ```
   EMAIL_NOTIFICATION=your-email@example.com
   SLACK_WEBHOOK_URL=your-slack-webhook-url (optional)
   ```

### 4. Available Workflows

CodeMagic will automatically detect and run these workflows:

#### **android-release**
- Builds APK and AAB for Android
- Requires Android keystore configuration
- Artifacts: `.apk` and `.aab` files
- Duration: ~60 minutes

#### **ios-release**
- Builds iOS app
- Requires iOS signing certificates and provisioning profiles
- Artifacts: `.app` file
- Duration: ~120 minutes

#### **web-build**
- Builds web version
- No signing required
- Artifacts: `build/web/` directory
- Duration: ~30 minutes

#### **windows-build**
- Builds Windows executable
- Runs on Windows build machine
- Artifacts: Windows app files
- Duration: ~60 minutes

#### **linux-build**
- Builds Linux binary
- Installs required dependencies
- Artifacts: Linux app bundle
- Duration: ~60 minutes

#### **macos-build**
- Builds macOS app
- Requires macOS machine
- Artifacts: `.app` file
- Duration: ~60 minutes

#### **analyze-and-test**
- Runs code analysis
- Executes all tests
- Checks code formatting
- Runs on every commit
- Duration: ~30 minutes

### 5. Triggering Builds

Builds are automatically triggered on:
- ✅ Push to `main` branch
- ✅ Pull requests (for analysis workflow)
- ✅ Manual trigger from CodeMagic dashboard

### 6. Build Triggers Configuration

1. Go to **Settings → Build triggers**
2. Configure which events trigger builds:
   - **Push to branch** - Enable for `main`
   - **Pull request** - Enable for analysis
   - **Manual trigger** - Always available

### 7. Notifications

#### Email Notifications
- Configured to send on success and failure
- Update email addresses in `codemagic.yaml`

#### Slack Notifications
- Optional webhook integration
- Add `SLACK_WEBHOOK_URL` to environment variables
- Notifications on build start, success, and failure

### 8. Deployment Options

After builds complete, configure deployments:

#### **Google Play Store** (Android)
1. Go to **Settings → Integrations → Google Play**
2. Connect your Google Play Service Account
3. Enable auto-publishing in workflow

#### **Apple App Store** (iOS)
1. Go to **Settings → Integrations → App Store Connect**
2. Add your App Store Connect credentials
3. Enable auto-publishing in workflow

#### **Firebase App Distribution**
1. Go to **Settings → Integrations → Firebase**
2. Connect your Firebase project
3. Tests will be distributed to testers

### 9. Secrets Management

Store sensitive data securely:
1. Go to **Settings → Environment variables**
2. Toggle **"Secure"** for sensitive values
3. Use `$VAR_NAME` in scripts to reference variables

### 10. Troubleshooting

#### Build Fails - Flutter Not Found
```yaml
# Already configured, but if needed:
environment:
  flutter: stable  # or specific version like 3.13.0
```

#### Android Build Fails
- Verify keystore credentials
- Check Android SDK is configured
- Ensure `android/local.properties` is set correctly

#### iOS Build Fails
- Verify provisioning profiles are valid
- Check certificates are not expired
- Ensure bundle identifiers match

#### Tests Fail
- Run locally first: `flutter test`
- Check test files in `test/` directory
- Ensure mocks and fixtures are properly set up

### 11. Monitoring Builds

1. Dashboard shows real-time build status
2. View logs: **"View build logs"** button
3. Download artifacts from build details page
4. Check deployment status in **"Publish"** section

### 12. Sample Build Commands

These are already configured in `codemagic.yaml`, but here they are for reference:

```bash
# Get dependencies
flutter pub get

# Analyze code
flutter analyze

# Run tests
flutter test

# Build Android
flutter build apk --release
flutter build appbundle --release

# Build iOS
flutter build ios --release

# Build Web
flutter build web --release

# Build Windows
flutter build windows --release

# Build Linux
flutter build linux --release

# Build macOS
flutter build macos --release
```

### 13. Best Practices

✅ **Always test locally first:**
```bash
flutter clean
flutter pub get
flutter analyze
flutter test
```

✅ **Version your builds:**
- Update `version` in `pubspec.yaml` before release
- Use semantic versioning: `1.0.0+1`

✅ **Keep dependencies updated:**
```bash
flutter pub upgrade
```

✅ **Monitor build logs:**
- Check for warnings
- Fix deprecations early
- Keep eye on build duration trends

✅ **Secure your credentials:**
- Never commit keystore files
- Use CodeMagic's secure environment variables
- Rotate credentials regularly

### 14. Quick Start

```bash
# 1. Push code to GitHub
git add .
git commit -m "Initial commit"
git push origin main

# 2. Go to CodeMagic and connect repository
# 3. Configure signing credentials
# 4. Trigger first build (manual or automatic)
# 5. Monitor build progress in dashboard
# 6. Download built artifacts
```

---

## 📊 Build Status Badge

Add this badge to your README:

```markdown
[![codemagic](https://api.codemagic.io/apps/YOUR_APP_ID/branches/main/build/status_badge.svg)](https://codemagic.io/apps/YOUR_APP_ID/branches/main/build/latest)
```

Replace `YOUR_APP_ID` with your CodeMagic app ID (found in dashboard URL).

---

## 🎯 Summary

Your ConceptAlive project is **fully configured for CodeMagic**:

✅ All platform builds configured (Android, iOS, Web, Windows, Linux, macOS)
✅ Code analysis and testing included
✅ Email and Slack notifications ready
✅ Signing credentials support
✅ Deployment integrations available
✅ Environment variables configured
✅ Build artifacts properly specified

Just connect your repo to CodeMagic and start building! 🚀
