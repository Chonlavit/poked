//
//  PokeCell.swift
//  Pokedex
//
//  Created by iMac-52 on 8/1/2560 BE.
//  Copyright © 2560 Megazy. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet var thumbImg: UIImageView!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon){
    
    self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    
    }
    
}
