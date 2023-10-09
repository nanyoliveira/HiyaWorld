# HiyaWorld
This library will make available a list of countries and their Alpha 3 codes from ISO 3166 based from the api on https://pkgstore.datahub.io/core/country-list/

## Usage

```swift
        //create an instance
        let hiyaWorld: HiyaWorld = Countries()
        
        //get an Array the Countries names
        let _ = hiyaWorld.getCountriesNames()
        
        //get and Array with the Countries Alpha 3 codes
        let _ = hiyaWorld.getCountriesAlfa3Code()
        
        //get a String with the Alpha Name of the specific country
        let _ = hiyaWorld.getAlfa3Code(byCountryName: "Australia")
        
        
        if hiyaWorld.getCountriesNames().count > 0 {
            //you need to request for offline usage with the syncronizeCountries method
        }
        
        //syncronize the offline database with the online one so it's up to date returning an optional error
        hiyaWorld.syncronizeCountries { error in
            //to do after the syncronization finishes
        }

```

## Installation


### Cocoapods


HiyaWorld is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HiyaWorld'
```

### Swift Package Manager

1. File > Swift Packages > Add Package Dependency
2. Add `https://github.com/nanyoliveira/HiyaWorldN.git`

_OR_

Update `dependencies` in `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/nanyoliveira/HiyaWorldN.git", .upToNextMajor(from: "1.0.0"))
]
```

## Author

Ariane Clarke, ariane.clarke@hiyacar.co.uk

## License

HiyaWorld is available under the MIT license. See the LICENSE file for more info.
