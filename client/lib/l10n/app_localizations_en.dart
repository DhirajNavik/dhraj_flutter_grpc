// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get parent_and_student_portal => 'Parent & Student Portal';

  @override
  String get student_id_admission_number => 'Student ID / Admission Number';

  @override
  String get please_provide_login_id => 'Please provide login id';

  @override
  String get password => 'Password';

  @override
  String get enter_password => 'Enter Password';

  @override
  String get parent_student_sign_in_info =>
      'Use your child\'s student ID and password provided by the teacher.';

  @override
  String get staff_portal => 'Staff Portal';

  @override
  String get email_teacher_id => 'Email or Teacher ID';

  @override
  String get use_your_teacher_id => 'Use your Teacher ID (e.g., JOHN-MATH)';

  @override
  String get teacher => 'Teacher';

  @override
  String get use_your_email_address => 'Use your email address';

  @override
  String get admin => 'Admin';

  @override
  String get sign_in => 'Sign In';

  @override
  String get staff_login => 'Staff Login';

  @override
  String get parent_students => 'Parent / Student';

  @override
  String get homework_desc => 'View assigned homework and due dates';

  @override
  String past_homework(Object total_homework) {
    return 'Past Homework (total_homework)';
  }
}
