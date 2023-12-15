import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  set selectedActivity(String _value) {
    _selectedActivity = _value;
  }

  String _selectedContact = '';
  String get selectedContact => _selectedContact;
  set selectedContact(String _value) {
    _selectedContact = _value;
  }

  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  set sliderValue(double _value) {
    _sliderValue = _value;
  }

  int _timeLimitInMinutes = 0;
  int get timeLimitInMinutes => _timeLimitInMinutes;
  set timeLimitInMinutes(int _value) {
    _timeLimitInMinutes = _value;
  }

  int _selectedActivityTime = 0;
  int get selectedActivityTime => _selectedActivityTime;
  set selectedActivityTime(int _value) {
    _selectedActivityTime = _value;
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int _value) {
    _timerValue = _value;
  }

  bool _activityStarted = false;
  bool get activityStarted => _activityStarted;
  set activityStarted(bool _value) {
    _activityStarted = _value;
  }

  int _timeLimitInSeconds = 0;
  int get timeLimitInSeconds => _timeLimitInSeconds;
  set timeLimitInSeconds(int _value) {
    _timeLimitInSeconds = _value;
  }

  int _selectedActivityTimeinSeconds = 0;
  int get selectedActivityTimeinSeconds => _selectedActivityTimeinSeconds;
  set selectedActivityTimeinSeconds(int _value) {
    _selectedActivityTimeinSeconds = _value;
  }

  bool _activityIsSelected = false;
  bool get activityIsSelected => _activityIsSelected;
  set activityIsSelected(bool _value) {
    _activityIsSelected = _value;
  }

  bool _startNow = false;
  bool get startNow => _startNow;
  set startNow(bool _value) {
    _startNow = _value;
  }

  LatLng? _userLocationStart = LatLng(-33.9248685, 18.4240553);
  LatLng? get userLocationStart => _userLocationStart;
  set userLocationStart(LatLng? _value) {
    _userLocationStart = _value;
  }

  LatLng? _userLocationEnd = LatLng(-33.9248685, 18.4240553);
  LatLng? get userLocationEnd => _userLocationEnd;
  set userLocationEnd(LatLng? _value) {
    _userLocationEnd = _value;
  }

  DocumentReference? _newRoute;
  DocumentReference? get newRoute => _newRoute;
  set newRoute(DocumentReference? _value) {
    _newRoute = _value;
  }

  int _currentTimer = 60000;
  int get currentTimer => _currentTimer;
  set currentTimer(int _value) {
    _currentTimer = _value;
  }

  bool _searchClicked = false;
  bool get searchClicked => _searchClicked;
  set searchClicked(bool _value) {
    _searchClicked = _value;
  }

  bool _hasNotification = false;
  bool get hasNotification => _hasNotification;
  set hasNotification(bool _value) {
    _hasNotification = _value;
  }

  bool _showNotifications = false;
  bool get showNotifications => _showNotifications;
  set showNotifications(bool _value) {
    _showNotifications = _value;
  }

  List<String> _contactList = [];
  List<String> get contactList => _contactList;
  set contactList(List<String> _value) {
    _contactList = _value;
  }

  void addToContactList(String _value) {
    _contactList.add(_value);
  }

  void removeFromContactList(String _value) {
    _contactList.remove(_value);
  }

  void removeAtIndexFromContactList(int _index) {
    _contactList.removeAt(_index);
  }

  void updateContactListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _contactList[_index] = updateFn(_contactList[_index]);
  }

  void insertAtIndexInContactList(int _index, String _value) {
    _contactList.insert(_index, _value);
  }

  String _currentUserID = '';
  String get currentUserID => _currentUserID;
  set currentUserID(String _value) {
    _currentUserID = _value;
  }

  bool _showRequests = false;
  bool get showRequests => _showRequests;
  set showRequests(bool _value) {
    _showRequests = _value;
  }

  bool _noticeRead = false;
  bool get noticeRead => _noticeRead;
  set noticeRead(bool _value) {
    _noticeRead = _value;
  }

  int _startTime = 0;
  int get startTime => _startTime;
  set startTime(int _value) {
    _startTime = _value;
  }

  String _endTime = '';
  String get endTime => _endTime;
  set endTime(String _value) {
    _endTime = _value;
  }

  bool _showMedCard = false;
  bool get showMedCard => _showMedCard;
  set showMedCard(bool _value) {
    _showMedCard = _value;
  }

  bool _firstSetup = true;
  bool get firstSetup => _firstSetup;
  set firstSetup(bool _value) {
    _firstSetup = _value;
    prefs.setBool('ff_firstSetup', _value);
  }

  int _addFiveMinutesInMilliseconds = 0;
  int get addFiveMinutesInMilliseconds => _addFiveMinutesInMilliseconds;
  set addFiveMinutesInMilliseconds(int _value) {
    _addFiveMinutesInMilliseconds = _value;
  }

  bool _activityNotStopped = false;
  bool get activityNotStopped => _activityNotStopped;
  set activityNotStopped(bool _value) {
    _activityNotStopped = _value;
  }

  bool _isWakelockEnabled = false;
  bool get isWakelockEnabled => _isWakelockEnabled;
  set isWakelockEnabled(bool _value) {
    _isWakelockEnabled = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
