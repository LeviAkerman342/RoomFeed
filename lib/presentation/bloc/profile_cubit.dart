import 'package:flutter_bloc/flutter_bloc.dart';

class Profile {
  final String name;
  final String username;
  final String avatarUrl;

  Profile({
    required this.name,
    required this.username,
    required this.avatarUrl,
  });
}

class ProfileCubit extends Cubit<Profile?> {
  ProfileCubit() : super(null);

  void loadProfile() {
    emit(
      Profile(
        name: 'Lucas Scott',
        username: '@lucas_scott23',
        avatarUrl: 'https://i.pravatar.cc/300?img=68',
      ),
    );
  }

  void logout() {
    emit(null);
  }
}
