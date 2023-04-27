//
//  Country.swift
//  
//
//  Created by Ariane Clarke on 25/04/2023.
//

import Foundation
import RealmSwift

struct Country: Codable {
    var code:String?
    var name:String?

    private enum CodingKeys : String, CodingKey {
        case code = "ISO3166-1-Alpha-3"
        case name  = "CLDR display name"
    }
}

class CountryRealm : Object {
    @Persisted var name: String = ""
    @Persisted var code: String = ""
    
    convenience init(name: String, code: String) {
        self.init()
        self.name = name
        self.code = code
    }
    
    convenience init(country:Country) {
        self.init()
        self.name = country.name ?? ""
        self.code = country.code ?? ""
    }
}
