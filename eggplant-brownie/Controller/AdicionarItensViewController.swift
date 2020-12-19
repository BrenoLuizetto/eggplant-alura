//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Breno Luizetto Cintra on 19/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate{
    func add(_  item: Item)
}

class AdicionarItensViewController: UIViewController {
    
      //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextField:UITextField!
    
    //MARK: - atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - View life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else{
            return
        }
        
        if let numeroDeCalorias = Double(calorias){
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}

