//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 18/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
   
        
        //atributos
        var nome: String
        var felicidade: Int
        var itens: Array<Item> = []
        
        // construtor
        init(nome: String, felicidade: Int){
            self.nome = nome
            self.felicidade = felicidade
        }
        
        func totalDeCalorias() -> Double{
            var total = 0.0
            
            for item in itens {
                total += item.calorias
            }
            
            return total
        }
}
