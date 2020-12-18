//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 16/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    //MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 50.0),
                         Item(nome: "Molho apimentado", calorias: 35.0)]
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets

   @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaTable = indexPath.row
        let item = itens[linhaTable]
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])

        }else{
            celula.accessoryType = .none
            
            let item =  itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
                
            
            }
        }
        
    }
    
    //MARK: - IBAction

    @IBAction func adicionar(_ sender: Any) {
        
//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text{
//            let nome = nomeDaRefeicao
//
//            if let felicidade = Int(felicidadeDaRefeicao){
//
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//
//        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
//            }else{
//                print("erro")
//            }
//        }
        
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }

}
