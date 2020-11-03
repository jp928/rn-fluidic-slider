# rn-fluidic-slider

 

## Installation

```sh
yarn add rn-fluidic-slider
```

### iOS

1. Add
```
use_modular_headers!
```
in Podfile

2. Add 

```
:modular_headers => false
```

after the following lines:

```
  pod 'DoubleConversion', :podspec => '../node_modules/react-native/third-party-podspecs/DoubleConversion.podspec', :modular_headers => false
  pod 'glog', :podspec => '../node_modules/react-native/third-party-podspecs/glog.podspec', :modular_headers => false
  pod 'Folly', :podspec => '../node_modules/react-native/third-party-podspecs/Folly.podspec', :modular_headers => false
```
more details see, example/ios/Podfile


## Usage

```js
import RnFluidicSlider from "rn-fluidic-slider";

// ...


<RnFluidicSlider />
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
