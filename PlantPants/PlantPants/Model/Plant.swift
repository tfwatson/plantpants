//
//  Plant.swift
//  PP_UI
//
//  Created by Andrew Julian Gonzales on 1/25/24.
//

import Foundation
struct Plant: Hashable, Identifiable{
    let id = UUID()
    let name:String
    let temperature:String
    let Description:String
}
