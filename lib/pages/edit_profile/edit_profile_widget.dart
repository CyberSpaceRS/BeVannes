import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.userEmail,
    this.userDisplay,
    this.userPhoto,
  }) : super(key: key);

  final UsersRecord? userEmail;
  final UsersRecord? userDisplay;
  final DocumentReference? userPhoto;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final editProfileUsersRecord = snapshot.data!;
        return Title(
            title: 'editProfile',
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
                      leading: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 24.0,
                        ),
                      ),
                      title: Text(
                        'Editer le profil',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).tertiary,
                            ),
                      ),
                      actions: [],
                      centerTitle: false,
                      elevation: 0.0,
                    )
                  : null,
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia = await selectMedia(
                                      maxWidth: 1000.00,
                                      maxHeight: 1000.00,
                                      mediaSource: MediaSource.photoGallery,
                                      multiImage: false,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                          () => _model.isDataUploading = true);
                                      var selectedUploadedFiles =
                                          <FFUploadedFile>[];

                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                                  name: m.storagePath
                                                      .split('/')
                                                      .last,
                                                  bytes: m.bytes,
                                                  height: m.dimensions?.height,
                                                  width: m.dimensions?.width,
                                                  blurHash: m.blurHash,
                                                ))
                                            .toList();

                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        _model.isDataUploading = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                              selectedMedia.length &&
                                          downloadUrls.length ==
                                              selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile =
                                              selectedUploadedFiles.first;
                                          _model.uploadedFileUrl =
                                              downloadUrls.first;
                                        });
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload data');
                                        return;
                                      }
                                    }

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      photoUrl: _model.uploadedFileUrl,
                                    ));
                                  },
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        editProfileUsersRecord.photoUrl,
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dark-mode-chat-xk2sj6/assets/ails754ngloi/uiAvatar@2x.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 12.0, 20.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1 ??=
                                          TextEditingController(
                                        text: editProfileUsersRecord.email,
                                      ),
                                      focusNode: _model.textFieldFocusNode1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Adresse e-mail',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF3124A1),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 24.0, 16.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 12.0, 20.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2 ??=
                                          TextEditingController(
                                        text:
                                            editProfileUsersRecord.displayName,
                                      ),
                                      focusNode: _model.textFieldFocusNode2,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Nom',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF3124A1),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 24.0, 16.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 12.0, 20.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController3 ??=
                                          TextEditingController(
                                        text: editProfileUsersRecord.userRole,
                                      ),
                                      focusNode: _model.textFieldFocusNode3,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Titre',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFF3124A1),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                16.0, 24.0, 16.0, 24.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                      validator: _model.textController3Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await editProfileUsersRecord.reference
                                      .update(createUsersRecordData(
                                    email: _model.textController1.text,
                                    displayName: _model.textController2.text,
                                    photoUrl: _model.uploadedFileUrl,
                                    userRole: _model.textController3.text,
                                  ));
                                  context.pop();
                                },
                                text: 'Sauvegarder les modifications',
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
