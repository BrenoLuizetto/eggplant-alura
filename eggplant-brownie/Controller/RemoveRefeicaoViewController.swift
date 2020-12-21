//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 21/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation
import UIKit


class removeRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void){
    let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
    
    let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
    
    alerta.addAction(botaoCancelar)
    
    let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        controller.present(alerta, animated: true, completion: nil)
}
}

