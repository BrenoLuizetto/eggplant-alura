//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 20/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import Foundation
import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    func exibe(){
        let alerta = UIAlertController(title: "Desculpe", message: "Não foi possivel atualizar a tabela", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        controller.present(alerta, animated: true, completion: nil)
    }
}
