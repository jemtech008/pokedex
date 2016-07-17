//
//  PokemonDetailVC.swift
//  pokedex-by-jemtech
//
//  Created by jemson sentillas on 17/07/2016.
//  Copyright © 2016 jemson sentillas. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var descLbl: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var defenseLbl: UILabel!
    @IBOutlet var heightLbl : UILabel!
    @IBOutlet var weightLbl : UILabel!
    @IBOutlet var pokedexLbl : UILabel!
    @IBOutlet var currentEvoImg : UIImageView!
    @IBOutlet var nextEvoImg : UIImageView!
    @IBOutlet var evoLbl : UILabel!
    @IBOutlet var baseAttack : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = self.pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            self.updateUI()
        }
        
   }
    
    func updateUI(){
        descLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexLbl.text = "\(pokemon.pokedexId)"
        baseAttack.text = pokemon.attact
        
        if pokemon.nextEvolutionId == "" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        }else{
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
        }
        
        
    }

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
