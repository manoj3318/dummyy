import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/compon_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'screen_model.dart';
export 'screen_model.dart';

class ScreenWidget extends StatefulWidget {
  const ScreenWidget({
    Key? key,
    this.response,
    this.json,
  }) : super(key: key);

  final HealthInsuranceRecord? response;
  final List<dynamic>? json;

  @override
  _ScreenWidgetState createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  late ScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScreenModel());
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().plansList.length == 3) {
                      setState(() {
                        FFAppState().updateCompareAtIndex(
                          0,
                          (_) => FFAppState()
                              .plansList[FFAppState().selectedIndex],
                        );
                      });
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        isDismissible: false,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context)
                                .requestFocus(_model.unfocusNode),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ComponWidget(
                                list: FFAppState().plansList,
                              ),
                            ),
                          );
                        },
                      ).then((value) => setState(() {}));
                    } else {
                      setState(() {
                        FFAppState().compare =
                            FFAppState().plansList.toList().cast<PlansStruct>();
                      });

                      context.pushNamed(
                        'compare',
                        queryParameters: {
                          'isThreePlan': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    }
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
                  ),
                ),
                Builder(
                  builder: (context) {
                    final plans = FFAppState().plansList.toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(plans.length, (plansIndex) {
                        final plansItem = plans[plansIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                FFAppState().selectedIndex = plansIndex;
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: plansIndex == FFAppState().selectedIndex
                                    ? FlutterFlowTheme.of(context).success
                                    : FlutterFlowTheme.of(context).primary,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    plansItem.name,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    plansItem.date,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    plansItem.updates,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Text(
                                    plansItem.string,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
