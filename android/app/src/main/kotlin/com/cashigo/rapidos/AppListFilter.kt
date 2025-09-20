package com.cashigo.rapidos

import android.content.Context
import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.os.Build

object AppListFilter {

    fun getAppFilterList(context: Context): List<Map<String, Any?>> {
        //todo  包名集合过滤产品会提供新得
        val excludedPackages = setOf(
            "com.credifacil.emprestimo.credito.app", "xxxxxx",
        )

        val packageManager = context.packageManager
        val results = mutableListOf<PackageInfo>()

        // 获取包信息
        excludedPackages.forEach { packageName ->
            val packageInfo = getPackageInfoSafely(packageManager, packageName)
            packageInfo?.let { results.add(it) }
        }
        // 过滤并构造返回数据
        return results.filter { it.applicationInfo?.flags?.and(ApplicationInfo.FLAG_SYSTEM) == 0 }
            .map { appInfo ->
                mapOf(
                    "a8h656" to if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                        appInfo.longVersionCode
                    } else {
                        appInfo.versionCode.toLong()
                    },
                    "name" to appInfo.applicationInfo?.loadLabel(packageManager).toString(),
                    "n1s2v2" to appInfo.packageName,
                    "y3xrcc" to appInfo.firstInstallTime / 1000,
                    "f1fc0d" to appInfo.lastUpdateTime / 1000
                )
            }
    }

    private fun getPackageInfoSafely(
        packageManager: PackageManager,
        packageName: String
    ): PackageInfo? {
        return try {
            packageManager.getPackageInfo(packageName, PackageManager.GET_META_DATA)
        } catch (_: PackageManager.NameNotFoundException) {
            null
        }
    }

}