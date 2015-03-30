//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Ruben Robles on 3/24/15.
//  Copyright (c) 2015 Integration Dojo. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    
    init(filePathUrl :NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
    
    var filePathUrl: NSURL!
    var title: String!
    
}


