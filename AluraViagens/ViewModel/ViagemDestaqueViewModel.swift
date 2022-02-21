//
//  ViagemDestaqueViewModel.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 17/02/22.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Destaques"
    }
    var tipo: ViagemViewModelType {
        return .destaques
    }
    var viagens: [Viagem]
    var numeroLinhas: Int {
        return viagens.count
    }
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
