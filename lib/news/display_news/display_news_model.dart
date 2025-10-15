import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'display_news_widget.dart' show DisplayNewsWidget;
import 'package:flutter/material.dart';

class DisplayNewsModel extends FlutterFlowModel<DisplayNewsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchNews widget.
  FocusNode? searchNewsFocusNode;
  TextEditingController? searchNewsTextController;
  String? Function(BuildContext, String?)? searchNewsTextControllerValidator;
  List<NewsRecord> simpleSearchResults = [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchNewsFocusNode?.dispose();
    searchNewsTextController?.dispose();
  }
}
