//
//  PokemonViewController.swift
//  Pokedex27C
//
//  Created by Drew Seeholzer on 7/2/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }
    
    func updateViews() {
        guard let pokemon = pokemon else { return }
        pokemonNameLabel.text = pokemon.pokemonName
        pokemonIDLabel.text = "ID: \(pokemon.identifier)"
        pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
    }
}

extension PokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Fetch with the search text
        DVMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            self.pokemon = pokemon
            
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
}
