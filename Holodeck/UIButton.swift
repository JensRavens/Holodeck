//
//  UIButton.swift
//  Interstellar
//
//  Created by Jens Ravens on 15/04/16.
//  Copyright © 2016 nerdgeschoss GmbH. All rights reserved.
//

import Foundation
import UIKit

private var EventSignalHandle: UInt8 = 0
extension UIButton {
    public var taps: Observable<Void> {
        return observableForHandle(&EventSignalHandle, options: [.NoInitialValue]) { _ in
            addTarget(self, action: #selector(UIButton.handleEvent(_:)), forControlEvents: .TouchUpInside)
        }
    }
    
    internal func handleEvent(sender: UIButton) {
        taps.update()
    }
}
