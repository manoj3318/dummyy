import 'dart:convert';

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Stack(
                  children: [
                    TextFormField(
                      controller: _model.textController,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        Duration(milliseconds: 10),
                        () async {
                          setState(() {
                            _model.otp = _model.textController.text.length == 6;
                          });
                        },
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Enter OTP',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w600,
                                  lineHeight: 1.3,
                                ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondary,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_model.isResend)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.isResend = false;
                                  });
                                  _model.timerController.onExecute
                                      .add(StopWatchExecute.start);
                                },
                                child: Text(
                                  'Resend OTP',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFC7222A),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            if (_model.isResend == false)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Resend OTP in ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  FlutterFlowTimer(
                                    initialTime: _model.timerMilliseconds,
                                    getDisplayTime: (value) =>
                                        StopWatchTimer.getDisplayTime(
                                      value,
                                      hours: false,
                                      milliSecond: false,
                                    ),
                                    timer: _model.timerController,
                                    updateStateInterval:
                                        Duration(milliseconds: 10),
                                    onChanged:
                                        (value, displayTime, shouldUpdate) {
                                      _model.timerMilliseconds = value;
                                      _model.timerValue = displayTime;
                                      if (shouldUpdate) setState(() {});
                                    },
                                    onEnded: () async {
                                      setState(() {
                                        _model.isResend = _model.isResend;
                                      });
                                      _model.timerController.setPresetTime(
                                          mSec: 59000, add: false);
                                      _model.timerController.onExecute
                                          .add(StopWatchExecute.reset);
                                    },
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Text(
                                    's',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: true,
                        targetAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, -1.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () => FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode),
                              child: ButtonWidget(
                                hide: true,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    },
                    child: Text(
                      'Hello World',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: _model.textController.text == null ||
                          _model.textController.text == ''
                      ? null
                      : () {
                          print('Button pressed ...');
                        },
                  text: 'Button',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    disabledColor: Color(0xFFE6E6E6),
                    disabledTextColor: FlutterFlowTheme.of(context).tertiary,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.apiResulttgn = await SampleCall.call();
                      if ((_model.apiResulttgn?.succeeded ?? true)) {
                        _model.lIst = await actions.convertJsonToDataType(
                          (_model.apiResulttgn?.jsonBody ?? []),
                        );
                        setState(() {
                          FFAppState().plansList =
                              _model.lIst!.toList().cast<PlansStruct>();
                        });

                        context.pushNamed('screen');
                      }

                      setState(() {});
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
