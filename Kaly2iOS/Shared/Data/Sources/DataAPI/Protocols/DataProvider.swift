//
//  DataProvider.swift
//  
//
//  Created by Joel Thiessen on 2022-02-20.
//

import Foundation

public protocol DataProvider {
    var mapClient: MapClient { get }
    
    var robotClient: RobotClient { get }
    
    var sessionClient: SessionClient { get }
}
