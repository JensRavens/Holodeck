//
//  UISearchbar.swift
//  Interstellar
//
//  Created by Jens Ravens on 15/04/16.
//  Copyright © 2016 nerdgeschoss GmbH. All rights reserved.
//

import Foundation
import UIKit

private var TextSignalHandle: UInt8 = 0
extension UISearchBar: UISearchBarDelegate {
    public var textObservable: Observable<String> {
        return observableForHandle(&TextSignalHandle) { _ in
            delegate = self
        }
    }
    
    public func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        textObservable.update(text ?? "")
    }
}