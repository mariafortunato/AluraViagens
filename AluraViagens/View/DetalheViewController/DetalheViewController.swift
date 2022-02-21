//
//  DetalheViewController.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 21/02/22.
//

import UIKit

class DetalheViewController: UIViewController {

    // MARK: - IBOutletls
    
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    
    // MARK: - Atributos
    
    var viagem: Viagem?
    
    // capturar objeto selecionado, nesse caso celula destaques
    class func instanciar(_ viagem: Viagem) ->  DetalheViewController {
                                                            // pega o nome da classe e converte para string
        let detalhesViewContoller = DetalheViewController(nibName: String(describing: self), bundle: nil)
        detalhesViewContoller.viagem = viagem
        
        return detalhesViewContoller
    }
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraView()
        
    }
    
    func configuraView() {
        // se nao tiver valor, aparece vazio
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"

        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")

        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString

        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"

        diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
    }
    
    // MARK: - Actions
    }
    @IBAction func botaoVoltar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
