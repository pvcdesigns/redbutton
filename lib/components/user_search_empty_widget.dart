import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_search_empty_model.dart';
export 'user_search_empty_model.dart';

class UserSearchEmptyWidget extends StatefulWidget {
  const UserSearchEmptyWidget({Key? key}) : super(key: key);

  @override
  _UserSearchEmptyWidgetState createState() => _UserSearchEmptyWidgetState();
}

class _UserSearchEmptyWidgetState extends State<UserSearchEmptyWidget> {
  late UserSearchEmptyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserSearchEmptyModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'inviteFriends',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
            child: Text(
              'User not found.  Please invite them to the app.',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
