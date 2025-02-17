package com.tooltopia.disk_space

import android.os.Environment
import android.os.StatFs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class TooltopiaDiskSpacePlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "tooltopia_disk_space")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    try {
      when (call.method) {
        "getFreeDiskSpace" -> result.success(getFreeDiskSpace())
        "getTotalDiskSpace" -> result.success(getTotalDiskSpace())
        "getFreeDiskSpaceForPath" -> {
          val path = call.argument<String>("path")
          if (path != null) {
            result.success(getFreeDiskSpaceForPath(path))
          } else {
            result.error("INVALID_PATH", "Path cannot be null", null)
          }
        }
        else -> result.notImplemented()
      }
    } catch (e: Exception) {
      result.error("DISK_SPACE_ERROR", e.message, null)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
  }

  private fun getFreeDiskSpace(): Double {
    val stat = StatFs(Environment.getExternalStorageDirectory().path)

    val bytesAvailable: Long =
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2)
                    stat.blockSizeLong * stat.availableBlocksLong
            else stat.blockSize.toLong() * stat.availableBlocks.toLong()
    return (bytesAvailable / (1024f * 1024f)).toDouble()
  }

  private fun getFreeDiskSpaceForPath(path: String): Double {
    val stat = StatFs(path)

    val bytesAvailable: Long =
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2)
                    stat.blockSizeLong * stat.availableBlocksLong
            else stat.blockSize.toLong() * stat.availableBlocks.toLong()
    return (bytesAvailable / (1024f * 1024f)).toDouble()
  }

  private fun getTotalDiskSpace(): Double {
    val stat = StatFs(Environment.getExternalStorageDirectory().path)

    val bytesAvailable: Long =
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2)
                    stat.blockSizeLong * stat.blockCountLong
            else stat.blockSize.toLong() * stat.blockCount.toLong()
    return (bytesAvailable / (1024f * 1024f)).toDouble()
  }
}
