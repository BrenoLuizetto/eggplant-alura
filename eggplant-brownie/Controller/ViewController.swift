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

class ViewController: UIViewController {
    //MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    
    //MARK: - IBOutlets

   @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    
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
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }

}
