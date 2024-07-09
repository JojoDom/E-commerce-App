package com.example.groceries

import android.content.Context
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import io.flutter.plugin.common.MessageCodec

class YourPlatformViewFactory(createArgsCodec: MessageCodec<Any?>) :
    PlatformViewFactory(createArgsCodec) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return YourPlatformView(context, viewId, creationParams)
    }
}

