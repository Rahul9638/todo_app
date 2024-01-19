class ValidateForm {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty';
    } else if (name.length < 3) {
      return 'Name must be at least 3 characters long';
    } else {
      return null;
    }
  }

  static String? validateRole(String? rolePosition) {
    if (rolePosition == null || rolePosition.isEmpty) {
      return 'Role position cannot be empty';
    } else if (rolePosition.length < 5) {
      return 'Role position must be at least 5 characters long';
    }
    return null;
  }

  static String? validateDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Date cannot be empty';
    } else {
      return null;
    }
  }
}
