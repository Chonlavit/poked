//
//  ViewController.swift
//  Pokedex
//
//  Created by iMac-52 on 7/31/2560 BE.
//  Copyright © 2560 Megazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsePokemonCSV()
        
        
    }
    
    let charmander = Pokemon(name: "Charmander", pokedexId: 6)
    
    func parsePokemonCSV(){
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
            
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
        
        }catch let err as NSError{
            
            print(err.debugDescription)
            
        
        }
    
    
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokeCell{
            
            let poke = pokemon[indexPath.row]
//            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
            
            cell.configureCell(poke)
            
            
        return cell
            
        }else{
        
            return UICollectionViewCell()
        
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height:  105)
    }
    
    



}

