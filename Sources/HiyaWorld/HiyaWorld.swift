#if os(iOS)

import RealmSwift

public protocol HiyaWorld {
    func setSource(urlPath:String?)
    func syncronizeCountries(sincronized: @escaping (Error?)-> ())
    func getCountriesNames() -> [String]
    func getCountriesAlfa2Code() ->[String]
    func getAlfa2Code(byCountryName:String) -> String?
}

final public class Countries: HiyaWorld, HiyaRequestAble {
    private var _urlPath:String = "https://pkgstore.datahub.io/core/country-list/data_json/data/8c458f2d15d9f2119654b29ede6e45b8/data_json.json"
    private let realm = try! Realm()
    private var _countries: [Country]
    
    init(){
        _countries = []
        let realm = self.realm.objects(CountryRealm.self)
        for country in realm {
            _countries.append(Country(Code: country.code, Name: country.name))
        }
    }

    public func setSource(urlPath:String?) {
        if let path = urlPath {
            self._urlPath = path
        }
    }
    
    public func syncronizeCountries(sincronized: @escaping (Error?)-> ()) {
        // download the country to realm
        requestCountries(path: _urlPath, type: [Country].self) { _country, error in
            guard let countryCollection = _country else {
                if error != nil{
                    sincronized(error)
                    print(error?.localizedDescription ?? "")
                }
                return
            }
        
            for country in countryCollection {
                try? self.realm.write({[weak self] in
                    self?.realm.add(CountryRealm(country: country))
                })
            }
            sincronized(nil)
        }
    }
    
    public func getCountriesNames() -> [String] {
        return _countries.map { $0.Name }
    }
    
    public func getCountriesAlfa2Code() ->[String] {
        let codes = _countries.map({ $0.Code})
        return codes
    }
    
    public func getAlfa2Code(byCountryName:String) -> String? {
        return _countries.filter({$0.Name == byCountryName})[0].Code
    }
}
#endif

