import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tool_tip_model.dart';
export 'tool_tip_model.dart';

class ToolTipWidget extends StatefulWidget {
  const ToolTipWidget({Key? key}) : super(key: key);

  @override
  _ToolTipWidgetState createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget> {
  late ToolTipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToolTipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Text(
            'As per IRDAI issuance of e-Insurance Policy regulations of 2016, please provide Mobile no and OTP sent to your registered mobile number.',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
        ),
      ),
    );
  }
}
