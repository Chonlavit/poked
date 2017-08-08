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
    
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLB: UILabel!
    @IBOutlet weak var typeLB: UILabel!
    @IBOutlet weak var defenseLB: UILabel!
    @IBOutlet weak var heightLB: UILabel!
    @IBOutlet weak var pokedexIdLB: UILabel!
    @IBOutlet weak var weightLB: UILabel!
    @IBOutlet weak var baseATKLb: UILabel!
    @IBOutlet weak var evoLB: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    
    
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbName.text = pokemon.name
        mainImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        currentEvoImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
        nextEvoImg.image = UIImage(named: "\(self.pokemon.pokedexId + 1)")

    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

}











