// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstnameInputValueKey = 'firstnameInput';
const String LastnameInputValueKey = 'lastnameInput';
const String EmailInputValueKey = 'emailInput';

final Map<String, TextEditingController>
    _AddClientDialogTextEditingControllers = {};

final Map<String, FocusNode> _AddClientDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _AddClientDialogTextValidations =
    {
  FirstnameInputValueKey: null,
  LastnameInputValueKey: null,
  EmailInputValueKey: null,
};

mixin $AddClientDialog {
  TextEditingController get firstnameInputController =>
      _getFormTextEditingController(FirstnameInputValueKey);
  TextEditingController get lastnameInputController =>
      _getFormTextEditingController(LastnameInputValueKey);
  TextEditingController get emailInputController =>
      _getFormTextEditingController(EmailInputValueKey);

  FocusNode get firstnameInputFocusNode =>
      _getFormFocusNode(FirstnameInputValueKey);
  FocusNode get lastnameInputFocusNode =>
      _getFormFocusNode(LastnameInputValueKey);
  FocusNode get emailInputFocusNode => _getFormFocusNode(EmailInputValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddClientDialogTextEditingControllers.containsKey(key)) {
      return _AddClientDialogTextEditingControllers[key]!;
    }

    _AddClientDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddClientDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddClientDialogFocusNodes.containsKey(key)) {
      return _AddClientDialogFocusNodes[key]!;
    }
    _AddClientDialogFocusNodes[key] = FocusNode();
    return _AddClientDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstnameInputController.addListener(() => _updateFormData(model));
    lastnameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstnameInputController.addListener(() => _updateFormData(model));
    lastnameInputController.addListener(() => _updateFormData(model));
    emailInputController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstnameInputValueKey: firstnameInputController.text,
          LastnameInputValueKey: lastnameInputController.text,
          EmailInputValueKey: emailInputController.text,
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

    for (var controller in _AddClientDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddClientDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _AddClientDialogTextEditingControllers.clear();
    _AddClientDialogFocusNodes.clear();
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

  String? get firstnameInputValue =>
      this.formValueMap[FirstnameInputValueKey] as String?;
  String? get lastnameInputValue =>
      this.formValueMap[LastnameInputValueKey] as String?;
  String? get emailInputValue =>
      this.formValueMap[EmailInputValueKey] as String?;

  set firstnameInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstnameInputValueKey: value}),
    );

    if (_AddClientDialogTextEditingControllers.containsKey(
        FirstnameInputValueKey)) {
      _AddClientDialogTextEditingControllers[FirstnameInputValueKey]?.text =
          value ?? '';
    }
  }

  set lastnameInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastnameInputValueKey: value}),
    );

    if (_AddClientDialogTextEditingControllers.containsKey(
        LastnameInputValueKey)) {
      _AddClientDialogTextEditingControllers[LastnameInputValueKey]?.text =
          value ?? '';
    }
  }

  set emailInputValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailInputValueKey: value}),
    );

    if (_AddClientDialogTextEditingControllers.containsKey(
        EmailInputValueKey)) {
      _AddClientDialogTextEditingControllers[EmailInputValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstnameInput =>
      this.formValueMap.containsKey(FirstnameInputValueKey) &&
      (firstnameInputValue?.isNotEmpty ?? false);
  bool get hasLastnameInput =>
      this.formValueMap.containsKey(LastnameInputValueKey) &&
      (lastnameInputValue?.isNotEmpty ?? false);
  bool get hasEmailInput =>
      this.formValueMap.containsKey(EmailInputValueKey) &&
      (emailInputValue?.isNotEmpty ?? false);

  bool get hasFirstnameInputValidationMessage =>
      this.fieldsValidationMessages[FirstnameInputValueKey]?.isNotEmpty ??
      false;
  bool get hasLastnameInputValidationMessage =>
      this.fieldsValidationMessages[LastnameInputValueKey]?.isNotEmpty ?? false;
  bool get hasEmailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey]?.isNotEmpty ?? false;

  String? get firstnameInputValidationMessage =>
      this.fieldsValidationMessages[FirstnameInputValueKey];
  String? get lastnameInputValidationMessage =>
      this.fieldsValidationMessages[LastnameInputValueKey];
  String? get emailInputValidationMessage =>
      this.fieldsValidationMessages[EmailInputValueKey];
}

extension Methods on FormStateHelper {
  setFirstnameInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstnameInputValueKey] = validationMessage;
  setLastnameInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastnameInputValueKey] = validationMessage;
  setEmailInputValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailInputValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstnameInputValue = '';
    lastnameInputValue = '';
    emailInputValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstnameInputValueKey: getValidationMessage(FirstnameInputValueKey),
      LastnameInputValueKey: getValidationMessage(LastnameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddClientDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddClientDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstnameInputValueKey: getValidationMessage(FirstnameInputValueKey),
      LastnameInputValueKey: getValidationMessage(LastnameInputValueKey),
      EmailInputValueKey: getValidationMessage(EmailInputValueKey),
    });
