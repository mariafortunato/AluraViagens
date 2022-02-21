//
//  HomeTableViewHeader.swift
//  AluraViagens
//
//  Created by Maria Alice Rodrigues Fortunato on 16/02/22.
//

import UIKit

class HomeTableViewHeader: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    
    func configuraView() {
        headerView.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
        bannerView.layer.cornerRadius = 10 // arredondando toda view
        bannerView.layer.masksToBounds = true // para cortar
                                        // se é ipad ou iphone
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]// arredondamento apenas embaixo
        //    layerMinXMinYCorner: top left corner
        //    layerMaxXMinYCorner: top right corner
        //    layerMinXMaxYCorner: bottom left corner
        //    layerMaxXMaxYCorner: bottom right corner
    }
    
}
