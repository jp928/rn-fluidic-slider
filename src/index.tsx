import { requireNativeComponent, ViewStyle } from 'react-native';

export type FluidicSliderEvent = {
  nativeEvent: {
    position: number;
  }
};

type RnFluidicSliderProps = {
  style: ViewStyle;
  sliderBarColor: string;
  onSlideStart: (e: FluidicSliderEvent) => void;
  onSlideEnd: (e: FluidicSliderEvent) => void;
}

const RnFluidicSlider = requireNativeComponent<RnFluidicSliderProps>('RnFluidicSlider');

export default RnFluidicSlider;
