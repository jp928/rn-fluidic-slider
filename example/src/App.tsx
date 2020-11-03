import * as React from 'react';
import { StyleSheet, View } from 'react-native';
import RnFluidicSlider from 'rn-fluidic-slider';

export default function App() {

  return (
    <View style={styles.container}>
      <RnFluidicSlider style={{ width: 300, height: 100, backgroundColor: 'yellow' }}  />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    // backgroundColor: 'red'
  },
});
