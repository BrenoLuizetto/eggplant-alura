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
    
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
       refeicoes = RefeicaoDao().recupera()
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let refeicao = refeicoes [indexPath.row]
        
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
           let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula) else{ return }
            
            let refeicao = refeicoes[indexPath.row]
            
            removeRefeicaoViewController(controller: self).exibe(refeicao, handler:
                {alert in
                    self.refeicoes.remove(at: indexPath.row)
                    self.tableView.reloadData()
                })
    }
    }
    
    
    
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        
        RefeicaoDao().save(refeicoes)
        
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
    }

}

