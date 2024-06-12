import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@lazySingleton
class Validador {
  String? email({required String? value, required BuildContext context}) {
    if (value != null && !_isValidEmail(value)) {
      return AppLocalizations.of(context)!.enterAValidEmail;
    }
    return value!.isEmpty
        ? AppLocalizations.of(context)!.pleaseEnterAnEmailAddress
        : null;
  }

  bool _isValidEmail(String email) {
    const pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$'; // Email pattern regex
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  String? password(
      {required String? value,
      required BuildContext context,
      int minLength = 6}) {
    final errors = <String>[];

    if (value == null || value.isEmpty) {
      errors.add(AppLocalizations.of(context)!.pleaseEnterAPassword);
    } else if (value.length < minLength) {
      errors.add(
          '${AppLocalizations.of(context)!.passwordMustBeAtLeast} $minLength ${AppLocalizations.of(context)!.charactersLong}');
    }

    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()\-_=+{};:,<.>]).{8,}$');
    if (!passwordRegex.hasMatch(value!)) {
      errors.add(
        AppLocalizations.of(context)!.passwordMustContainAtLeast,
      );
    }

    return errors.isEmpty ? null : errors.join('\n');
  }
}
