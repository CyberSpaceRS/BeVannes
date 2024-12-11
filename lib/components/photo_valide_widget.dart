import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_valide_model.dart';
export 'photo_valide_model.dart';

class PhotoValideWidget extends StatefulWidget {
  const PhotoValideWidget({Key? key}) : super(key: key);

  @override
  _PhotoValideWidgetState createState() => _PhotoValideWidgetState();
}

class _PhotoValideWidgetState extends State<PhotoValideWidget> {
  late PhotoValideModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoValideModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 360.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Icon(
              Icons.check_circle,
              color: FlutterFlowTheme.of(context).success,
              size: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}
