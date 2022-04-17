//
//  AppAPI.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2022-02-12.
//

import Combine
import Foundation

// protocol RobotPose {
//    var x: Float { get }
//    var y: Float { get }
//    var heading: Float { get }
// }
//
protocol MutableRobot {
    var bestPose: APose { get }
    var odoPose: APose { get }
    var truePose: APose? { get }

    var particles: [AParticle] { get }
    var features: [AFeature] { get }

    func drive(heading: Float, speed: Float) async throws
}

protocol MutableMap {
    var bestObstacles: [String] { get }
    var trueObstacles: [String]? { get }
}

protocol MutableSlamSettings {
    var numParticles: Int { get }
    var sensorDistVar: Double { get }
    var sensorAngVar: Double { get }

    func setNumParticles(num: Int) async throws
}

protocol MutableSessionSettings {
    var isRunning: Bool { get }

    func setIsRunning(isRunning: Bool) async throws
}

protocol AParticle {
    var x: Float { get }
    var y: Float { get }
    var heading: Float { get }
}

protocol AFeature {
    var x: Float { get }
    var y: Float { get }
}

protocol APose {
    var x: Float { get }
    var y: Float { get }
    var heading: Float { get }
}

protocol ASlamSettings {
    var numParticles: Int32 { get }
    var sensorDistVar: Float { get }
    var sensorAngVar: Float { get }
}

protocol ASessionSettings {
    var isRunning: Bool { get }
}

protocol AIteration {
    var bestPose: APose { get }
    var odoPose: APose { get }
    var truePose: APose { get }
    var features: [AFeature] { get }
    var particles: [AParticle] { get }
    var slamSettings: ASlamSettings { get }
    var sessionSettings: ASessionSettings { get }
}

protocol Session {
    //    var iteration: AnyPublisher<AIteration, Never> { get }
    //    var currentIteration: AIteration { get }
    var allIterations: [AIteration] { get }

    var robot: MutableRobot { get }
    var map: MutableMap { get }
    var slamSettings: MutableSlamSettings { get }
    var sessionSettings: MutableSessionSettings { get }

    //    var simState: String { get }

    //    var isRunning: Bool { get set }
    //    var isReal: Bool { get }
    //
    func getUpdates() async throws
}

protocol RobotRef {
    //    var id: Int { get }
    var name: String { get }
}

protocol MapRef {
    //    var id: Int { get }
    var name: String { get }
}

protocol Application {
    var allRobots: [RobotRef] { get }
    var allMaps: [MapRef] { get }

    var currentSession: Session? { get }

    func newRobot(robotName: String, isReal: Bool) async throws -> RobotRef
    func newMap(mapName: String) async throws -> MapRef

    func getExistingSession(robot: RobotRef, map: MapRef) async throws
    func newSession(newRobotName: String, newMapName: String) async throws
}
