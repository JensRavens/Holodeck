//
//  UITextField.swift
//  Interstellar
//
//  Created by Jens Ravens on 15/04/16.
//  Copyright © 2016 nerdgeschoss GmbH. All rights reserved.
//

import Foundation
import UIKit

private var TextSignalHandle: UInt8 = 0
extension UITextField: UITextFieldDelegate {
    public var textObservable: Observable<String> {
        return observableForHandle(&TextSignalHandle) { _ in
            delegate = self
        }
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var text = (self.text ?? "") as NSString
        text = text.stringByReplacingCharactersInRange(range, withString: string)
        textObservable.update(text as String)
        return true
    }
}