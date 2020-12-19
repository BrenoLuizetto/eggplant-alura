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
    init(nome: String, felicidade: Int, itens: [Item]){
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
        }
        
        func totalDeCalorias() -> Double{
            var total = 0.0
            
            for item in itens {
                total += item.calorias
            }
            
           
            return total
        }
    
    func detalhes() -> String{
        var mensagem = "felicidade: \(felicidade)"
        
        for item in itens{
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }
}
