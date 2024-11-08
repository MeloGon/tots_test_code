// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String MailInputValueKey = 'mailInput';
const String PasswordInputValueKey = 'passwordInput';

final Map<String, TextEditingController> _LoginViewTextEditingControllers = {};

final Map<String, FocusNode> _LoginViewFocusNodes = {};

final Map<String, String? Function(String?)?> _LoginViewTextValidations = {
  MailInputValueKey: null,
  PasswordInputValueKey: null,
};

mixin $LoginView {
  TextEditingController get mailInputController =>
      _getFormTextEditingController(MailInputValueKey);
  TextEditingController get passwordInputController =>
      _getFormTextEditingController(PasswordInputValueKey);

  FocusNode get mailInputFocusNode => _getFormFocusNode(MailInputValueKey);
  FocusNode get passwordInputFocusNode =>
      _getFormFocusNode(PasswordInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_LoginViewTextEditingControllers.containsKey(key)) {
      return _LoginViewTextEditingControllers[key]!;
    }

    _LoginViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _LoginViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_LoginViewFocusNodes.containsKey(key)) {
      return _LoginViewFocusNodes[key]!;
    }
    _LoginViewFocusNodes[key] = FocusNode();
    return _LoginViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    mailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    mailInputController.addListener(() => _updateFormData(model));
    passwordInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          MailInputValueKey: mailInputController.text,
          PasswordInputValueKey: passwordInputController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _LoginViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _LoginViewFocusNodes.values) {
      focusNode.dispose();
    }

    _LoginViewTextEditingControllers.clear();
    _LoginViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get mailInputValue => this.formValueMap[MailInputValueKey] as String?;
  String? get passwordInputValue =>
      this.formValueMap[PasswordInputValueKey] as String?;

  set mailInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({MailInputValueKey: value}),
    );

    if (_LoginViewTextEditingControllers.containsKey(MailInputValueKey)) {
      _LoginViewTextEditingControllers[MailInputValueKey]?.text = value ?? '';
    }
  }

  set passwordInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PasswordInputValueKey: value}),
    );

    if (_LoginViewTextEditingControllers.containsKey(PasswordInputValueKey)) {
      _LoginViewTextEditingControllers[PasswordInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasMailInput =>
      this.formValueMap.containsKey(MailInputValueKey) &&
      (mailInputValue?.isNotEmpty ?? false);
  bool get hasPasswordInput =>
      this.formValueMap.containsKey(PasswordInputValueKey) &&
      (passwordInputValue?.isNotEmpty ?? false);

  bool get hasMailInputValidationMessage =>
      this.fieldsValidationMessages[MailInputValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey]?.isNotEmpty ?? false;

  String? get mailInputValidationMessage =>
      this.fieldsValidationMessages[MailInputValueKey];
  String? get passwordInputValidationMessage =>
      this.fieldsValidationMessages[PasswordInputValueKey];
}

extension Methods on FormStateHelper {
  setMailInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MailInputValueKey] = validationMessage;
  setPasswordInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    mailInputValue = '';
    passwordInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      MailInputValueKey: getValidationMessage(MailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _LoginViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _LoginViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      MailInputValueKey: getValidationMessage(MailInputValueKey),
      PasswordInputValueKey: getValidationMessage(PasswordInputValueKey),
    });
