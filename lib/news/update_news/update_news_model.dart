import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'update_news_widget.dart' show UpdateNewsWidget;
import 'package:flutter/material.dart';

class UpdateNewsModel extends FlutterFlowModel<UpdateNewsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'title is required';
    }

    return null;
  }

  // State field(s) for category widget.
  FormFieldController<List<String>>? categoryValueController;
  String? get categoryValue => categoryValueController?.value?.firstOrNull;
  set categoryValue(String? val) =>
      categoryValueController?.value = val != null ? [val] : [];
  // State field(s) for content widget.
  FocusNode? contentFocusNode;
  TextEditingController? contentTextController;
  String? Function(BuildContext, String?)? contentTextControllerValidator;
  String? _contentTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Content is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    contentTextControllerValidator = _contentTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    contentFocusNode?.dispose();
    contentTextController?.dispose();
  }
}
