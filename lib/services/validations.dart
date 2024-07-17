class Validations{

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : value.isEmpty ? 'Email is required' : null;
  }

  String? validatePassword(String? value) {
    return value!.isEmpty ? 'Password is required' : value.length<8? 'Password must be at least 8 characters long': null;
  }

  String? validateName(String? value) {
    const pattern = r'^[a-zA-Z\s]+$';
    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Name is required';
    } else if (!regex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? validateZipCode(String? value) {
    const pattern = r'^\d{5}$';
    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'ZIP code is required';
    } else if (!regex.hasMatch(value)) {
      return 'ZIP code must be exactly 5 digits';
    }
    return null;
  }

  String? validateElectricityRate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Electricity rate is required';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Enter a valid electricity rate';
    }

    return null;
  }

}