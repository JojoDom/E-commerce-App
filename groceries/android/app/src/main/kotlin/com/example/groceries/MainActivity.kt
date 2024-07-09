package com.example.groceries

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private lateinit var ussdHelper: UssdHelper

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Initialize and set the activity for UssdHelper
        ussdHelper = UssdHelper()
    //    ussdHelper.setActivity(this@MainActivity)
        UssdHelper.registerWith(flutterEngine)
    }
    override fun onDestroy() {
        super.onDestroy()
        // Clear the activity reference to avoid memory leaks
       // ussdHelper.setActivity(null)
    }
}
