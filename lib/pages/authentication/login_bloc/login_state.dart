class LoginState {
  final String username;
  final String password;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
   String? errorUsernameText;
   String? errorPasswordText;

   LoginState({
    this.username = '',
    this.password = '',
    this.isUsernameValid = false,
    this.isPasswordValid = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorUsernameText,
    this.errorPasswordText
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isUsernameValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? errorUsernameText,
    String? errorPasswordText
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorUsernameText: errorUsernameText,
      errorPasswordText: errorPasswordText
    );
  }

  @override
  List<Object> get props => [
    username,
    password,
    isUsernameValid,
    isPasswordValid,
    isSubmitting,
    isSuccess,
    isFailure,
  ];
}
