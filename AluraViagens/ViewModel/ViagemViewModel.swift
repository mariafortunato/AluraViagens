//
//  ViagemViewModel.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 17/02/22.
//

import Foundation

enum ViagemViewModelType: String {
    case destaques
    case ofertas
    case internacionais
}

protocol ViagemViewModel {// tem algumas caraterísticas, o que precisa que a célula exiba na tableView - as infos que precisam ser visualizadas
    var tituloSessao: String { get }
    var tipo: ViagemViewModelType { get }
    var viagens: [Viagem] { get set }
    var numeroLinhas: Int { get }
}
