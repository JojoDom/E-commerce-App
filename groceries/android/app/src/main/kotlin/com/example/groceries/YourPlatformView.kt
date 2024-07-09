package com.example.groceries

import android.content.Context
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

class YourPlatformView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView = TextView(context)

    init {
        textView.text = "Hello from Platform View"
        textView.setBackgroundColor(android.graphics.Color.rgb(255, 255, 255))
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}
}
