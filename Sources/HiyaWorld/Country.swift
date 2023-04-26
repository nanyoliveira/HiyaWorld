//
//  Country.swift
//  
//
//  Created by Ariane Clarke on 25/04/2023.
//

import Foundation
import RealmSwift

struct Country: Codable {
    var Code:String
    var Name:String

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
        self.name = country.Name
        self.code = country.Code
    }
}
