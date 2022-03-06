String? validateTextField(String? value) {
  if (!(value!.isNotEmpty)) {
    return 'Field must not be empty';
  }
  return null;
}
