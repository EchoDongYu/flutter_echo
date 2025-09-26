package com.cashigo.rapidos

import android.annotation.SuppressLint
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.res.Resources
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.location.Location
import android.location.LocationManager
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.wifi.WifiManager
import android.os.BatteryManager
import android.os.Build
import android.os.Environment
import android.os.StatFs
import android.os.SystemClock
import android.provider.Settings
import android.provider.Telephony
import android.telephony.TelephonyManager
import android.util.Log
import androidx.core.location.LocationManagerCompat
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.suspendCancellableCoroutine
import kotlinx.coroutines.withContext
import java.io.File
import java.net.Inet4Address
import java.net.Inet6Address
import java.net.NetworkInterface
import java.util.Collections
import java.util.Enumeration
import java.util.Locale
import java.util.TimeZone
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.CountDownLatch
import kotlin.coroutines.resume
import kotlin.math.roundToLong


/**
 * 风控数据工具类
 */
class RiskUtils(private val context: Context) {

    private val appWifiManager: WifiManager? = getWifiManager(context)
    private val appActivityManager: ActivityManager? = getActivityManager(context)
    private val appTelephonyManager: TelephonyManager? = getTelephonyManager(context)

    //  private wifiManage
    private val appBatteryManager by lazy { context.getSystemService(Context.BATTERY_SERVICE) as? BatteryManager? }

    private val appConnectNetManager by lazy { context.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager? }


    suspend fun getRiskInfo(): Map<String, Any?> {

        //raia(o_userGid)
        //string
        //用户Gid
        //必需
        //z775ud(o_appVersion)
        //string
        //app版本号
        //可选
        //hk4762(o_uploadTime)

        val riskMap = mutableMapOf<String, Any?>()
        //fibula(o_reportBaseInfo) 基础信息 ,ReportBaseInfo

        riskMap["raia"] = ""
        riskMap["z775ud"] = ""
        riskMap["hk4762"] = System.currentTimeMillis() / 1000

        riskMap["fibula"] = basicInfo()

        //jx3w61(o_appList) APP列表 ,AppInfo
        riskMap["jx3w61"] = AppListFilter.getAppFilterList(context)

        //banally(o_reportDevDTO) 设备信息
        riskMap["banally"] = deviceInformation()

        //frco(o_smsItems)
        riskMap["frco"] = SmsFilterUtils.getFilterSms(context)


        //silane(o_reportGyroDTO)
        riskMap["silane"] = captureGyroscopeReadings(context, 900)
        return riskMap
    }

    //设备信息
    private fun deviceInformation(): Any {

        val strengthAndLevel = getSignalStrengthAndLevel()
        val deviceInfoMap = HashMap<String, Any?>()
        //hafiz(o_rootPlus) root检测 不能要
        deviceInfoMap["hafiz"] = null
        //蓝牙信息 ,Bluetooth
        deviceInfoMap["i39296"] = null
        //相机信息 ,Camera
        deviceInfoMap["costing"] = CameraInfoExtractor.fetchCameraSpecs(context)

        //cpu信息
        deviceInfoMap["cpu"] = cpuInformation()

        // slqri6(o_general)  整体信息
        deviceInfoMap["slqri6"] = generalInformation()

        //r6i83k(o_netSignal) 网络信号
        deviceInfoMap["r6i83k"] = mapOf<String, Any?>(
            // lope(o_ipv6)
            "lope" to findFirstNonLoopbackIPv6Address(),
            //NetSignal_level
            "level" to strengthAndLevel.second,
            // s3zh03(o_linkSpeed)
            "s3zh03" to appWifiManager?.connectionInfo?.linkSpeed,
            //  oj1h5m(o_rssi)
            "oj1h5m" to strengthAndLevel.first


        )
        //autumnal(o_sensors) 传感器 ,Sensor
        deviceInfoMap["autumnal"] = null

        // hdcopy(o_battery) 电池信息
        deviceInfoMap["hdcopy"] = chargeBattery()

        //system  系统信息
//        deviceInfoMap["system"] = mapOf<String, Any?>(
//            //sooth(o_buildTags)
//            "sooth" to Build.TAGS,
//            //jm63g1(o_buildType)
//            "jm63g1" to Build.TYPE,
//            //turreted(o_builder)
//            "turreted" to Build.USER,
//            //inflump(o_density)
//            "turreted" to Resources.getSystem().displayMetrics.density,
//        )
        //e3d40e(o_structure) build类信息
        deviceInfoMap["e3d40e"] = mapOf<String, Any?>(

            // id Structure_id
            "id" to Build.ID,
            /// display Structure_display
            "display" to Build.DISPLAY,
            // is9q37(o_product)
            "is9q37" to Build.PRODUCT,
            //attica(o_device)
            "attica" to Build.DEVICE,
            //board
            "board" to Build.BOARD,
            //everwho(o_bootloader)
            "everwho" to Build.BOOTLOADER,
            //radio
            "radio" to Build.RADIO,
            //r2exwn(o_hardware)
            "r2exwn" to Build.HARDWARE,

            //el986r(o_structVersion)

            "el986r" to mapOf<String, Any?>(
                // os StructVersion_os
                "os" to Build.VERSION.RELEASE,
                //busses(o_codename)
                "busses" to Build.VERSION.CODENAME,
                //q8cy5m(o_incremental)
                "q8cy5m" to Build.VERSION.INCREMENTAL,
                //dinah(o_preview_sdk_int)
                "dinah" to Build.VERSION.PREVIEW_SDK_INT,
                //iz962s(o_release_or_codename)
                "iz962s" to if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    Build.VERSION.RELEASE_OR_CODENAME
                } else {
                    null
                },
                //qx7tsk(o_security_patch)
                "qx7tsk" to Build.VERSION.SECURITY_PATCH,
            ),
            //geegaw(o_fingerprint)
            "geegaw" to null,
        )

        //h4878c(o_language) 手机语言
        deviceInfoMap["h4878c"] = Locale.getDefault().language
        //jp689u(o_timeZone)   手机时区
        deviceInfoMap["jp689u"] = TimeZone.getDefault().run {
            "${getDisplayName(false, TimeZone.SHORT)},$id"
        }
        return deviceInfoMap
    }


    /**
     * 获取当前电池信息
     * @param context Context对象
     * @return BatteryInfo 包含电池状态信息的封装类
     */
    fun chargeBattery(): Any? {
        return runCatching {
            val generalInfoMap = HashMap<String, Any?>()
            val intent = context.registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            val temperature = intent?.getIntExtra(BatteryManager.EXTRA_TEMPERATURE, -1) ?: -1


            val displayTemp = if (temperature != -1) {
                // 转换为摄氏度：除以10.0，保留一位小数
                "%.1f°C".format(temperature / 10.0)
            } else {
                "0.0°C"
            }

            //yard(o_health)
            generalInfoMap["yard"] =
                chargeBatteryHealth(intent?.getIntExtra(BatteryManager.EXTRA_HEALTH, -1) ?: -1)
            //yr0nx3(o_power)
            generalInfoMap["yr0nx3"] =
                getFormattedBatteryCapacity()
            // Battery_status
            generalInfoMap["status"] =
                chargeBatteryStatus(intent?.getIntExtra(BatteryManager.EXTRA_STATUS, -1) ?: -1)
            //k54oy6(o_temperature)
            generalInfoMap["k54oy6"] = displayTemp
            generalInfoMap
        }.getOrDefault { null }

    }

    private fun chargeBatteryStatus(type: Int): String {
        return runCatching {
            when (type) {
                BatteryManager.BATTERY_STATUS_CHARGING -> "charging"
                BatteryManager.BATTERY_STATUS_DISCHARGING -> "disCharging"
                BatteryManager.BATTERY_STATUS_NOT_CHARGING -> "notCharging"
                BatteryManager.BATTERY_STATUS_FULL -> "full"
                else -> "unknown"
            }
        }.getOrDefault("unknown")
    }

    private fun chargeBatteryHealth(type: Int): String {
        return runCatching {
            when (type) {
                BatteryManager.BATTERY_HEALTH_GOOD -> "good"
                BatteryManager.BATTERY_HEALTH_OVERHEAT -> "overheat"
                BatteryManager.BATTERY_HEALTH_DEAD -> "dead"
                BatteryManager.BATTERY_HEALTH_OVER_VOLTAGE -> "overVoltage"
                BatteryManager.BATTERY_HEALTH_COLD -> "cold"
                BatteryManager.BATTERY_HEALTH_UNSPECIFIED_FAILURE -> "healthBat"
                else -> "unknown"
            }
        }.getOrDefault("unknown")
    }

    /**
     * 获取格式化后的电池总容量（单位：mAh）
     * 通过系统 BatteryManager 计算当前电池总容量
     */
    private fun getFormattedBatteryCapacity(): String {
        return runCatching { calculateBatteryCapacityInMah(context) }
            .getOrDefault(0.0)
            .formatToSingleDecimal()
    }

    /**
     * 计算电池总容量（单位：mAh）
     * @return 电池总容量（毫安时），计算失败时返回 0.0
     */
    private fun calculateBatteryCapacityInMah(context: Context): Double {
        val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager

        // 获取当前电量百分比 (0-100)
        val batteryPercentage =
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY).takeIf {
                it != Int.MIN_VALUE && it > 0
            } ?: return 0.0

        // 获取当前剩余容量 (单位：微安时 μAh)
        val remainingCapacityMicroAh =
            batteryManager.getLongProperty(BatteryManager.BATTERY_PROPERTY_CHARGE_COUNTER).takeIf {
                it != Long.MIN_VALUE && it > 0
            } ?: return 0.0

        // 计算总容量 = (当前容量 / 当前百分比) * 100
        return (remainingCapacityMicroAh * 100.0 / batteryPercentage) / 1000.0
    }

    // 扩展函数：Double 转保留一位小数的字符串
    private fun Double.formatToSingleDecimal() = "%.1f".format(this)

    private fun generalInformation(): Any {
        val generalInfoMap = HashMap<String, Any?>()

        //brightness    General_brightness
        generalInfoMap["brightness"] = getBrightness()
        //d424a6(o_haveIntent)
        generalInfoMap["d424a6"] = isMobileDataActive()
        //diffuse(o_internalAvailableSize)
        generalInfoMap["diffuse"] = String.format("%.2f", getAvailableInternalStorageKB())
        //iunjms(o_internalTotalSize)
        generalInfoMap["iunjms"] = String.format("%.2f", getTotalInternalStorageKB())
        //bjf1iv(o_wifiRouterMac)
        generalInfoMap["bjf1iv"] = null
        //discern(o_resolution)
        generalInfoMap["discern"] = discern()
        //adjoint(o_isHotspotEnabled)
        generalInfoMap["adjoint"] = runTry {
            appWifiManager?.isWifiEnabled
        }
        return generalInfoMap

    }


    /**
     * 获取当前连接网络的信号强度
     *
     * @return Pair<信号强度(dBm), 信号级别(0-4)>，无法获取时返回(-1, -1)
     */
    fun getSignalStrengthAndLevel(): Pair<Int, Int> {
        return runCatching {
            when (appConnectNetManager?.activeNetworkInfo?.type) {
                ConnectivityManager.TYPE_WIFI -> getWiFiSignalData()
                ConnectivityManager.TYPE_MOBILE -> getCellularSignalData()
                else -> null
            } ?: (-1 to -1)
        }.getOrDefault(-1 to -1)
    }


    /**
     * 获取WiFi信号强度和级别
     */
    private fun getWiFiSignalData(): Pair<Int, Int> {
        val rssi = appWifiManager?.connectionInfo?.rssi ?: return -1 to -1
        return rssi to WifiManager.calculateSignalLevel(rssi, 5)
    }


    /**
     * 获取蜂窝网络信号数据
     */
    private fun getCellularSignalData(): Pair<Int, Int> {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            val level =
                appTelephonyManager?.signalStrength?.cellSignalStrengths?.firstOrNull()?.level ?: 0
            return level to level
        }

        return -1 to -1
    }

    private fun discern(): String {
        return Resources.getSystem().displayMetrics.run { "${widthPixels}x${heightPixels}" }
    }

    private fun getBrightness(): Int {
        return runTry {
            Settings.System.getInt(
                context.contentResolver, Settings.System.SCREEN_BRIGHTNESS
            )
        } ?: -1
    }


    private fun getAvailableInternalStorageKB(): Double {

        return runTry {
            val storageStats = StatFs(Environment.getDataDirectory().path)
            storageStats.availableBytes / StorageUnit.GB
        } ?: 0.0

    }

    private fun getTotalInternalStorageKB(): Double {

        return runTry {
            val stat = StatFs(Environment.getDataDirectory().path)
            stat.totalBytes / StorageUnit.GB
        } ?: 0.0

    }

    private object StorageUnit {
        const val KB = 1024 * 1.0
        const val MB = KB * 1024 * 1.0
        const val GB = MB * 1024 * 1.0
    }

    private fun isMobileDataActive(): Boolean {
        val connectivityService = appConnectNetManager ?: return false
        return runTry {
            connectivityService.activeNetwork?.let { activeNetwork ->
                connectivityService.getNetworkCapabilities(activeNetwork)
                    ?.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) == true
            }
        } ?: false
    }

    private fun cpuInformation(): Map<String, String?> {
        val specifications = mutableMapOf<String, String?>()

        // 读取 CPU 基础信息
        readProcCpuInfo(specifications)

        // 读取 CPU 频率信息
        readCpuFrequency(specifications)

        return specifications
    }

    private fun readProcCpuInfo(specs: MutableMap<String, String?>) {
        runCatching {
            File("/proc/cpuinfo").bufferedReader().use { reader ->
                var coreCount = 0
                var currentFreq = ""
                var hardwareInfo = ""

                reader.lineSequence().forEach { line ->
                    when {
                        line.startsWith("processor") -> coreCount++
                        line.startsWith("cpu  MHz") && currentFreq.isEmpty() ->
                            currentFreq = line.substringAfter(":").trim()

                        line.startsWith("Hardware") && hardwareInfo.isEmpty() ->
                            hardwareInfo = line.substringAfter(":").trim()
                    }
                }

                specs.apply {
                    put("cores", coreCount.toString())
                    if (currentFreq.isNotEmpty()) put("zamboni", currentFreq)
                    if (hardwareInfo.isNotEmpty()) put("r2exwn", hardwareInfo)
                }
            }
        }.onFailure {
            it.printStackTrace()
        }
    }

    private fun readCpuFrequency(specs: MutableMap<String, String?>) {
        val frequencyFiles = mapOf(
            "amortise" to "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq",
            "fe5d62" to "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"
        )

        frequencyFiles.forEach { (key, path) ->
            runCatching {
                File(path).bufferedReader().use { reader ->
                    reader.readLine()?.trim()?.takeIf { it.isNotEmpty() }?.let {
                        specs[key] = it
                    }
                }
            }.onFailure {
                // 实际项目中应添加日志记录
                it.printStackTrace()
            }
        }
    }


    /**
     * 获取基础信息
     */
    private fun basicInfo(): Any {

        val memoryInfo = ActivityManager.MemoryInfo()
        appActivityManager?.getMemoryInfo(memoryInfo)
        val basicInfoMap = HashMap<String, Any?>()

        //wifi 名称
        basicInfoMap["h0390b"] = null
        //ip地址
        basicInfoMap["alack"] = ""
        //mac地址
        basicInfoMap["qiana"] = getWifiMacAddress(appWifiManager)
        //设备号
        basicInfoMap["trj8s6"] = getAndroidId()
        //bssid
        basicInfoMap["novelly"] = getWifiBssid(appWifiManager)
        //p4fv8o(o_memory) 手机内存存储(kb
        basicInfoMap["p4fv8o"] = (memoryInfo.totalMem.toDouble() / 1024).roundToLong()
        //yr0nx3(o_power) 手机剩余电量
        basicInfoMap["yr0nx3"] =
            appBatteryManager?.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        //illth(o_brand) 手机品牌
        basicInfoMap["illth"] = Build.BRAND
        //lawfully(o_sysVersion) 系统版本号
        basicInfoMap["lawfully"] = Build.VERSION.RELEASE
        //r307x2(o_netType) 网络类型
        basicInfoMap["r307x2"] = netType()
        //acetylco(o_geolocation) GPS地理位置信息
        basicInfoMap["acetylco"] = fetchDeviceLocation(context)
        //sodalist(o_deviceInfo) 设备信息
        basicInfoMap["sodalist"] = getAndroidId()
        //model 设备型号
        basicInfoMap["model"] = Build.MODEL
        //root 是否root
        //  basicInfoMap["root"] = hasRoot()

        //wb8jk2(o_emulator) 是否模拟器（0=否，1=是）
        //  basicInfoMap["wb8jk2"] = hasEmulator()
        //anil(o_mid) 设备唯一标识
        basicInfoMap["anil"] = getAndroidId()
        // gze221(o_bootTime) 开机时长
        basicInfoMap["gze221"] = SystemClock.elapsedRealtime() / 1000
        //hmdso0(o_memUsed) 当前占用内存
        basicInfoMap["hmdso0"] =
            ((memoryInfo.totalMem.toDouble() - memoryInfo.availMem.toDouble()) / 1024).roundToLong()
        //inb 发件箱短信数
        basicInfoMap["inb"] =
            getSentSmsCount(context)

        //z5pioq(o_outb) 收件箱短信数
        basicInfoMap["z5pioq"] =
            getInboxSmsCount(context)
        // hass 是否有sim卡
        basicInfoMap["hass"] =
            checkSimCardStatus(context)

        //n7e5di(o_midOriginal) mid原始数据
        basicInfoMap["n7e5di"] = getAndroidId()

        //buid 唯一标识串号 ,Object
        basicInfoMap["buid"] = getAndroidId()

        //ja3Hash A3设备指纹
        basicInfoMap["ja3Hash"] = null

        return basicInfoMap
    }


    private fun checkSimCardStatus(context: Context): Int {
        val telephonyManager = getTelephonyManager(context)
        return runCatching {
            telephonyManager?.simState?.let { simState ->
                if (simState == TelephonyManager.SIM_STATE_READY) 1 else 0
            } ?: -1
        }.getOrDefault(-1)
    }

    private fun getInboxSmsCount(context: Context): Int {
        return runCatching {
            context.contentResolver.query(
                Telephony.Sms.Inbox.CONTENT_URI,
                arrayOf(Telephony.Sms.DATE),
                null,
                null,
                null
            )?.use { cursor ->
                cursor.count
            } ?: -1
        }.getOrDefault(-1)
    }

    private fun getSentSmsCount(context: Context): Int {
        return runCatching {
            context.contentResolver.query(
                Telephony.Sms.Sent.CONTENT_URI,
                arrayOf(Telephony.Sms.DATE),
                null,
                null,
                null
            )?.use { cursor ->
                cursor.count
            } ?: -1
        }.getOrDefault(-1)
    }

//    private fun hasEmulator(): Int {
//        val emulatorIdentifiers = listOf(
//            Build.BRAND to "generic",
//            Build.DEVICE to "generic",
//            Build.FINGERPRINT to "generic",
//            Build.FINGERPRINT to "unknown",
//            Build.FINGERPRINT to "userdebug",
//            Build.FINGERPRINT to "google/sdk_gphone64_",
//            Build.HARDWARE to "goldfish",
//            Build.HARDWARE to "ranchu",
//            Build.MODEL to "google_sdk",
//            Build.MODEL to "Emulator",
//            Build.MODEL to "Android",
//            Build.MODEL to "built for x86",
//            Build.MANUFACTURER to "Genymotion",
//            Build.PRODUCT to "sdk",
//            Build.PRODUCT to "vbox86p",
//            Build.PRODUCT to "emulator",
//            Build.PRODUCT to "sdk_gphone_",
//            Build.PRODUCT to "simulator"
//        )
//        return if (emulatorIdentifiers.any { (field, value) ->
//                field.contains(
//                    value,
//                    ignoreCase = true
//                )
//            }) 1 else 0
//    }


//    private fun hasRoot(): Int {
//        listOf(
//            "/system/bin/",
//            "/system/xbin/",
//            "/data/local/xbin/",
//            "/system/sd/xbin/",
//            "/sbin/",
//            "/system/bin/failsafe/",
//            "/data/local/bin/",
//            "/data/local/",
//            "/system/sbin/",
//            "/vendor/bin/",
//            "/usr/bin/",
//
//            ).forEach {
//            if (File(it + "su").exists()) {
//                return 1
//            }
//        }
//        return 0
//    }


    /**
     * 位置信息
     */
    @SuppressLint("MissingPermission")
    private fun fetchDeviceLocation(
        context: Context
    ): Map<String, Any?>? {

        val locationManager = getLocationManager(context)
        // 空安全处理
        locationManager ?: return null

        var lastKnownLocation: Location? = null

        // 异常安全的位置获取
        runCatching {
            locationManager.getProviders(true).forEach { provider ->
                runCatching {
                    locationManager.getLastKnownLocation(provider)?.let { location ->
                        lastKnownLocation = location

                    }
                }.onFailure { e ->
                    Log.w("fetchDeviceLocation", "fetchDeviceLocation: ${e.message}")
                }
            }
        }

        return mapOf(
            //qi80b5(o_coordinates) 经纬度
            "qi80b5" to lastKnownLocation?.run {
                "${longitude},${latitude}"
            },
            //s4q56x(o_locationOpen) 是否开启定位服务（1=开启，0=未开启，-1=未知）
            "s4q56x" to if (LocationManagerCompat.isLocationEnabled(locationManager)) "1" else "0"
        )
    }


    /**
     * 网络类型
     */
    private fun netType(): String {

        val info = appConnectNetManager?.activeNetworkInfo

        val type = when {
            info?.type == ConnectivityManager.TYPE_WIFI -> {
                "Wi-Fi"
            }

            info?.type == ConnectivityManager.TYPE_MOBILE -> {
                "Cellular"
            }

            else -> {
                "Cellular"
            }
        }

        return type

    }

//    private fun findFirstNonLoopbackIPv4Address(
//    ): String? {
//        val networkInterfaces = NetworkInterface.getNetworkInterfaces()
//        return runTry {
//            var result: String? = null
//            while (networkInterfaces.hasMoreElements() && result == null) {
//                val networkInterface = networkInterfaces.nextElement()
//                val inetAddresses = networkInterface.inetAddresses
//                while (inetAddresses.hasMoreElements()) {
//                    val inetAddress = inetAddresses.nextElement()
//                    if (inetAddress is Inet4Address && !inetAddress.isLoopbackAddress) {
//                        result = inetAddress.hostAddress
//                        break // 找到第一个符合条件的就退出内层循环
//                    }
//                }
//            }
//            result
//        }
//    }

    /**
     * 获取设备的第一个非回环IPv6地址
     *
     * @param
     * @return IPv6地址字符串，如果找不到则返回null
     */
    private fun findFirstNonLoopbackIPv6Address(): String? {
        //网络接口枚举器
        val networkInterfaces = NetworkInterface.getNetworkInterfaces()
        return runTry {
            networkInterfaces.toList().asSequence()
                .flatMap { networkInterface ->
                    networkInterface.inetAddresses.toList().asSequence()
                }
                .filterIsInstance<Inet6Address>()
                .filterNot { it.isLoopbackAddress }
                .mapNotNull { it.hostAddress }
                .firstOrNull()
        }
    }

    // 扩展函数：将Enumeration转换为List
    private fun <T> Enumeration<T>.toList(): List<T> =
        Collections.list(this)


    @SuppressLint("HardwareIds")
    private fun getAndroidId(): String? {

        return runTry {
            Settings.Secure.getString(
                context.contentResolver,
                Settings.Secure.ANDROID_ID
            )
        }
    }


    @SuppressLint("HardwareIds")
    private fun getWifiMacAddress(wifiManager: WifiManager?): String? {

        return runTry {
            wifiManager?.connectionInfo?.macAddress
        }

    }

    @SuppressLint("HardwareIds")
    private fun getWifiBssid(wifiManager: WifiManager?): String? {
        return runTry {
            wifiManager?.connectionInfo?.bssid
        }
    }


    private fun getWifiManager(context: Context): WifiManager? {
        return context.applicationContext.getSystemService(Context.WIFI_SERVICE) as? WifiManager?
    }

    private fun getActivityManager(context: Context): ActivityManager? {
        return context.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager?
    }


    private fun getLocationManager(context: Context): LocationManager? {
        return context.getSystemService(Context.LOCATION_SERVICE) as? LocationManager?
    }

    private fun getTelephonyManager(context: Context): TelephonyManager? {
        return context.getSystemService(Context.TELEPHONY_SERVICE) as? TelephonyManager?

    }


    private fun <T> runTry(block: () -> T): T? {
        return try {
            block()
        } catch (e: Throwable) {
            e.printStackTrace()
            null
        }
    }

    /** @param sensorTimeoutMs 单传感器数据采集超时时长（默认 900ms）
     * @return 成功返回三元组列表 (x, y, z)，失败返回空列表
     */
    suspend fun captureGyroscopeReadings(
        context: Context,
        sensorTimeoutMs: Long = 900
    ): List<Map<String, String>> = suspendCancellableCoroutine { cont ->
        val ctx = context.applicationContext
        val sensorMgr = ctx.getSystemService(Context.SENSOR_SERVICE) as SensorManager

        // 1. 获取所有陀螺仪传感器
        val gyroSensors = sensorMgr.getSensorList(Sensor.TYPE_GYROSCOPE).takeIf { it.isNotEmpty() }
            ?: run {
                cont.resume(emptyList())
                return@suspendCancellableCoroutine
            }

        // 2. 动态适配采样率
        val samplingRate = when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.S -> SensorManager.SENSOR_DELAY_GAME
            else -> SensorManager.SENSOR_DELAY_FASTEST
        }

        // 3. 并发数据容器（使用三元组存储）
        val readingList = mutableListOf<Map<String, String>>()
        // val readingMap = ConcurrentHashMap<Int, Triple<String, String, String>>()
        val syncLatch = CountDownLatch(gyroSensors.size)

        // 4. 注册监听器
        val listeners = gyroSensors.mapIndexed { idx, sensor ->
            object : SensorEventListener {
                override fun onSensorChanged(event: SensorEvent) {
                    val map = HashMap<String, String>()
                    map["x"] = event.values[0].toString()
                    map["y"] = event.values[1].toString()
                    map["z"] = event.values[1].toString()
                    readingList.add(map)
                    sensorMgr.unregisterListener(this)
                    syncLatch.countDown()
                }

                override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {}
            }.also { listener ->
                sensorMgr.registerListener(listener, sensor, samplingRate)
            }
        }

        // 5. 超时控制协程
        CoroutineScope(Dispatchers.Default).launch {
            val timeoutJob = launch {
                delay(sensorTimeoutMs)
                if (syncLatch.count > 0) {
                    listeners.forEach { sensorMgr.unregisterListener(it) }
                    cont.resume(readingList)
                }
            }

            try {
                withContext(Dispatchers.IO) { syncLatch.await() }
                timeoutJob.cancel()
                cont.resume(readingList)
            } catch (e: Exception) {
                cont.resume(emptyList())
            } finally {
                listeners.forEach {
                    try {
                        sensorMgr.unregisterListener(it)
                    } catch (_: Exception) {
                    }
                }
            }
        }.invokeOnCompletion {
            cont.invokeOnCancellation { /* 取消时清理资源 */ }
        }
    }


}