import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/enums.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';

extension ContextUtils on BuildContext {
  String get userId {
    return read<AuthenticationBloc>().state.userInfo.id;
  }

  String get userFullName {
    return read<AuthenticationBloc>().state.userInfo.fullName;
  }

  AccessLevel get accessLevel {
    return read<AuthenticationBloc>().state.userInfo.accessLevel;
  }

  Department get department {
    return read<AuthenticationBloc>().state.userInfo.department;
  }

  void popSafety<T extends Object?>([T? result]) {
    if (canPop()) {
      pop(result);
    }
  }
}
