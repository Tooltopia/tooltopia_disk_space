import 'tooltopia_disk_space_platform_interface.dart';

class TooltopiaDiskSpace {
  static Future<String?> getPlatformVersion() {
    return TooltopiaDiskSpacePlatform.instance.getPlatformVersion();
  }

  static Future<double> getFreeDiskSpace() {
    return TooltopiaDiskSpacePlatform.instance.getFreeDiskSpace();
  }

  static Future<double> getTotalDiskSpace() {
    return TooltopiaDiskSpacePlatform.instance.getTotalDiskSpace();
  }

  static Future<double> getFreeDiskSpaceForPath(String path) {
    return TooltopiaDiskSpacePlatform.instance.getFreeDiskSpaceForPath(path);
  }
}
