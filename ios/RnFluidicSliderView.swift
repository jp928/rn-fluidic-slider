import UIKit
import fluid_slider

@objc(RnFluidicSliderView)
class RnFluidicSliderView: Slider {
    @objc var onSlideStart: RCTDirectEventBlock?
    @objc var onSlideEnd: RCTDirectEventBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 500) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        self.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
        self.setMaximumLabelAttributedText(NSAttributedString(string: "500"))
        self.fraction = 0.5
        self.shadowOffset = CGSize(width: 0, height: 10)
        self.shadowBlur = 5
        self.shadowColor = UIColor(white: 0, alpha: 0.1)
        self.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
        self.valueViewColor = .red

        self.didBeginTracking = { (slider) -> Void  in
            self.onSlideStart?(["position" : slider.fraction])
        }
        
        self.didEndTracking = { (slider) -> Void  in
            self.onSlideEnd?(["position" : slider.fraction])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}
