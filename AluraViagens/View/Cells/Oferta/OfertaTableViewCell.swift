//
//  OfertaTableViewCell.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 18/02/22.
//

import UIKit

protocol OfertaTableViewCellDelegate: AnyObject {
    // seleciona a view e envia a viagem que foi selecionada
    func didSelectView(_ viagem: Viagem?)
}

class OfertaTableViewCell: UITableViewCell {

   // MARK: - IBOutlets
    
    
    
    @IBOutlet var viagemImages: [UIImageView]!
    @IBOutlet var tituloViagemLabels: [UILabel]!
    @IBOutlet var subtituloViagemLabels: [UILabel]!
    @IBOutlet var precoSemDescontoLabels: [UILabel]!
    @IBOutlet var precoLabels: [UILabel]!
    @IBOutlet var fundoViews: [UIView]!
    
    weak var delegate: OfertaTableViewCellDelegate? 
    private var viagens: [Viagem]?
    
    func configuraCelula(_ viagens: [Viagem]?) {
        
        // saber a celula selecionada e passar para o view controller
        self.viagens = viagens
        
        guard let listaDeViagem = viagens else { return }
           
        for i in 0..<listaDeViagem.count {
            setOutlets(i, viagem: listaDeViagem[i])
        }
        
        fundoViews.forEach {viewAtual in // percorre lista e add efeito de sombra
            
            viewAtual.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSelectView(_:))))
            viewAtual.addSombra() // 21/02/2022: para mostrar precisa abrir o app e atualizar para mostrar sombra
        
        }
    }

       
    func setOutlets(_ index: Int, viagem: Viagem) {
        let imageOutlet = viagemImages[index]
        imageOutlet.image = UIImage(named: viagem.asset)
           
        let tituloOutlet = tituloViagemLabels[index]
        tituloOutlet.text = viagem.titulo
           
        let subtituloOutlet = subtituloViagemLabels[index]
        subtituloOutlet.text = viagem.subtitulo
           
        let precoSemDescontoOutlet = precoSemDescontoLabels[index]
        precoSemDescontoOutlet.text = "A partir de R$ \(viagem.precoSemDesconto)"
           
        let precoOutlet = precoLabels[index]
        precoOutlet.text = "R$ \(viagem.preco)"
    }
    // metodo que vai ser disparado quando o tap(clique) ocorrer
    @objc func didSelectView(_ gesture: UIGestureRecognizer) {
        // qual view e tag selecionadas
        if let selectedView = gesture.view {
            let viagemSelecionada = viagens?[selectedView.tag]
            delegate?.didSelectView(viagemSelecionada) // passar a viagem selecionada 
        }
       
    }
       
}
