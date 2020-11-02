import { NativeModules } from 'react-native';

type RnFluidicSliderType = {
  multiply(a: number, b: number): Promise<number>;
};

const { RnFluidicSlider } = NativeModules;

export default RnFluidicSlider as RnFluidicSliderType;
