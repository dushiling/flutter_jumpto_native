package com.example.flutter_jumpto_native

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.FragmentActivity

class SecondActivity: FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e("YM", "第二个页面的渲染");
        setContentView(R.layout.activity_second);
    }
}