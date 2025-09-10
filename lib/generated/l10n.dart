// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `herfee`
  String get homeScreenTitle {
    return Intl.message('herfee', name: 'homeScreenTitle', desc: '', args: []);
  }

  /// `Search For Services`
  String get SearchForServices {
    return Intl.message(
      'Search For Services',
      name: 'SearchForServices',
      desc: '',
      args: [],
    );
  }

  /// `Popular Services`
  String get PopularServices {
    return Intl.message(
      'Popular Services',
      name: 'PopularServices',
      desc: '',
      args: [],
    );
  }

  /// `Featured Professionals`
  String get featuredProfessionals {
    return Intl.message(
      'Featured Professionals',
      name: 'featuredProfessionals',
      desc: '',
      args: [],
    );
  }

  /// `Professional Details`
  String get ProfessionalDetails {
    return Intl.message(
      'Professional Details',
      name: 'ProfessionalDetails',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message('About', name: 'About', desc: '', args: []);
  }

  /// `Past Work`
  String get PostWork {
    return Intl.message('Past Work', name: 'PostWork', desc: '', args: []);
  }

  /// `Profile`
  String get Profile {
    return Intl.message('Profile', name: 'Profile', desc: '', args: []);
  }

  /// `SignIn `
  String get SignIn {
    return Intl.message('SignIn ', name: 'SignIn', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `Update`
  String get Update {
    return Intl.message('Update', name: 'Update', desc: '', args: []);
  }

  /// `Enter your email address`
  String get EnterYourEmailAddress {
    return Intl.message(
      'Enter your email address',
      name: 'EnterYourEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get EnterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'EnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Password`
  String get PleaseEnterYourPassword {
    return Intl.message(
      'Please Enter Your Password',
      name: 'PleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address`
  String get PleaseEnterAnEmailAddress {
    return Intl.message(
      'Please enter an email address',
      name: 'PleaseEnterAnEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get PleaseEnterValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'PleaseEnterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email.`
  String get NoAccountFoundWithThisEmail {
    return Intl.message(
      'No account found with this email.',
      name: 'NoAccountFoundWithThisEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your email before resetting your password.`
  String get PleaseConfirmYourEmail {
    return Intl.message(
      'Please confirm your email before resetting your password.',
      name: 'PleaseConfirmYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please wait and try again.`
  String get TooManyAttempts {
    return Intl.message(
      'Too many attempts. Please wait and try again.',
      name: 'TooManyAttempts',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection and try again.`
  String get CheckYourInternet {
    return Intl.message(
      'Check your internet connection and try again.',
      name: 'CheckYourInternet',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again.`
  String get SomethingWentWrong {
    return Intl.message(
      'Something went wrong. Please try again.',
      name: 'SomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Password reset email sent successfully!`
  String get PasswordResetEmail {
    return Intl.message(
      'Password reset email sent successfully!',
      name: 'PasswordResetEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak. Please choose a stronger password.`
  String get PasswordWeak {
    return Intl.message(
      'Password is too weak. Please choose a stronger password.',
      name: 'PasswordWeak',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get AnUnexpected {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'AnUnexpected',
      desc: '',
      args: [],
    );
  }

  /// `This code has expired. Please request a new one.`
  String get otp_expired {
    return Intl.message(
      'This code has expired. Please request a new one.',
      name: 'otp_expired',
      desc: '',
      args: [],
    );
  }

  /// `The code you entered is incorrect. Please try again.`
  String get otp_incorrect {
    return Intl.message(
      'The code you entered is incorrect. Please try again.',
      name: 'otp_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email.`
  String get user_not_found {
    return Intl.message(
      'No account found with this email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Invalid request. Please try again.`
  String get invalid_request {
    return Intl.message(
      'Invalid request. Please try again.',
      name: 'invalid_request',
      desc: '',
      args: [],
    );
  }

  /// `OTP verification failed. Please try again.`
  String get OTPFailed {
    return Intl.message(
      'OTP verification failed. Please try again.',
      name: 'OTPFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an OTP`
  String get EnterOTP {
    return Intl.message(
      'Please enter an OTP',
      name: 'EnterOTP',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 6 digits`
  String get OTP6digits {
    return Intl.message(
      'OTP must be 6 digits',
      name: 'OTP6digits',
      desc: '',
      args: [],
    );
  }

  /// `OTP verified successfully!`
  String get OTPSuccessfully {
    return Intl.message(
      'OTP verified successfully!',
      name: 'OTPSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get BackToLogin {
    return Intl.message(
      'Back to Login',
      name: 'BackToLogin',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered. Please use a different email or try signing in.`
  String get ThisEmailRegistered {
    return Intl.message(
      'This email is already registered. Please use a different email or try signing in.',
      name: 'ThisEmailRegistered',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your connection and try again.`
  String get Network {
    return Intl.message(
      'Network error. Please check your connection and try again.',
      name: 'Network',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Email`
  String get ConfirmYourEmail {
    return Intl.message(
      'Confirm Your Email',
      name: 'ConfirmYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We/'ve sent a confirmation Code to:`
  String get ConfirmationCode {
    return Intl.message(
      'We/\'ve sent a confirmation Code to:',
      name: 'ConfirmationCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get ResendEmail {
    return Intl.message(
      'Resend Email',
      name: 'ResendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Success Signup`
  String get SuccessSignup {
    return Intl.message(
      'Success Signup',
      name: 'SuccessSignup',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message('Camera', name: 'Camera', desc: '', args: []);
  }

  /// `Gallery`
  String get Gallery {
    return Intl.message('Gallery', name: 'Gallery', desc: '', args: []);
  }

  /// `Permission denied`
  String get PermissionDenied {
    return Intl.message(
      'Permission denied',
      name: 'PermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `select Image Source`
  String get selectImageSource {
    return Intl.message(
      'select Image Source',
      name: 'selectImageSource',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get UserNotFound {
    return Intl.message(
      'User not found',
      name: 'UserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message('Cancel', name: 'Cancel', desc: '', args: []);
  }

  /// `Camera permission permanently denied. Please enable it in settings.`
  String get CameraPermissionPermanentlyDenied {
    return Intl.message(
      'Camera permission permanently denied. Please enable it in settings.',
      name: 'CameraPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Gallery permission permanently denied. Please enable it in settings.`
  String get GalleryPermissionPermanentlyDenied {
    return Intl.message(
      'Gallery permission permanently denied. Please enable it in settings.',
      name: 'GalleryPermissionPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image. Please try again.`
  String get ImagePickError {
    return Intl.message(
      'Failed to pick image. Please try again.',
      name: 'ImagePickError',
      desc: '',
      args: [],
    );
  }

  /// `Failed to delete image. Please try again.`
  String get DeleteImageError {
    return Intl.message(
      'Failed to delete image. Please try again.',
      name: 'DeleteImageError',
      desc: '',
      args: [],
    );
  }

  /// `User Info`
  String get UserInfo {
    return Intl.message('User Info', name: 'UserInfo', desc: '', args: []);
  }

  /// `Booking`
  String get Booking {
    return Intl.message('Booking', name: 'Booking', desc: '', args: []);
  }

  /// `Online`
  String get Online {
    return Intl.message('Online', name: 'Online', desc: '', args: []);
  }

  /// `Offline`
  String get Offline {
    return Intl.message('Offline', name: 'Offline', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
