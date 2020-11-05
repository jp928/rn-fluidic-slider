package com.rnfluidicslider

import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewGroupManager
import android.view.ViewGroup
import androidx.constraintlayout.widget.ConstraintLayout
import com.facebook.react.common.MapBuilder
import com.facebook.react.uimanager.UIManagerModule
import com.ramotion.fluidslider.FluidSlider


class RnFluidicSlider : ViewGroupManager<ViewGroup>() {
  override fun getName(): String {
    return "RnFluidicSlider"
  }

  override fun getExportedCustomDirectEventTypeConstants(): MutableMap<String, Any> {
    val builder = MapBuilder.builder<String, Any>()
    builder.put("onSlideStart", MapBuilder.of<String, String>("registrationName", "onSlideStart" ))

    return builder.build()
  }

  override fun createViewInstance(reactContext: ThemedReactContext): ViewGroup {
    val layout = ConstraintLayout(reactContext)
    val constraintLayout=
        reactContext
          .currentActivity?.layoutInflater?.inflate(R.layout.slider, layout, false)
          as ConstraintLayout

    val slider = constraintLayout.getViewById(R.id.fluidSlider) as FluidSlider

    val max = 500
    val min = 0
    val total = max - min
    slider.beginTrackingListener = {
      reactContext.getNativeModule(UIManagerModule::class.java).eventDispatcher.dispatchEvent(RnFluidicEvent(constraintLayout.id, "onSlideStart", slider.position))
    }

    slider.positionListener = { pos -> slider.bubbleText = "${min + (total  * pos).toInt()}" }
    return constraintLayout

  }
}
