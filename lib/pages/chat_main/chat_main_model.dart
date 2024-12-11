import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/photo_valide_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'chat_main_widget.dart' show ChatMainWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatMainModel extends FlutterFlowModel<ChatMainWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in chatMain widget.
  DataDayRecord? dataDay;
  // Stores action output result for [Firestore Query - Query a collection] action in chatMain widget.
  DataDayRecord? deleteDay;
  // Stores action output result for [Firestore Query - Query a collection] action in chatMain widget.
  int? countLieu;
  // Stores action output result for [Firestore Query - Query a collection] action in chatMain widget.
  PlacesRecord? queryLieu;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for PhotoValide component.
  late PhotoValideModel photoValideModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    photoValideModel = createModel(context, () => PhotoValideModel());
  }

  void dispose() {
    photoValideModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
