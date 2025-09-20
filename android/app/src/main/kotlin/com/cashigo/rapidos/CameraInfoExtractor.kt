package com.cashigo.rapidos

import android.content.Context
import android.graphics.ImageFormat
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.hardware.camera2.CaptureRequest
import android.util.Size
import kotlin.math.atan
import kotlin.math.sqrt


object CameraInfoExtractor {

    /**
     * 获取设备所有摄像头的硬件规格信息
     * @return
     */
    fun fetchCameraSpecs(context: Context): List<Map<String, Any?>> {
        val cameraManager =
            context.applicationContext.getSystemService(Context.CAMERA_SERVICE) as? CameraManager
                ?: return emptyList()

        return try {
            cameraManager.cameraIdList.mapNotNull { cameraId ->
                val characteristics = cameraManager.getCameraCharacteristics(cameraId)
                buildCameraSpecMap(characteristics)
            }
        } catch (e: Exception) {
            e.printStackTrace()
            emptyList()
        }
    }

    private fun buildCameraSpecMap(
        characteristics: CameraCharacteristics
    ): Map<String, Any?> {

        //i1u636(o_aperture)
        //string
        //可选
        //Camera_aperture
        //
        //jcqdnv(o_facing)
        //string
        //可选
        //Camera_facing
        //
        //flash
        //可选
        //Camera_flash
        //
        //uveitis(o_focalLength)
        //string
        //可选
        //Camera_focalLength
        //
        //level
        //string
        //可选
        //Camera_level
        //
        //w08yy9(o_pixelSize)
        //string
        //可选
        //Camera_pixelSize
        //


        //tobacco(o_viewAngle)
        //string
        //可选
        //Camera_viewAngle
        return mapOf(
            "position" to getLensPosition(characteristics),
            //discern(o_resolution)
            "discern" to getMaxResolution(characteristics)?.let { "${it.width}x${it.height}" },
            "pixelSize" to calcuPixelSizex(characteristics),
            "apertureRange" to getApertureValues(characteristics),
            // //l9t1fn(o_sensorSize)
            "l9t1fn" to getSensorDimensions(characteristics),
            "focalLengths" to getFocalLengths(characteristics),
            ////yb5fus(o_afModes)
            "yb5fus" to getAutoFocusModes(characteristics),
            "fieldOfView" to calculateFieldOfView(characteristics),
            "flashSupported" to isFlashSupported(characteristics),
            "capabilityLevel" to getHardwareLevel(characteristics)
        )
    }

    // 相机位置（前置/后置/外接）
    private fun getLensPosition(chars: CameraCharacteristics): String {
        return when (chars.get(CameraCharacteristics.LENS_FACING)) {
            CameraCharacteristics.LENS_FACING_FRONT -> "FRONT"
            CameraCharacteristics.LENS_FACING_BACK -> "BACK"
            CameraCharacteristics.LENS_FACING_EXTERNAL -> "EXTERNAL"
            else -> "UNKNOWN"
        }
    }

    // 获取最大JPEG分辨率
    private fun getMaxResolution(chars: CameraCharacteristics): Size? {
        val configMap =
            chars.get(CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP) ?: return null
        return configMap.getOutputSizes(ImageFormat.JPEG)?.maxByOrNull { it.width * it.height }
    }

    // 计算像素尺寸
    private fun calcuPixelSizex(chars: CameraCharacteristics): String? {
        val sensorSize = chars.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE) ?: return null
        val maxResolution = getMaxResolution(chars) ?: return null

        val sensorA = sensorSize.width * sensorSize.height
        val pixelCount = maxResolution.width * maxResolution.height.toFloat()
        val pixelArea = sqrt((sensorA * 1000_000) / pixelCount)

        return "%.2f".format(pixelArea)
    }


    // 获取可用光圈值
    private fun getApertureValues(chars: CameraCharacteristics): String? {
        val apertures =
            chars.get(CameraCharacteristics.LENS_INFO_AVAILABLE_APERTURES) ?: return null
        return apertures
            .filter { it > 0 }
            .joinToString(" ") { "f/${it}" }
    }

    // 传感器物理尺寸
    private fun getSensorDimensions(chars: CameraCharacteristics): String? {
        val size = chars.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE) ?: return null
        return "%.2f×%.2f".format(size.width, size.height)
    }

    // 可用焦距列表
    private fun getFocalLengths(chars: CameraCharacteristics): String? {
        val lengths =
            chars.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS) ?: return null
        return lengths.joinToString(",") { "${it}mm" }
    }

    // 自动对焦模式
    private fun getAutoFocusModes(chars: CameraCharacteristics): String {
        val modes = chars.get(CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES) ?: return ""
        val modeNames = modes.distinct().mapNotNull { afMode ->
            when (afMode) {
                CaptureRequest.CONTROL_AF_MODE_OFF -> "infinity"
                CaptureRequest.CONTROL_AF_MODE_AUTO -> "auto"
                CaptureRequest.CONTROL_AF_MODE_MACRO -> "macro"
                CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_VIDEO -> "continuous_video"
                CaptureRequest.CONTROL_AF_MODE_CONTINUOUS_PICTURE -> "continuous_picture"
                CaptureRequest.CONTROL_AF_MODE_EDOF -> "edof"
                else -> null
            }
        }.toSet()

        // 添加固定对焦模式检测
        val isFixedFocus = chars.get(CameraCharacteristics.LENS_INFO_MINIMUM_FOCUS_DISTANCE) == 0f
        val allModes = modeNames + if (isFixedFocus) setOf("fixed") else emptySet()

        return allModes.joinToString(",  ")
    }

    // 计算视角（水平方向）
    private fun calculateFieldOfView(chars: CameraCharacteristics): String? {
        val focalLengths = chars.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS)
        val sensorSize = chars.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE)

        if (focalLengths == null || sensorSize == null) return null

        val minFocalLength = focalLengths.minOrNull() ?: return null
        val sensorWidth = sensorSize.width

        if (sensorWidth <= 0) return null

        val fovRad = 2 * atan(sensorWidth / (2 * minFocalLength))
        val fovDeg = Math.toDegrees(fovRad.toDouble())

        return "%.1f°".format(fovDeg)
    }

    // 闪光灯支持检测
    private fun isFlashSupported(chars: CameraCharacteristics): Boolean {
        return chars.get(CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
    }

    // 硬件能力等级
    private fun getHardwareLevel(chars: CameraCharacteristics): String {
        return when (chars.get(CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL)) {
            CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL_LIMITED -> "limited"
            CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL_FULL -> "full"
            CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL_LEGACY -> "legacy"
            CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL_3 -> "level3"
            CameraCharacteristics.INFO_SUPPORTED_HARDWARE_LEVEL_EXTERNAL -> "external"
            else -> "unknown"
        }
    }
}
