import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_model.dart';
export 'reset_model.dart';

class ResetWidget extends StatefulWidget {
  const ResetWidget({Key? key}) : super(key: key);

  @override
  _ResetWidgetState createState() => _ResetWidgetState();
}

class _ResetWidgetState extends State<ResetWidget> {
  late ResetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            color: FlutterFlowTheme.of(context).background,
            offset: Offset(0.0, 1.0),
          )
        ],
        shape: BoxShape.rectangle,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed('changePassword');
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
              child: Text(
                'Changer le mot de passe',
                style: FlutterFlowTheme.of(context).titleSmall,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.9, 0.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF95A1AC),
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
