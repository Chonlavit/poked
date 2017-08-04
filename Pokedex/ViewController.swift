//
//  ViewController.swift
//  Pokedex
//
//  Created by iMac-52 on 7/31/2560 BE.
//  Copyright © 2560 Megazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var fileredPokemon = [Pokemon]()
    var inSearchMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mySearchBar.delegate = self
        mySearchBar.returnKeyType = UIReturnKeyType.done
        
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
        
        if inSearchMode{
            return fileredPokemon.count
        
        }
        return pokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokeCell{
            
            let poke: Pokemon!
            //            2 let poke = pokemon[indexPath.row]
            //            1 let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
            
            if inSearchMode{
                poke = fileredPokemon[indexPath.row]
                cell.configureCell(poke)
            }else{
                poke = pokemon[indexPath.row]
                cell.configureCell(poke)
            }
        return cell
            
        }else{
        
            return UICollectionViewCell()
        
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height:  105)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if mySearchBar.text == nil || mySearchBar.text == ""{
        
            inSearchMode = false
            myCollectionView.reloadData()
            view.endEditing(true)
        
        }else{
        
            inSearchMode = true
            
            let lower = mySearchBar.text!.lowercased()
            
            fileredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            
            myCollectionView.reloadData()
        
        }
        
    }



}

