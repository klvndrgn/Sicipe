package com.example.sicipe

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "plugins.flutter.io/image_picker"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // This method handles the method call to pick an image
            if (call.method == "pickImage") {
                // TODO: Implement the pickImage method here
            } else {
                result.notImplemented()
            }
        }
    }
}
