import React from 'react';
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

const RnFluidicSlider: React.FC<RnFluidicSliderProps> = ({ ...props }) => {
  return <FluidicSlider {...props} />
};


const FluidicSlider = requireNativeComponent<RnFluidicSliderProps>(
  'RnFluidicSlider',
  // @ts-ignore
  RnFluidicSlider,
  {
    nativeOnly: { onSlideStart: true,  onSlideEnd: true }
  }
);

export default RnFluidicSlider;
