abstract class LocalAuthEvent {
  const LocalAuthEvent();
}

class LogOut extends LocalAuthEvent {
  const LogOut();
}

class GetAuth extends LocalAuthEvent {
  const GetAuth();
}
