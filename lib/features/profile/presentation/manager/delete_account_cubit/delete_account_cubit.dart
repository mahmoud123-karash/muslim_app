import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/auth/domain/repo/auth_repo.dart';
import 'delete_account_states.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountStates> {
  DeleteAccountCubit(this.authRepo) : super(InitialDeleteAccountState());
  static DeleteAccountCubit get(context) => BlocProvider.of(context);

  final AuthRepo authRepo;

  void deleteAccount() async {
    emit(LoadingDeleteAccountState());
    var result = await authRepo.deleteAccount();
    result.fold(
      (message) {
        emit(ErrorDeleteAccountState(message));
      },
      (message) {
        emit(SuccessDeleteAccountState());
      },
    );
  }
}
