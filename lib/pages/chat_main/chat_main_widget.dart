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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({Key? key}) : super(key: key);

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (functions
          .dateIsThisDay(currentUserDocument?.dayPicture?.toString())!) {
        setState(() {
          FFAppState().photoDejaPrise = true;
        });
      } else {
        setState(() {
          FFAppState().photoDejaPrise = false;
        });
      }

      // GetDataDay
      _model.dataDay = await queryDataDayRecordOnce(
        queryBuilder: (dataDayRecord) => dataDayRecord.orderBy('timeDay'),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (!((FFAppState().ImagaSearch == null ||
              FFAppState().ImagaSearch == '') ||
          (FFAppState().CoordonneeSearch == null) ||
          (FFAppState().TexteSearch == null ||
              FFAppState().TexteSearch == ''))) {
        FFAppState().update(() {
          FFAppState().ImagaSearch = _model.dataDay!.imageDay;
          FFAppState().CoordonneeSearch = _model.dataDay?.coordonneeDay;
          FFAppState().TexteSearch = _model.dataDay!.texteDay;
        });
      }
      if (_model.dataDay?.idDay != null) {
        if (functions.dateIsThisDay(_model.dataDay?.timeDay?.toString())!) {
          return;
        }
      }
      _model.deleteDay = await queryDataDayRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      await _model.deleteDay!.reference.delete();
      // CountLieu
      _model.countLieu = await queryPlacesRecordCount();
      // QueryLieu
      _model.queryLieu = await queryPlacesRecordOnce(
        queryBuilder: (placesRecord) => placesRecord.where(
          'uid_places',
          isEqualTo: random_data.randomInteger(0, _model.countLieu!),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      // SetDataDay

      await DataDayRecord.collection.doc().set(createDataDayRecordData(
            idDay: _model.queryLieu?.uidPlaces,
            timeDay: getCurrentTimestamp,
            imageDay: _model.queryLieu?.img,
            coordonneeDay: _model.queryLieu?.cordonates,
            texteDay: _model.queryLieu?.location,
          ));
      FFAppState().update(() {
        FFAppState().ImagaSearch = _model.queryLieu!.img;
        FFAppState().CoordonneeSearch = _model.queryLieu?.cordonates;
        FFAppState().TexteSearch = _model.queryLieu!.location;
      });

      await currentUserReference!.update({
        ...createUsersRecordData(
          dayPicture: FFAppState().date2,
        ),
        ...mapToFirestore(
          {
            'picture_user': FieldValue.delete(),
            'coordonee_picture': FieldValue.delete(),
          },
        ),
      });

      context.pushNamed('chatMain');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'chatMain',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  title: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'BeVannes',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                    ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 4.0,
                )
              : null,
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 390.0,
                    height: 248.0,
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              FFAppState().ImagaSearch,
                              'https://i.pinimg.com/originals/67/56/66/675666d840a9c8fa1c61eaf584ff2a50.gif',
                            ),
                            width: 192.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                FFAppState().TexteSearch,
                                'loading...',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 450.0,
                    height: 292.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          '',
                        ).image,
                      ),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -0.8),
                      child: Builder(builder: (context) {
                        final _googleMapMarker = FFAppState().CoordonneeSearch;
                        return FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) =>
                              _model.googleMapsCenter = latLng,
                          initialLocation: _model.googleMapsCenter ??=
                              FFAppState().CoordonneeSearch!,
                          markers: [
                            if (_googleMapMarker != null)
                              FlutterFlowMarker(
                                _googleMapMarker.serialize(),
                                _googleMapMarker,
                              ),
                          ],
                          markerColor: GoogleMarkerColor.red,
                          mapType: MapType.satellite,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: false,
                          showMapToolbar: false,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        );
                      }),
                    ),
                  ),
                  if (!FFAppState().photoDejaPrise)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 28.0,
                                borderWidth: 1.0,
                                buttonSize: 58.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.photo_camera,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 40.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('camera');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (FFAppState().photoDejaPrise)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: wrapWithModel(
                              model: _model.photoValideModel,
                              updateCallback: () => setState(() {}),
                              child: PhotoValideWidget(),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
