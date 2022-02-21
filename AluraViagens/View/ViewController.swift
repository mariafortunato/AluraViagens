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
        configuraTableView() // chamar o metodo
        view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
    }
    func configuraTableView() {
        // Para registrar uma célula criada a partir de um xib, utilizamos o seguinte método:
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        // configurando datasource para esse arquivo
        viagensTableView.dataSource = self
        // vai implementar os protocolos
        viagensTableView.delegate = self
        
    }
    // capturar objeto selecionado, nesse caso celula destaques
    func irParaDetalhe(_ viagem: Viagem?) {
        
        if let viagemSelecionada = viagem { // verificar se existe a viagem 
            // inicializando o xib, mais especificamente a tela DetalheViewController
            let detalheController = DetalheViewController.instanciar(viagemSelecionada)
            // passar para a tela DetalheViewController
            navigationController?.pushViewController(detalheController, animated: true)
        }

    }
}
                            // implementar o protocolo table view
extension ViewController: UITableViewDataSource {
    // numero de secoes que a tableview vai ter
    func numberOfSections(in tableView: UITableView) -> Int {
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                                                    // se nao tiver valor, o valor sera 0
        return sessaoDeViagens?[section].numeroLinhas  ?? 0
    }
    // o que mostrar na celular
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // acessa de dentro da lista qual o tipo de viewmodel estamos usando, destaques, ofertas e internacional
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:  // passar a lista de destaques
                                                                    // nome do idenficador da view
            guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else { fatalError("Erro para criar ViagemTableViewCell") }
            
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            
            return celulaViagem
            
        case .ofertas:
            
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else { fatalError("Erro para criar OfertaTableViewCell")}
            
            // view controller vai implementar o elegate da oferta
            celulaOferta.delegate = self 
                                        // lista de viagens 
            celulaOferta.configuraCelula(viewModel?.viagens)
            return celulaOferta
            
        default:
            return UITableViewCell()
        }
    }
}
extension ViewController: UITableViewDelegate {
    
    // quando o usuario clicar em uma celula da tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // acesso a qual secao da viewModel selecionada - nesse caso destaques, internacional, ofertas
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques, .internacionais:
            let viagemSelecionada = viewModel?.viagens[indexPath.row] // pegar linha selecionada
            irParaDetalhe(viagemSelecionada)
            
        
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // criar o header somente na primeiro secao, apenas no inicio
        if section == 0 {
            // ler a view header                      nome da view primeira view que encontrar
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            return headerView  // retornar a view
        }
        return nil
    }
    // altura da header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // essa altura apenas para o header no index 0
        if section == 0 {
            return 300
        }
        return 0
        
    }
    // altura da celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
                                                                                // se for ihpone : se for ipad
    }
}
// faz parte de pegar a celula selecionada de oferta
extension ViewController: OfertaTableViewCellDelegate {
    func didSelectView(_ viagem: Viagem?) {
        irParaDetalhe(viagem)
    }
}
