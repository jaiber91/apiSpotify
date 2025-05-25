import 'package:in_ports/aut_user_in_port/get_token_in_port.dart';
import 'package:out_ports/auth_user_out_port/get_token_out_port.dart';

class GetSessionTokenUseCase implements GetSessionTokenInPort {
  final SessionStorageOutPort _storageOutPort;

  GetSessionTokenUseCase(this._storageOutPort);

  @override
  Future<String?> getToken() => _storageOutPort.readToken();
}
