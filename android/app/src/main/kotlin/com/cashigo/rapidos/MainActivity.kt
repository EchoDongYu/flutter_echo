package com.cashigo.rapidos

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.ContactsContract
import android.provider.ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME
import android.provider.ContactsContract.CommonDataKinds.Phone.NUMBER
import android.provider.Settings
import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch
import java.util.UUID

class MainActivity : FlutterActivity() {
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                PICK_CONTACT -> {
                    pendingResult = result
                    val intent = Intent(Intent.ACTION_PICK)
                    intent.type = ContactsContract.CommonDataKinds.Phone.CONTENT_TYPE
                    startActivityForResult(intent, PICK_CONTACT_CODE)
                }

                DEVICE_ID -> result.success(eigenDeviceId)

                TRACK_INFO -> lifecycleScope.launch {
                    result.success(RiskUtils(this@MainActivity).getRiskInfo())
                }

                else -> result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK) {
            if (requestCode == PICK_CONTACT_CODE) {
                data?.data?.let { onPickContact(it) }
            }
        }
    }

    private fun onPickContact(contactUri: Uri) {
        try {
            contentResolver.query(
                contactUri,
                arrayOf(DISPLAY_NAME, NUMBER),
                null, null, null
            )?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val nameIndex = cursor.getColumnIndexOrThrow(DISPLAY_NAME)
                    val numberIndex = cursor.getColumnIndexOrThrow(NUMBER)

                    val name = cursor.getString(nameIndex) ?: ""
                    val number = cursor.getString(numberIndex) ?: ""

                    val contact = HashMap<String, String>()
                    contact["name"] = name
                    contact["phone"] = number

                    pendingResult?.success(contact)
                    pendingResult = null
                    return
                }
            }
            pendingResult?.error("no_contact", "Could not read contact data", null)
            pendingResult = null
            return
        } catch (e: Exception) {
            pendingResult?.error("pick_contact_error", e.message, null)
            pendingResult = null
            return
        }
    }

    private val androidId: String
        get() = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)

    private val eigenDeviceId: String
        get() {
            val eigenDatas = listOf(
                Build.BOARD, Build.BRAND, Build.MODEL, Build.DEVICE, APPLICATION_ID,
                Build.HARDWARE, Build.PRODUCT, Build.MANUFACTURER, androidId, Build.ID
            )
            val eigenValue = eigenDatas.joinToString().toByteArray()
            return UUID.nameUUIDFromBytes(eigenValue).toString()
        }

    companion object {
        private const val APPLICATION_ID = "com.cashigo.rapidos.prestamos.app"
        private const val CHANNEL = "$APPLICATION_ID/channel"
        private const val PICK_CONTACT_CODE = 1001

        //Method
        private const val PICK_CONTACT = "pickContact"
        private const val DEVICE_ID = "getDeviceId"
        private const val TRACK_INFO = "trackInfo"
    }
}