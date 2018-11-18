//
//  Models.swift
//  MultiCellTableView
//
//  Created by Navpreet Singh on 18/11/18.
//  Copyright © 2018 Navpreet Singh. All rights reserved.
//

import Foundation

struct Instrument {
    let id: String?
    var changeThis: String?
    
    mutating func changevalue(newV : String) -> String {
        changeThis = newV
        return changeThis ?? "none"
    }
}

struct Foo {
    var instruments: [Instrument]
    
    @discardableResult
    mutating func updateInstrument(forFirst identifier: String, using mutate: (inout Instrument) -> ()) -> Bool {
        return instruments
            .index(where: { $0.id == identifier })
            .map { mutate(&instruments[$0]) } != nil
    }
}
