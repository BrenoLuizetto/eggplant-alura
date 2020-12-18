//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 18/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation
import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate{
    
    var refeicoes = [Refeicao(nome: "macarrao", felicidade: 4),
                     Refeicao(nome: "arroz", felicidade: 3),
                    Refeicao(nome: "feijao", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes [indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        return celula
    }
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }
}
