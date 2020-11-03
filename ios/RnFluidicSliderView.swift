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
//        self.valueViewColor = .red

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
    
    @objc(setSliderBarColor:)
    public func setSliderBarColor(color: String) {
        self.valueViewColor = UIColor(hex: color) ?? UIColor.red
    }
    
    @objc(setBubbleColor:)
    public func setBubbleColor(color: String) {
        self.valueViewColor = UIColor(hex: color) ?? UIColor.red
    }

}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(1)
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
