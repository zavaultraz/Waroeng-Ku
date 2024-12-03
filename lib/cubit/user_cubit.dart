import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/MODELS/model.dart';
import 'package:food_app/SERVICE/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(userLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> signUp(User user, String password, {File? pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);
    if (result.value != null) {
      emit(userLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> UploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadPicturePath(pictureFile);
    if (result.value != null) {
      emit(userLoaded(
        (state as userLoaded).user.copyWith(
              picturePath: 'https://food.rtid73.com/storage/${result.value}',
            ),
      ));
    }
  }

  Future<void> signOut() async {
    ApiReturnValue<bool> result = await UserServices.logout();
    if (result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> updateProfile(User user) async {
    ApiReturnValue<User> result = await UserServices.updateProfile(user);

    if (result.value != null) {
      emit(userLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> getUser(User user)async{
    ApiReturnValue<User> result = await UserServices.getUser(user);
    if(result.value != null){
      emit(userLoaded(result.value!));
    }else{
      emit(UserLoadingFailed(result.message!));
    }

  }

}


