import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_product_widget.dart' show CreateProductWidget;
import 'package:flutter/material.dart';

class CreateProductModel extends FlutterFlowModel<CreateProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_createProductPhoto = false;
  FFUploadedFile uploadedLocalFile_createProductPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_createProductPhoto = '';

  bool isDataUploading_uploadedImage = false;
  FFUploadedFile uploadedLocalFile_uploadedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadedImage = '';

  // State field(s) for serviceName widget.
  FocusNode? serviceNameFocusNode;
  TextEditingController? serviceNameTextController;
  String? Function(BuildContext, String?)? serviceNameTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for filters widget.
  FormFieldController<List<String>>? filtersValueController;
  String? get filtersValue => filtersValueController?.value?.firstOrNull;
  set filtersValue(String? val) =>
      filtersValueController?.value = val != null ? [val] : [];
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Not a valid amount of money';
    }

    if (!RegExp('^\\d+(\\.\\d{2})?\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    priceTextControllerValidator = _priceTextControllerValidator;
  }

  @override
  void dispose() {
    serviceNameFocusNode?.dispose();
    serviceNameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();
  }
}
