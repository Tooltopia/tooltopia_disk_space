import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tooltopia_disk_space_platform_interface.dart';

/// An implementation of [TooltopiaDiskSpacePlatform] that uses method channels.
class MethodChannelTooltopiaDiskSpace extends TooltopiaDiskSpacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tooltopia_disk_space');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<double> getFreeDiskSpace() async {
    final double? result = await methodChannel.invokeMethod('getFreeDiskSpace');
    return result ?? 0.0;
  }

  @override
  Future<double> getTotalDiskSpace() async {
    final double? result = await methodChannel.invokeMethod(
      'getTotalDiskSpace',
    );
    return result ?? 0.0;
  }

  @override
  Future<double> getFreeDiskSpaceForPath(String path) async {
    final double? result = await methodChannel.invokeMethod(
      'getFreeDiskSpaceForPath',
      {'path': path},
    );
    return result ?? 0.0;
  }
}
