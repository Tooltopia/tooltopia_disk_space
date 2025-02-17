import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tooltopia_disk_space_method_channel.dart';

abstract class TooltopiaDiskSpacePlatform extends PlatformInterface {
  /// Constructs a TooltopiaDiskSpacePlatform.
  TooltopiaDiskSpacePlatform() : super(token: _token);

  static final Object _token = Object();

  static TooltopiaDiskSpacePlatform _instance =
      MethodChannelTooltopiaDiskSpace();

  /// The default instance of [TooltopiaDiskSpacePlatform] to use.
  ///
  /// Defaults to [MethodChannelTooltopiaDiskSpace].
  static TooltopiaDiskSpacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TooltopiaDiskSpacePlatform] when
  /// they register themselves.
  static set instance(TooltopiaDiskSpacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<double> getFreeDiskSpace() {
    throw UnimplementedError('getFreeDiskSpace() has not been implemented.');
  }

  Future<double> getTotalDiskSpace() {
    throw UnimplementedError('getTotalDiskSpace() has not been implemented.');
  }

  Future<double> getFreeDiskSpaceForPath(String path) {
    throw UnimplementedError(
      'getFreeDiskSpaceForPath() has not been implemented.',
    );
  }
}
