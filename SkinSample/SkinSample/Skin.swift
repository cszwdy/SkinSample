//
//  Skin.swift
//  PaintRatio
//
//  Created by Emiaostein on 13/09/2016.
//  Copyright © 2016 botai. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(_ rgb: (r: CGFloat, g: CGFloat, b: CGFloat)) {
        self.init(red: rgb.r, green: rgb.g, blue: rgb.b, alpha: 1)
    }
    
    class func revertColorFrom(rgb: (r: CGFloat, g: CGFloat, b: CGFloat)) -> UIColor {
        return UIColor(red: 1 - rgb.r, green: 1 - rgb.g, blue:  1 - rgb.b, alpha: 1)
    }
}

protocol Skinable: NSObjectProtocol {
    func registerSkin()
    func unregisterSkin()
    func updateTo(skin: Skin, animated: Bool)
}

extension Skinable {
    func registerSkin() {
        NotificationCenter.default.addObserver(forName: Skin.didChangedNotification, object: nil, queue: OperationQueue.main) {[weak self] (n) in
            if let skin = n.object as? Skin {
                self?.updateTo(skin: skin, animated: true)
            }
        }
    }
    
    func unregisterSkin() {
        NotificationCenter.default.removeObserver(self, name: Skin.didChangedNotification, object: nil)
    }
}

struct Skin {
    let id: String
    let mainColor: (r: CGFloat, g: CGFloat, b: CGFloat)
    let secondColor: (r: CGFloat, g: CGFloat, b: CGFloat)
    
    static var didChangedNotification: Notification.Name {
        return NSNotification.Name(rawValue: "com.emiaostein.PaintRatio.SkinDidChangedNotification")
    }
    
    static private(set) var current = skins[1]
    
    static private var skins = [Skin.dark, Skin.light]
    
    static var dark: Skin {
        return Skin(
            id: "Dark",
            mainColor: (0,0,0),
            secondColor: (0.1, 0.1, 0.1)
        )
    }
    
    static var light: Skin {
        return Skin(
            id: "light",
            mainColor: (1,1,1),
            secondColor: (0.9, 0.9, 0.9)
        )
    }
    
    static func changeTo(skin: Skin) {
        Skin.current = skin
        NotificationCenter.default.post(name: Skin.didChangedNotification, object: skin)
    }
    
    static func changeToNext() {
        let count = skins.count
      let i = skins.index(where: {$0.id == current.id})!
        let next = i+1 < count ? i+1 : 0
        changeTo(skin: skins[next])
    }
}
