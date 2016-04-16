//
//  NSObject.swift
//  Interstellar
//
//  Created by Jens Ravens on 15/04/16.
//  Copyright © 2016 nerdgeschoss GmbH. All rights reserved.
//

import Foundation

extension NSObject {
    internal func observableForHandle<T>(inout handle: UInt8) -> Observable<T> {
        return observableForHandle(&handle, configure: { _ in })
    }
    
    internal func observableForHandle<T>(inout handle: UInt8, options: ObservingOptions = [], @noescape configure: Observable<T>->Void) -> Observable<T> {
        let observable: Observable<T>
        if let handle = objc_getAssociatedObject(self, &handle) as? Observable<T> {
            observable = handle
        } else {
            observable = Observable(options: options)
            configure(observable)
            objc_setAssociatedObject(self, &handle, observable, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return observable
    }
}