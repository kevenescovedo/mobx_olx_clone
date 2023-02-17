extension StringExtension on String? {
    bool isEmailValid() {
      final RegExp regex = RegExp(
          r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
      return regex.hasMatch(this!);
    }

    String formattedPostalCode() {
      String postalCode = this!.trim().replaceAll('.', '').replaceAll('-', '');

      if (this!.length != 8)
        postalCode = (postalCode + '000').substring(0, 8);
      else
        postalCode = this!;
      return '${postalCode.substring(0, 2)}.${postalCode.substring(2, 5)}-${postalCode.substring(5, 8)}';
    }
  }


