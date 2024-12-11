import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_classement_model.dart';
export 'top_classement_model.dart';

class TopClassementWidget extends StatefulWidget {
  const TopClassementWidget({Key? key}) : super(key: key);

  @override
  _TopClassementWidgetState createState() => _TopClassementWidgetState();
}

class _TopClassementWidgetState extends State<TopClassementWidget> {
  late TopClassementModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopClassementModel());

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
        title: 'TopClassement',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
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
                      'Top Classement',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).tertiary,
                          ),
                    ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 2.0,
                )
              : null,
          body: Align(
            alignment: AlignmentDirectional(0.0, -0.99),
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                queryBuilder: (usersRecord) =>
                    usersRecord.orderBy('number_picture', descending: true),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<UsersRecord> columnUsersRecordList = snapshot.data!;
                if (columnUsersRecordList.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/noFriends@2x.png',
                      width: MediaQuery.sizeOf(context).width * 0.9,
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(columnUsersRecordList.length,
                        (columnIndex) {
                      final columnUsersRecord =
                          columnUsersRecordList[columnIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.95,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).dark900,
                                    boxShadow: [
                                      BoxShadow(
                                        color: FlutterFlowTheme.of(context)
                                            .dark900,
                                        offset: Offset(0.0, 1.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 0.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl:
                                                            valueOrDefault<
                                                                String>(
                                                          columnUsersRecord
                                                              .photoUrl,
                                                          'https://cdn-icons-png.flaticon.com/512/181/181549.png',
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      columnUsersRecord
                                                          .displayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    4.0,
                                                                    0.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            columnUsersRecord
                                                                .numberPicture
                                                                .toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.94, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            () {
                                              if (columnIndex == 0) {
                                                return 'https://cdn.discordapp.com/attachments/925487031818268715/1187040644531761203/image-removebg-preview_10.png?ex=659570bf&is=6582fbbf&hm=17540dc096c22b064223a5f359f7868ba5150b2b276e1de5691afb7a9c78ef50&';
                                              } else if (columnIndex == 1) {
                                                return 'https://cdn.discordapp.com/attachments/925487031818268715/1187040634054385745/image-removebg-preview_9.png?ex=659570bd&is=6582fbbd&hm=8b4db4e8d33ab61cd351aeca64fb146bb0d8c1500fbc76d851ea5477e7751f9d&';
                                              } else if (columnIndex == 2) {
                                                return 'https://cdn.discordapp.com/attachments/925487031818268715/1186971889776726116/image-removebg-preview_8.png?ex=659530b7&is=6582bbb7&hm=97b72c354ce8576bc45ff61510ba62fabe76bf2ac8456d4498b696fe91315e07&';
                                              } else if (columnIndex == 3) {
                                                return 'https://cdn.discordapp.com/attachments/925487031818268715/1186971889529270382/image-removebg-preview_6.png?ex=659530b7&is=6582bbb7&hm=6779510b581f4f0d388da3200112bac838e416e8a715da443f71ca2132b30cbe&';
                                              } else if (columnIndex == 4) {
                                                return 'https://cdn.discordapp.com/attachments/925487031818268715/1186971889248256082/image-removebg-preview_7.png?ex=659530b7&is=6582bbb7&hm=b702a03d23104eb93e6789caa0c0865b46eabb79d1f8a1ef18ae2b572d4852d8&';
                                              } else {
                                                return 'https://media.discordapp.net/attachments/925487031818268715/1186984505303650354/fondo_transparente_png_by_imsnowbieber_d3jme6i_by_eriiilovers_dasaqjg-fullview.png?ex=65953c77&is=6582c777&hm=997c63a8a2c241dbf4fe39fe14cd5eb03d3fb04f5f6425c185d254a63394822f&=&format=webp&quality=lossless';
                                              }
                                            }(),
                                            width: 66.0,
                                            height: 185.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
