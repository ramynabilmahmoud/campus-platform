import 'package:flutter_test/flutter_test.dart';
import 'package:main_platform/core/utils/validators.dart';

void main() {
  group('Validators.isValidNationalId', () {
    test('accepts exactly 14 digits', () {
      expect(Validators.isValidNationalId('29801011234567'), isTrue);
    });

    test('rejects wrong length or non-digits', () {
      expect(Validators.isValidNationalId('2980101123456'), isFalse);
      expect(Validators.isValidNationalId('298010112345678'), isFalse);
      expect(Validators.isValidNationalId('2980101123456a'), isFalse);
      expect(Validators.isValidNationalId(''), isFalse);
    });
  });

  group('Validators.isValidStudentCode', () {
    test('accepts exactly 8 digits', () {
      expect(Validators.isValidStudentCode('20221234'), isTrue);
    });

    test('rejects anything else', () {
      expect(Validators.isValidStudentCode('2022123'), isFalse);
      expect(Validators.isValidStudentCode('202212345'), isFalse);
      expect(Validators.isValidStudentCode('2022abcd'), isFalse);
    });
  });

  group('Validators.isValidIdentifier', () {
    test('accepts an email, a national id or a student code', () {
      expect(Validators.isValidIdentifier('student@nctu.edu.eg'), isTrue);
      expect(Validators.isValidIdentifier('29801011234567'), isTrue);
      expect(Validators.isValidIdentifier('20221234'), isTrue);
    });

    test('rejects random text', () {
      expect(Validators.isValidIdentifier('hello'), isFalse);
      expect(Validators.isValidIdentifier('12345'), isFalse);
    });
  });

  group('Validators.isValidEmailAddress', () {
    test('accepts a normal email', () {
      expect(Validators.isValidEmailAddress('ramy@example.com'), isTrue);
    });

    test('rejects text without @', () {
      expect(Validators.isValidEmailAddress('ramy.example.com'), isFalse);
    });
  });
}
