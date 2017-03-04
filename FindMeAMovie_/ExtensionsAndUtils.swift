//
//  ExtensionsAndUtils.swift
//  FindMeAMovie_
//
//  Created by Shivam Kapur on 05/03/17.
//  Copyright © 2017 ShivamKapoor. All rights reserved.
//

import UIKit


extension UIView {
    
    func addSubview(withView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
}
