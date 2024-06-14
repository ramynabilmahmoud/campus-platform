class Validators {
  static const String regexIdentifier =
      r"^(?:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}|^\d{14}$|^\d{8}$)";

  static const String regexFullName =
      r'^[\u0600-\u06FF\s]{3,}\s[\u0600-\u06FF\s]{3,}\s[\u0600-\u06FF\s]{3,}\s[\u0600-\u06FF\s]{3,}$';

  static const String regexNationalId = r'^\d{14}$';

  static const String regexStudentCode = r'^\d{8}$';

  static const String regexEmail =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  static bool isValidIdentifier(String identifier) {
    return RegExp(regexIdentifier).hasMatch(identifier);
  }

  static bool isValidFullName(String fullName) {
    return RegExp(regexFullName).hasMatch(fullName);
  }

  static bool isValidEmailAddress(String email) {
    return RegExp(regexEmail).hasMatch(email);
  }

  static bool isValidNationalId(String id) {
    return RegExp(regexNationalId).hasMatch(id);
  }

  static bool isValidStudentCode(String code) {
    return RegExp(regexStudentCode).hasMatch(code);
  }
}
