import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
abstract class NetworkInfo {
  bool get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  bool _isNetworkConnected = true;

  NetworkInfoImpl() {
    checkInitialConnectivity();
    getConnectivity();
  }

  checkInitialConnectivity() async {
    _isNetworkConnected = await InternetConnectionChecker().hasConnection;
  }

  getConnectivity() => Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          _isNetworkConnected = await InternetConnectionChecker().hasConnection;
        },
      );

  @override
  bool get isConnected => _isNetworkConnected;
}
