#if os(iOS)

import RealmSwift

public protocol HiyaWorld {
    func setSource(urlPath:String?)
    func syncronizeCountries(sincronized: @escaping (Error?)-> ())
    func getCountriesNames() -> [String]
    func getCountriesAlfa3Code() ->[String]
    func getAlfa3Code(byCountryName:String) -> String?
}

final public class Countries: HiyaWorld, HiyaRequestAble {
    private var _urlPath:String = "https://pkgstore.datahub.io/core/country-codes/country-codes_json/data/616b1fb83cbfd4eb6d9e7d52924bb00a/country-codes_json.json"
    private let realm = try! Realm()
    private var _countries: [Country]
    
    public init(){
        _countries = []
        self.populateCountries()
    }

    public func setSource(urlPath:String?) {
        if let path = urlPath {
            self._urlPath = path
        }
    }
    
    public func syncronizeCountries(sincronized: @escaping (Error?)-> ()) {
        // download the country to realm
        self.requestCountries(path: self._urlPath, type: [Country].self) { _country, error in
            guard let countryCollection = _country else {
                if error != nil{
                    sincronized(error)
                }
                return
            }
        
            for country in countryCollection {
                try? self.realm.write({[weak self] in
                    self?.realm.add(CountryRealm(country: country))
                })
            }
            self.populateCountries()
            sincronized(nil)
        }
    }
    
    public func getCountriesNames() -> [String] {
        return self._countries.map { $0.name ?? "" }
    }
    
    public func getCountriesAlfa3Code() ->[String] {
        let codes = self._countries.map({ $0.code ?? "" })
        return codes
    }
    
    public func getAlfa3Code(byCountryName:String) -> String? {
        let country = self._countries.filter({$0.name == byCountryName})
        return country.first?.code
    }
    
    private func populateCountries(){
        let realm = self.realm.objects(CountryRealm.self)
        for country in realm {
            _countries.append(Country(code: country.code, name: country.name))
        }
    }
}
#endif

