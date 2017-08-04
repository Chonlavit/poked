//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by iMac-52 on 8/4/2560 BE.
//  Copyright © 2560 Megazy. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var lbName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = pokemon.name

    }
    
    

}
