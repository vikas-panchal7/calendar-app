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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Calendar App`
  String get calendarApp {
    return Intl.message(
      'Calendar App',
      name: 'calendarApp',
      desc: '',
      args: [],
    );
  }

  /// `Books`
  String get books {
    return Intl.message(
      'Books',
      name: 'books',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Book`
  String get book {
    return Intl.message(
      'Book',
      name: 'book',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit News`
  String get editNews {
    return Intl.message(
      'Edit News',
      name: 'editNews',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this`
  String get areYouSureYouWantToDeleteThis {
    return Intl.message(
      'Are you sure you want to delete this',
      name: 'areYouSureYouWantToDeleteThis',
      desc: '',
      args: [],
    );
  }

  /// `Are you really want to exit from app?`
  String get areYouReallyWantToExitFromApp {
    return Intl.message(
      'Are you really want to exit from app?',
      name: 'areYouReallyWantToExitFromApp',
      desc: '',
      args: [],
    );
  }

  /// `Discard changes?`
  String get discardChanges {
    return Intl.message(
      'Discard changes?',
      name: 'discardChanges',
      desc: '',
      args: [],
    );
  }

  /// `You will loose all the changes.`
  String get youWillLooseAllTheChanges {
    return Intl.message(
      'You will loose all the changes.',
      name: 'youWillLooseAllTheChanges',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add Book`
  String get addBook {
    return Intl.message(
      'Add Book',
      name: 'addBook',
      desc: '',
      args: [],
    );
  }

  /// `Add News`
  String get addNews {
    return Intl.message(
      'Add News',
      name: 'addNews',
      desc: '',
      args: [],
    );
  }

  /// `Edit Book`
  String get editBook {
    return Intl.message(
      'Edit Book',
      name: 'editBook',
      desc: '',
      args: [],
    );
  }

  /// `Add Video`
  String get addVideo {
    return Intl.message(
      'Add Video',
      name: 'addVideo',
      desc: '',
      args: [],
    );
  }

  /// `Edit Video`
  String get editVideo {
    return Intl.message(
      'Edit Video',
      name: 'editVideo',
      desc: '',
      args: [],
    );
  }

  /// `Book Title`
  String get bookTitle {
    return Intl.message(
      'Book Title',
      name: 'bookTitle',
      desc: '',
      args: [],
    );
  }

  /// `News Title`
  String get newsTitle {
    return Intl.message(
      'News Title',
      name: 'newsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `In English`
  String get inEnglish {
    return Intl.message(
      'In English',
      name: 'inEnglish',
      desc: '',
      args: [],
    );
  }

  /// `In Gujarati`
  String get inGujarati {
    return Intl.message(
      'In Gujarati',
      name: 'inGujarati',
      desc: '',
      args: [],
    );
  }

  /// `Write here...`
  String get writeHere {
    return Intl.message(
      'Write here...',
      name: 'writeHere',
      desc: '',
      args: [],
    );
  }

  /// `Choose Book`
  String get chooseBook {
    return Intl.message(
      'Choose Book',
      name: 'chooseBook',
      desc: '',
      args: [],
    );
  }

  /// `Choose File`
  String get chooseFile {
    return Intl.message(
      'Choose File',
      name: 'chooseFile',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `File format is not match`
  String get fileFormatIsNotMatch {
    return Intl.message(
      'File format is not match',
      name: 'fileFormatIsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Discard`
  String get discard {
    return Intl.message(
      'Discard',
      name: 'discard',
      desc: '',
      args: [],
    );
  }

  /// `Field is required!`
  String get fieldIsRequired {
    return Intl.message(
      'Field is required!',
      name: 'fieldIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `File is required!`
  String get fileIsRequired {
    return Intl.message(
      'File is required!',
      name: 'fileIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Add Data`
  String get addData {
    return Intl.message(
      'Add Data',
      name: 'addData',
      desc: '',
      args: [],
    );
  }

  /// `Edit Data`
  String get editData {
    return Intl.message(
      'Edit Data',
      name: 'editData',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get addImage {
    return Intl.message(
      'Add Image',
      name: 'addImage',
      desc: '',
      args: [],
    );
  }

  /// `Data is required`
  String get dataIsRequired {
    return Intl.message(
      'Data is required',
      name: 'dataIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Video Url`
  String get videoUrl {
    return Intl.message(
      'Video Url',
      name: 'videoUrl',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Donate Us`
  String get donateUs {
    return Intl.message(
      'Donate Us',
      name: 'donateUs',
      desc: '',
      args: [],
    );
  }

  /// `Social`
  String get social {
    return Intl.message(
      'Social',
      name: 'social',
      desc: '',
      args: [],
    );
  }

  /// `SHARE QR`
  String get shareQr {
    return Intl.message(
      'SHARE QR',
      name: 'shareQr',
      desc: '',
      args: [],
    );
  }

  /// `DOWNLOAD QR`
  String get downloadQr {
    return Intl.message(
      'DOWNLOAD QR',
      name: 'downloadQr',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `View on Youtube`
  String get viewOnYoutube {
    return Intl.message(
      'View on Youtube',
      name: 'viewOnYoutube',
      desc: '',
      args: [],
    );
  }

  /// `Book Deleted Successfully`
  String get bookDeletedSuccessfully {
    return Intl.message(
      'Book Deleted Successfully',
      name: 'bookDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `User List`
  String get userList {
    return Intl.message(
      'User List',
      name: 'userList',
      desc: '',
      args: [],
    );
  }

  /// `Upload Book`
  String get uploadBook {
    return Intl.message(
      'Upload Book',
      name: 'uploadBook',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `UserName`
  String get username {
    return Intl.message(
      'UserName',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Number`
  String get enterValidNumber {
    return Intl.message(
      'Enter valid Number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `In Hindi`
  String get inHindi {
    return Intl.message(
      'In Hindi',
      name: 'inHindi',
      desc: '',
      args: [],
    );
  }

  /// `Profession`
  String get profession {
    return Intl.message(
      'Profession',
      name: 'profession',
      desc: '',
      args: [],
    );
  }

  /// `View Video`
  String get viewVideo {
    return Intl.message(
      'View Video',
      name: 'viewVideo',
      desc: '',
      args: [],
    );
  }

  /// `Link`
  String get link {
    return Intl.message(
      'Link',
      name: 'link',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'gu'),
      Locale.fromSubtags(languageCode: 'hi'),
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
