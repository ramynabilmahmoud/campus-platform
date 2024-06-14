import 'package:equatable/equatable.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_cubit.dart';

class SignUpEntity extends Equatable {
  final String? email;
  final String? fullName;
  final String? nationalId;
  final String? password;
  final SignUpRole? role;

  const SignUpEntity(
      {this.email = '',
      this.fullName = '',
      this.nationalId = '',
      this.password = '',
      this.role = SignUpRole.student});

  @override
  List<Object?> get props => [email, fullName, nationalId, password, role];
}
