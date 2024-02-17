import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'no_notifications_model.dart';
export 'no_notifications_model.dart';

class NoNotificationsWidget extends StatefulWidget {
  const NoNotificationsWidget({super.key});

  @override
  State<NoNotificationsWidget> createState() => _NoNotificationsWidgetState();
}

class _NoNotificationsWidgetState extends State<NoNotificationsWidget> {
  late NoNotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoNotificationsModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 0.0, 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Text(
          'You have no new notifications.',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      ),
    );
  }
}
