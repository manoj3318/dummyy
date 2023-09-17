import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'compon_model.dart';
export 'compon_model.dart';

class ComponWidget extends StatefulWidget {
  const ComponWidget({
    Key? key,
    this.list,
  }) : super(key: key);

  final List<PlansStruct>? list;

  @override
  _ComponWidgetState createState() => _ComponWidgetState();
}

class _ComponWidgetState extends State<ComponWidget> {
  late ComponModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primary,
            ),
            child: Builder(
              builder: (context) {
                final plans = widget.list?.toList() ?? [];
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(plans.length, (plansIndex) {
                      final plansItem = plans[plansIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (plansIndex != FFAppState().selectedIndex) {
                              setState(() {
                                FFAppState().selectedCompare = plansIndex;
                              });
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.ac_unit_rounded,
                                color: plansIndex == FFAppState().selectedIndex
                                    ? FlutterFlowTheme.of(context).secondary
                                    : Colors.black,
                                size: 24.0,
                              ),
                              Text(
                                plansItem.name,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: plansIndex ==
                                              FFAppState().selectedIndex
                                          ? FlutterFlowTheme.of(context)
                                              .secondary
                                          : Colors.black,
                                    ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.solidArrowAltCircleDown,
                                color: () {
                                  if (plansIndex ==
                                      FFAppState().selectedIndex) {
                                    return FlutterFlowTheme.of(context)
                                        .secondary;
                                  } else if (plansIndex ==
                                      FFAppState().selectedCompare) {
                                    return FlutterFlowTheme.of(context).warning;
                                  } else {
                                    return Colors.black;
                                  }
                                }(),
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).divide(SizedBox(height: 16.0)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: (widget.list?[FFAppState().selectedCompare]) == null
                  ? null
                  : () async {
                      setState(() {
                        FFAppState().updateCompareAtIndex(
                          1,
                          (_) => FFAppState()
                              .plansList[FFAppState().selectedCompare],
                        );
                      });
                      Navigator.pop(context);

                      context.pushNamed(
                        'compare',
                        queryParameters: {
                          'isThreePlan': serializeParam(
                            true,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
              text: 'Button',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                disabledColor: FlutterFlowTheme.of(context).primaryBackground,
                disabledTextColor: FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Button',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).accent3,
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
          ),
        ],
      ),
    );
  }
}
