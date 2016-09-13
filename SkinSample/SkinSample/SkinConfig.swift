//
//  SkinConfig.swift
//  SkinSample
//
//  Created by Emiaostein on 13/09/2016.
//  Copyright © 2016 botai. All rights reserved.
//

import Foundation
import UIKit
extension DetailViewController: Skinable {
    
    func updateTo(skin: Skin, animated: Bool) {
        view.backgroundColor = UIColor(skin.secondColor)
        detailDescriptionLabel.backgroundColor = UIColor(skin.secondColor)
        detailDescriptionLabel.textColor = UIColor.revertColorFrom(rgb: skin.mainColor)
    }
    override func awakeFromNib() {
        registerSkin()
        updateTo(skin: Skin.current, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        unregisterSkin()
        super.viewDidDisappear(animated)
        
    }
}

extension MasterViewController: Skinable {
    
    func updateTo(skin: Skin, animated: Bool) {
        tableView.backgroundColor = UIColor(skin.secondColor)
        navigationController?.navigationBar.barTintColor = UIColor(skin.mainColor)
        navigationController?.navigationBar.tintColor = UIColor.revertColorFrom(rgb: skin.mainColor)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.revertColorFrom(rgb: skin.mainColor)]
    }
    
    override func awakeFromNib() {
        registerSkin()
        updateTo(skin: Skin.current, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterSkin()
        super.viewWillAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.registerSkin()
        cell.updateTo(skin: Skin.current, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.unregisterSkin()
    }
}

extension UITableViewCell: Skinable {
    
    func updateTo(skin: Skin, animated: Bool) {
        backgroundColor = UIColor(skin.secondColor)
        textLabel?.textColor = UIColor.revertColorFrom(rgb: skin.mainColor)
    }
}
