// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "loading": "جارِ التحميل...",
  "close": "إغلاق",
  "plaese_wait": "الرجاء الإنتظار...",
  "auth": {
    "identifier": "الهوية",
    "identifier_helper": "البريد الإلكتروني، الرقم القومي أو كود الطالب.",
    "password": "كلمة المرور",
    "log_in": "الدخول",
    "find_student_code": "العثور على كود الطالب",
    "reset_password": "إعادة تعيين كلمة المرور",
    "or": "أو",
    "dont_have_an_account": "ألا تمتلك حساب؟ ",
    "sign_up": "تسجيل حساب",
    "identifier_error": "المعرف خاطئ، رجاءً قم بإدخال عنوان بريد إلكتروني صالح، رقمك القومي أو كود الطالب.",
    "password_error": "كلمة المرور خاطئة، تأكد من صلاحيتها وأن تكون على الأقل 6 أحرف.",
    "full_name_error": "الأسم بالكامل يجب ان يتكون من 4 أسماء على الأقل كما هي مدونة في بطاقة الهوية الخاصة بك، وتأكد من أن تكون بالعربية.",
    "full_name": "الأسم الكامل",
    "national_id": "الرقم القومي",
    "full_name_helper": "الأسم بالكامل يجب ان يكون كما هو مدون ببطاقة الهوية الخاصة بك.",
    "national_id_helper": "رقمك القومي كما هو مدون ببطاقة الهوية.",
    "email_address": "البريد الإلكتروني",
    "continue_button": "التالي",
    "already_have_account": "ألديك حساب بالفعل؟ ",
    "choose_language": "قم بإختيار لغتك المفضلة",
    "email_already_exists": "هذا البريد الإلكتروني مستخدم مسبقًا",
    "national_id_exists": "هذا الرقم القومي مستخدم مسبقًا",
    "national_id_error": "يجب ان يتكون الرقم القومي من 14 رقم",
    "email_error": "رجاءً قم بإدخال بريد إلكتروني صالح",
    "logging_in": "جارِ تسجيل الدخول...",
    "logout": "تسجيل الخروج",
    "login_failed": "خطأ في تسجيل الدخول",
    "signup_failed": "خطأ في إنشاء الحساب",
    "signup_success": "تم إنشاء حسابك",
    "signup_success_info": "يحتاج حسابك إلى إتمام خطوات إضافية، قم بتسجيل الدخول للمتابعة.",
    "roles": {
      "student": "طالب",
      "professor": "دكتور جامعي",
      "instructor": "معيد",
      "employee": "موظف"
    }
  },
  "settings": {
    "dark_mode": "المظهر الداكن",
    "dark_mode_description": "تفعيل وضع المظهر الداكن",
    "language": "اللغة",
    "language_description": "تغيير لغة التطيبق",
    "logout": "تسجيل الخروج",
    "logout_description": "قم بتسجيل الخروج من حسابك"
  },
  "nav_bar": {
    "home": "الرئيسية",
    "settings": "الإعدادات",
    "courses": "الكورسات"
  },
  "home": {
    "welcome": "مرحبًا {name},"
  },
  "failed": "فشل",
  "save": "حفظ",
  "forbidden": "ممنوع!",
  "forbidden_page": "لا تمتلك الصلاحيات الكافية للوصول إلى هذه الصفحة.",
  "add_course": {
    "title": "إضافة دورة تعليمية"
  },
  "privacy_settings": {
    "title": "اعدادات الخصوصية",
    "error": "فشل في تحميل بيانات الخصوصية الخاصة بك.",
    "private_profile": "حساب خاص",
    "private_profile_description": "منع الغير متصلين بك من رؤية المنشورات الخاصة بك.",
    "accepting_connection": "قبول الإتصالات",
    "accepting_connection_description": "قبول طلبات الإتصال من الآخرين.",
    "show_connections": "عرض عدد المتصلين",
    "show_connections_description": "عرض عدد المتصلين لديك إلى العامة.",
    "private_phone": "عرض رقم الهاتف",
    "private_phone_description": "منع الغير متصلين بك من رؤية رقم الهاتف الخاص بك، إذا تم تفعيلها الإدارة والمتصلين فقط من يمكنهم رؤية رقم هاتفك.",
    "receive_dm": "إستقبال الرسائل الخاصة",
    "receive_dm_description": "تفعيل إتسقابل الرسائل من الجميع، إذا تم إلغائها فقط الإدارة والمتصلين بك يمكنهم إرسال الرسائل إليك."
  },
  "error": {
    "unexpeceted_error": "حدث خطأ غير متوقع. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "connection_timeout": "لقد تم تجاوز الوقت المسموح للأرسال او الاستلام.",
    "unknown_error": "حدث خطأ غير معروف. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "bad_certificate": "حدث خطأ داخلي. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "connection_error": "حدث خطأ في الاتصال. الرجاء التحقق من اتصالك بالانترنت.",
    "internal_server_error": "حدث خطأ داخلي. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "not_found_error": "الأسم المطلوب غير موجود. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "unauthorized_error": "غير مصرح. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "bad_request_error": "طلب خاطئ. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "conflict_error": "تعارض. الرجاء المحاولة مرة أخرى في وقت لاحق.",
    "status_code_422": "يرجى التاكد من صحة البيانات المدخلة.",
    "error_code_101": "هذا البريد الإلكتروني او الرقم القومي مستخدمين مسبقًا.",
    "error_code_103": "بيانات تسجيل الدخول خاطئة."
  }
};
static const Map<String,dynamic> en = {
  "loading": "Loading...",
  "close": "Close",
  "plaese_wait": "Please wait...",
  "auth": {
    "identifier": "Identifier",
    "identifier_helper": "Email address, national id, or student code.",
    "password": "Password",
    "log_in": "Log in",
    "find_student_code": "Find student code",
    "reset_password": "Reset password",
    "or": "OR",
    "dont_have_an_account": "Don't have an account? ",
    "sign_up": "Sign up",
    "identifier_error": "Invalid identifier, please enter a valid email address, national id, or student code.",
    "password_error": "Invalid password, be sure the password is at least 6 characters length.",
    "full_name_error": "Your full name must be at least 4 names and must be written in Arabic.",
    "full_name": "Full Name",
    "national_id": "National ID",
    "full_name_helper": "Your full name as your national identity.",
    "national_id_helper": "Your national id number.",
    "email_address": "Email Address",
    "continue_button": "Continue",
    "already_have_account": "Already have account? ",
    "choose_language": "Choose your preferred language",
    "email_already_exists": "This email address is already used",
    "national_id_exists": "This natinoal ID is already used",
    "national_id_error": "National ID must be exactly 14-digits",
    "email_error": "Please enter a valid email address",
    "logging_in": "Logging in...",
    "logout": "Log out",
    "login_failed": "Login failed",
    "signup_failed": "Sign up failed",
    "signup_success": "Sign up success",
    "signup_success_info": "Your account needs additional steps to be completed, log in to continue.",
    "roles": {
      "student": "Student",
      "professor": "Professor",
      "instructor": "Instructor",
      "employee": "Employee"
    }
  },
  "settings": {
    "dark_mode": "Dark Mode",
    "dark_mode_description": "Enabling dark mode appearence",
    "language": "Language",
    "language_description": "Change application language",
    "logout": "Log out",
    "logout_description": "Log out from your account"
  },
  "nav_bar": {
    "home": "Home",
    "settings": "Settings",
    "courses": "Courses"
  },
  "home": {
    "welcome": "Hi {name},"
  },
  "failed": "Failed",
  "privacy_settings": {
    "title": "Privacy Settings",
    "error": "Failed to load your privacy settings.",
    "private_profile": "Private Profile",
    "private_profile_description": "Prevent who are not connected to you from seeing what you post.",
    "accepting_connection": "Accepting Connections",
    "accepting_connection_description": "Accepting connection requests from other people.",
    "show_connections": "Show connections count",
    "show_connections_description": "Show connections count on your profile.",
    "private_phone": "Private Phone",
    "private_phone_description": "Prevent who are not connected to you from seeing your phone number, if enabled only connections who can see your phone number, beside admins and staff.",
    "receive_dm": "Recieveing Direct Messages",
    "receive_dm_description": "Recieveing direct messages from everyone, if disabled only connections who can see your phone number, beside admins and staff."
  },
  "save": "Save",
  "forbidden": "Forbidden!",
  "forbidden_page": "You don't have rights to access this page.",
  "add_course": {
    "title": "Add course"
  },
  "error": {
    "unexpeceted_error": "Unexpeceted error occured. Please try again later.",
    "connection_timeout": "Timeout occured while sending or recieveing data.",
    "unknown_error": "An unknown error occured. Please try again later.",
    "bad_certificate": "An internal error occured. Please try again later.",
    "connection_error": "Connection error. Please check your internet connection.",
    "internal_server_error": "An internal server error occured. Please try again later.",
    "not_found_error": "The resource not found. Please try again later.",
    "unauthorized_error": "Unauthorized. Please try again later.",
    "bad_request_error": "Bad request. Please try again later.",
    "conflict_error": "Conflict. Please try again later.",
    "status_code_422": "Please check your data.",
    "error_code_101": "This email or national ID are already used.",
    "error_code_103": "Invalid credentials"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
