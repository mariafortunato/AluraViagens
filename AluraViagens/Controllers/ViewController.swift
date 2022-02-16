//
//  ViewController.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 16/02/22.
//

import UIKit
                                        
class ViewController: UIViewController {

    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // configurando datasource para esse arquivo
        viagensTableView.dataSource = self
        // vai implementar os protocolos 
        viagensTableView.delegate = self
        // view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
    }
}
                            // implementar o protocolo table view
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = "viagem \(indexPath.row)"
        return celula
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // ler a view pequena alura viagens         nome da view                         primeira view que encontrar
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}


