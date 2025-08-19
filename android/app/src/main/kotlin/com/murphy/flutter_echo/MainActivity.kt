package com.murphy.flutter_echo

import android.app.Activity
import android.content.Intent
import android.database.Cursor
import android.net.Uri
import android.os.Bundle
import android.provider.ContactsContract
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.murphy.flutter_echo/channel"
    private val PICK_CONTACT = 1001
    private var pendingResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: io.flutter.embedding.engine.FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "pickContact") {
                pendingResult = result
                val intent = Intent(Intent.ACTION_PICK).apply {
                    type = ContactsContract.CommonDataKinds.Phone.CONTENT_TYPE
                }
                startActivityForResult(intent, PICK_CONTACT)
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK) {
            if (requestCode == PICK_CONTACT) {
                onPickContact(data?.data!!)
            }
        }
    }

    private fun onPickContact(contactUri: Uri) {
        try {
            contentResolver.query(
                contactUri,
                arrayOf(
                    ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME,
                    ContactsContract.CommonDataKinds.Phone.NUMBER
                ),
                null, null, null
            )?.use { cursor ->
                if (cursor.moveToFirst()) {
                    val nameIndex = cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME)
                    val numberIndex = cursor.getColumnIndex(ContactsContract.CommonDataKinds.Phone.NUMBER)

                    if (nameIndex == -1 || numberIndex == -1) {
                        pendingResult?.error("invalid_cursor", "Could not find required columns in contact data", null)
                        pendingResult = null
                        return
                    }

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
}

