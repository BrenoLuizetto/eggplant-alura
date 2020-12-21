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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate{
    
    // MARK: - IBOutlet
    
    
    @IBOutlet weak var itensTableView: UITableView!
    
    
    //MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    //MARK: - IBOutlets

   @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        
        navigationItem.rightBarButtonItem = botaoAdicionaItem
        
        recuperaItens()
        
    }
    
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItens(){
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_  item: Item){
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView {
            tableView.reloadData()
        }else{
            Alerta(controller: self).exibe(title: "desculpe", mensagem: "não foi possivel recarregar a tabela")
        }
    }

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
    func recuperaRefeicaoDoFormulario() -> Refeicao?{
        guard let nomeDaRefeicao = nomeTextField?.text else{
            return nil
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else{
            return nil
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    //MARK: - IBAction

    @IBAction func adicionar(_ sender: Any) {
        
        guard let refeicao = recuperaRefeicaoDoFormulario() else{
            Alerta(controller: self).exibe(mensagem: "Não foi possivel criar refeição")
            return
        }
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }

}
