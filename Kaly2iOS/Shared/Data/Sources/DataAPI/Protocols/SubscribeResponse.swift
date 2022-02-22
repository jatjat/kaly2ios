//
//  SubscribeResponse.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-02.
//

import Foundation

public protocol Particle {
    var x: Float { get }
    var y: Float { get }
    var heading: Float { get }
}

public protocol Feature {
    var x: Float { get }
    var y: Float { get }
}

public protocol Pose {
    var x: Float { get }
    var y: Float { get }
    var heading: Float { get }
}

public protocol SlamSettings {
    var numParticles: Int32 { get }
    var sensorDistVar: Float { get }
    var sensorAngVar: Float { get }
}

public protocol SessionSettings {
    var isRunning: Bool { get }
}

public protocol Iteration {
    var bestPose: Pose { get }
    var odoPose: Pose { get }
    var truePose: Pose { get }
    var features: [Feature] { get }
    var particles: [Particle] { get }
    var slamSettings: SlamSettings { get }
    var sessionSettings: SessionSettings { get }
}

public protocol SubscribeResponse {
    var iteration: Iteration { get }
}
