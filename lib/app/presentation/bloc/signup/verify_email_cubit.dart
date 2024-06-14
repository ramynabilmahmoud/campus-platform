import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/presentation/bloc/signup/verify_email_state.dart';

@injectable
class VerfiyEmailCubit extends Cubit<VerifyEmailState> {
  VerfiyEmailCubit() : super(const VerifyEmailState());
}
