package com.example.groceries

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.FlutterEngine


class UssdHelper : FlutterPlugin, MethodCallHandler {

    private var channel: MethodChannel? = null
    private var ussdResponseReceiver: BroadcastReceiver? = null
    private var activity: Activity? = null

    companion object {
        fun registerWith(flutterEngine: FlutterEngine) {
            val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "groceries.ussd")
            val plugin = UssdHelper()
            channel.setMethodCallHandler(plugin)
        }
    }


    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "groceries.ussd")
        channel?.setMethodCallHandler(this)
        activity = flutterPluginBinding.applicationContext as? Activity
    }

   

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        ussdResponseReceiver?.let {
            binding.applicationContext.unregisterReceiver(it)
        }}

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "sendUssd" -> {
                val ussdCode = call.argument<String>("ussdCode")
                if (ussdCode != null ) {
                    val uri = Uri.parse("tel:$ussdCode")
                    val intent = Intent(Intent.ACTION_CALL, uri)
                    activity?.startActivity(intent)
                    result.success("success!")
                }
                else if(activity == null){
                  result.error("Activitynull", "Activity is null",null)
                } 
                else {
                    result.error("InvalidUssdCode", "USSD code is null or activity is null", null)
                }
            }
            else -> result.notImplemented()
        }
    }
}



