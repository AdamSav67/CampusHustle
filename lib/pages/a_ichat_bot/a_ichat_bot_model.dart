import '/flutter_flow/flutter_flow_util.dart';
import 'a_ichat_bot_widget.dart' show AIchatBotWidget;
import 'package:flutter/material.dart';

class AIchatBotModel extends FlutterFlowModel<AIchatBotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for chatInput widget.
  FocusNode? chatInputFocusNode;
  TextEditingController? chatInputTextController;
  String? Function(BuildContext, String?)? chatInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    chatInputFocusNode?.dispose();
    chatInputTextController?.dispose();
  }
}
