#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>
#import <React/UIView+React.h>

@interface RCT_EXTERN_MODULE(RnFluidicSlider, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(onSlideStart, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onSlideEnd, RCTDirectEventBlock)

@end
