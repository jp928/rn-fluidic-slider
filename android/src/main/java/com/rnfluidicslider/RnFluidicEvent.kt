package com.rnfluidicslider

import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.WritableMap
import com.facebook.react.uimanager.events.Event
import com.facebook.react.uimanager.events.RCTEventEmitter

class RnFluidicEvent : Event<RnFluidicEvent> {
  var mSelection: Float
  var mEvent: String

  constructor(viewId: Int, event: String, selection: Float) : super(viewId) {
    this.mEvent = event
    this.mSelection = selection
  }

  override fun getEventName(): String {
    return this.mEvent
  }

  override fun getCoalescingKey(): Short {
    return 0
  }

  override fun dispatch(rctEventEmitter: RCTEventEmitter?) {
    rctEventEmitter?.receiveEvent(viewTag, eventName, serializeEventData())
  }

  private fun serializeEventData(): WritableMap {
    val eventData = Arguments.createMap()
    eventData.putInt("target", viewTag)
    eventData.putDouble("position", this.mSelection.toDouble())
    eventData.putString("event", this.mEvent)

    return eventData
  }
}
