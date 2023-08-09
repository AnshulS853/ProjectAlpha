//
//  ScanData.swift
//  TestVision
//
//  Created by Benjamin Alexander on 26/07/2023.
//

import Foundation

struct RecognisedTextFormat: Identifiable{
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
