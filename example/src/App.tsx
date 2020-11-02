import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import RnFluidicSlider from 'rn-fluidic-slider';

export default function App() {

  return (
    <View style={styles.container}>
      <RnFluidicSlider />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});
