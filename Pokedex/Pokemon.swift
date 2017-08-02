//
//  Pokemon.swift
//  Pokedex
//
//  Created by iMac-52 on 8/1/2560 BE.
//  Copyright © 2560 Megazy. All rights reserved.
//

import Foundation

class Pokemon {

    fileprivate var _name:String!
    fileprivate var _pokedexId: Int!
    
    var name: String{
    
        return _name
    }
    
    var pokedexId: Int{
    
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
    
        self._name = name
        self._pokedexId = pokedexId
        
    }


}
