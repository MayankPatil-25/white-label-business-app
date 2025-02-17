class ValidationHelper {

  static final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9@_.]{1,30}$');

  static bool isUsernameValid(String value) {
    if (value.isEmpty || value.length <= 3 || !usernameRegExp.hasMatch(value)) {
      return false;
    }
    return true;
  }
}