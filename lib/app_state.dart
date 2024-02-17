import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _firstSetup = prefs.getBool('ff_firstSetup') ?? _firstSetup;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _selectedActivity = '';
  String get selectedActivity => _selectedActivity;
  set selectedActivity(String value) {
    _selectedActivity = value;
  }

  String _selectedContact = '';
  String get selectedContact => _selectedContact;
  set selectedContact(String value) {
    _selectedContact = value;
  }

  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  set sliderValue(double value) {
    _sliderValue = value;
  }

  int _timeLimitInMinutes = 0;
  int get timeLimitInMinutes => _timeLimitInMinutes;
  set timeLimitInMinutes(int value) {
    _timeLimitInMinutes = value;
  }

  int _selectedActivityTime = 0;
  int get selectedActivityTime => _selectedActivityTime;
  set selectedActivityTime(int value) {
    _selectedActivityTime = value;
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int value) {
    _timerValue = value;
  }

  bool _activityStarted = false;
  bool get activityStarted => _activityStarted;
  set activityStarted(bool value) {
    _activityStarted = value;
  }

  int _timeLimitInSeconds = 0;
  int get timeLimitInSeconds => _timeLimitInSeconds;
  set timeLimitInSeconds(int value) {
    _timeLimitInSeconds = value;
  }

  int _selectedActivityTimeinSeconds = 0;
  int get selectedActivityTimeinSeconds => _selectedActivityTimeinSeconds;
  set selectedActivityTimeinSeconds(int value) {
    _selectedActivityTimeinSeconds = value;
  }

  bool _activityIsSelected = false;
  bool get activityIsSelected => _activityIsSelected;
  set activityIsSelected(bool value) {
    _activityIsSelected = value;
  }

  bool _startNow = false;
  bool get startNow => _startNow;
  set startNow(bool value) {
    _startNow = value;
  }

  LatLng? _userLocationStart = const LatLng(-33.9248685, 18.4240553);
  LatLng? get userLocationStart => _userLocationStart;
  set userLocationStart(LatLng? value) {
    _userLocationStart = value;
  }

  LatLng? _userLocationEnd = const LatLng(-33.9248685, 18.4240553);
  LatLng? get userLocationEnd => _userLocationEnd;
  set userLocationEnd(LatLng? value) {
    _userLocationEnd = value;
  }

  DocumentReference? _newRoute;
  DocumentReference? get newRoute => _newRoute;
  set newRoute(DocumentReference? value) {
    _newRoute = value;
  }

  int _currentTimer = 60000;
  int get currentTimer => _currentTimer;
  set currentTimer(int value) {
    _currentTimer = value;
  }

  bool _searchClicked = false;
  bool get searchClicked => _searchClicked;
  set searchClicked(bool value) {
    _searchClicked = value;
  }

  bool _hasNotification = false;
  bool get hasNotification => _hasNotification;
  set hasNotification(bool value) {
    _hasNotification = value;
  }

  bool _showNotifications = false;
  bool get showNotifications => _showNotifications;
  set showNotifications(bool value) {
    _showNotifications = value;
  }

  List<String> _contactList = [];
  List<String> get contactList => _contactList;
  set contactList(List<String> value) {
    _contactList = value;
  }

  void addToContactList(String value) {
    _contactList.add(value);
  }

  void removeFromContactList(String value) {
    _contactList.remove(value);
  }

  void removeAtIndexFromContactList(int index) {
    _contactList.removeAt(index);
  }

  void updateContactListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _contactList[index] = updateFn(_contactList[index]);
  }

  void insertAtIndexInContactList(int index, String value) {
    _contactList.insert(index, value);
  }

  String _currentUserID = '';
  String get currentUserID => _currentUserID;
  set currentUserID(String value) {
    _currentUserID = value;
  }

  bool _showRequests = false;
  bool get showRequests => _showRequests;
  set showRequests(bool value) {
    _showRequests = value;
  }

  bool _noticeRead = false;
  bool get noticeRead => _noticeRead;
  set noticeRead(bool value) {
    _noticeRead = value;
  }

  int _startTime = 0;
  int get startTime => _startTime;
  set startTime(int value) {
    _startTime = value;
  }

  String _endTime = '';
  String get endTime => _endTime;
  set endTime(String value) {
    _endTime = value;
  }

  bool _showMedCard = false;
  bool get showMedCard => _showMedCard;
  set showMedCard(bool value) {
    _showMedCard = value;
  }

  bool _firstSetup = true;
  bool get firstSetup => _firstSetup;
  set firstSetup(bool value) {
    _firstSetup = value;
    prefs.setBool('ff_firstSetup', value);
  }

  int _addFiveMinutesInMilliseconds = 0;
  int get addFiveMinutesInMilliseconds => _addFiveMinutesInMilliseconds;
  set addFiveMinutesInMilliseconds(int value) {
    _addFiveMinutesInMilliseconds = value;
  }

  bool _activityNotStopped = false;
  bool get activityNotStopped => _activityNotStopped;
  set activityNotStopped(bool value) {
    _activityNotStopped = value;
  }

  bool _isWakelockEnabled = false;
  bool get isWakelockEnabled => _isWakelockEnabled;
  set isWakelockEnabled(bool value) {
    _isWakelockEnabled = value;
  }

  String _finalActivityTime = '';
  String get finalActivityTime => _finalActivityTime;
  set finalActivityTime(String value) {
    _finalActivityTime = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
