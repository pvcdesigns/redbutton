import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'no_activity_record_model.dart';
export 'no_activity_record_model.dart';

class NoActivityRecordWidget extends StatefulWidget {
  const NoActivityRecordWidget({super.key});

  @override
  State<NoActivityRecordWidget> createState() => _NoActivityRecordWidgetState();
}

class _NoActivityRecordWidgetState extends State<NoActivityRecordWidget> {
  late NoActivityRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoActivityRecordModel());

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

    return Align(
      alignment: const AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Text(
          'No activity records found.',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ),
    );
  }
}
