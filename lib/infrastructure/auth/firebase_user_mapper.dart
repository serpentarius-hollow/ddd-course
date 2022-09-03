import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/auth/user.dart' as i;
import '../../domain/core/value_object.dart';

extension FirebaseUserDomainX on User {
  i.User toDomain() {
    return i.User(id: UniqueId.fromString(uid));
  }
}
