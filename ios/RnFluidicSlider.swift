@objc(RnFluidicSlider)
class RnFluidicSlider: RCTViewManager {    
    lazy var sliderView = RnFluidicSliderView()
    
    override func view() -> UIView! {
        return sliderView
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
