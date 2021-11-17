//
//  SessionClientImpl.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2021-10-01.
//

import Foundation
import GRPC

struct SessionIterator {
    private var inner: GRPCAsyncResponseStream<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>.Iterator
    mutating func next() async throws -> SubscribeResponseImpl? {
        let resp = try await inner.next()
        return resp.flatMap { SubscribeResponseImpl(resp: $0) }
    }
    
    init(inner: GRPCAsyncResponseStream<Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse>.Iterator) {
        self.inner = inner
    }
}

class SessionClientImpl : SessionClient {
//    @Injected var client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient
    let client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient
    
    init(client: Ca_Joelathiessen_Kaly2_Proto_SessionServiceAsyncClient) {
        self.client = client
    }
    func subscribeNew(robotID: Int64, mapID: Int64) async throws -> SessionIterator {
        var req = Ca_Joelathiessen_Kaly2_Proto_SubscribeNewRequest()
        req.robotID = robotID
        req.mapID = mapID
        
        let inner = client.subscribeNew(req).makeAsyncIterator()
        
        return SessionIterator(inner: inner)
    }
}




//
//protocol ConvertableToStream {
//    func convertSelf<B>() -> B
//}


//extension Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse: SubscribeResponse {
//
//}


//
//extension GRPCAsyncResponseStream.Iterator: SubProto {
//    mutating func ne() async throws -> SubscribeResp? where Element == Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse {
//        return try await nextEle()
//    }
//}


//
//struct Ca_Joelathiessen_Kaly2_Proto_Iteration {
//  // SwiftProtobuf.Message conformance is added in an extension below. See the
//  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
//  // methods supported on all messages.
//
//  var iterationNo: Int64 {
//    get {return _storage._iterationNo}
//    set {_uniqueStorage()._iterationNo = newValue}
//  }
//
//  var timestamp: Int64 {
//    get {return _storage._timestamp}
//    set {_uniqueStorage()._timestamp = newValue}
//  }
//
//  var bestPose: Ca_Joelathiessen_Kaly2_Proto_Pose {
//    get {return _storage._bestPose ?? Ca_Joelathiessen_Kaly2_Proto_Pose()}
//    set {_uniqueStorage()._bestPose = newValue}
//  }
//  /// Returns true if `bestPose` has been explicitly set.
//  var hasBestPose: Bool {return _storage._bestPose != nil}
//  /// Clears the value of `bestPose`. Subsequent reads from it will return its default value.
//  mutating func clearBestPose() {_uniqueStorage()._bestPose = nil}
//
//  var odoPose: Ca_Joelathiessen_Kaly2_Proto_Pose {
//    get {return _storage._odoPose ?? Ca_Joelathiessen_Kaly2_Proto_Pose()}
//    set {_uniqueStorage()._odoPose = newValue}
//  }
//  /// Returns true if `odoPose` has been explicitly set.
//  var hasOdoPose: Bool {return _storage._odoPose != nil}
//  /// Clears the value of `odoPose`. Subsequent reads from it will return its default value.
//  mutating func clearOdoPose() {_uniqueStorage()._odoPose = nil}
//
//  var truePose: Ca_Joelathiessen_Kaly2_Proto_Pose {
//    get {return _storage._truePose ?? Ca_Joelathiessen_Kaly2_Proto_Pose()}
//    set {_uniqueStorage()._truePose = newValue}
//  }
//  /// Returns true if `truePose` has been explicitly set.
//  var hasTruePose: Bool {return _storage._truePose != nil}
//  /// Clears the value of `truePose`. Subsequent reads from it will return its default value.
//  mutating func clearTruePose() {_uniqueStorage()._truePose = nil}
//
//  var features: [Ca_Joelathiessen_Kaly2_Proto_Feature] {
//    get {return _storage._features}
//    set {_uniqueStorage()._features = newValue}
//  }
//
//  var particles: [Ca_Joelathiessen_Kaly2_Proto_Particle] {
//    get {return _storage._particles}
//    set {_uniqueStorage()._particles = newValue}
//  }
//
//  var slamSettings: Ca_Joelathiessen_Kaly2_Proto_SlamSettings {
//    get {return _storage._slamSettings ?? Ca_Joelathiessen_Kaly2_Proto_SlamSettings()}
//    set {_uniqueStorage()._slamSettings = newValue}
//  }
//  /// Returns true if `slamSettings` has been explicitly set.
//  var hasSlamSettings: Bool {return _storage._slamSettings != nil}
//  /// Clears the value of `slamSettings`. Subsequent reads from it will return its default value.
//  mutating func clearSlamSettings() {_uniqueStorage()._slamSettings = nil}
//
//  var sessionSettings: Ca_Joelathiessen_Kaly2_Proto_SessionSettings {
//    get {return _storage._sessionSettings ?? Ca_Joelathiessen_Kaly2_Proto_SessionSettings()}
//    set {_uniqueStorage()._sessionSettings = newValue}
//  }
//  /// Returns true if `sessionSettings` has been explicitly set.
//  var hasSessionSettings: Bool {return _storage._sessionSettings != nil}
//  /// Clears the value of `sessionSettings`. Subsequent reads from it will return its default value.
//  mutating func clearSessionSettings() {_uniqueStorage()._sessionSettings = nil}
//
//  var unknownFields = SwiftProtobuf.UnknownStorage()
//
//  init() {}
//
//  fileprivate var _storage = _StorageClass.defaultInstance
//}

//struct SesIterator<T: ConvertableToStream, B> {
//    private var inner: GRPCAsyncResponseStream<T>.Iterator
//    mutating func next() async throws -> B? {
//        let resp = try await inner.next()
//        return resp.flatMap { $0.convertSelf() } //SubscribeResponse(resp: $0) }
//    }
//
//    init<T: ConvertableToStream>(inner: GRPCAsyncResponseStream<T>.Iterator) {
//
//    }
//}

//protocol SubProto {
//    mutating func nextEle() async throws -> SubscribeResp?
//}
//
//extension GRPCAsyncResponseStream.Iterator: SubProto {
//    mutating func nextEle() async throws -> SubscribeResp? {
//        return try await self.next()
//            .flatMap { $0 as? Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse }
//            .flatMap { SubscribeResp(resp: $0) }
//    }
//}
//
//struct SubscribeResp {
//    init(resp: Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse) {
//
//    }
//}

//extension

//struct SesIterator<T: ConvertableToStream, B> {
//    private var inner: GRPCAsyncResponseStream<T>.Iterator
//    mutating func next() async throws -> B? {
//        let resp = try await inner.next()
//        return resp.flatMap { $0.convertSelf() } //SubscribeResponse(resp: $0) }
//    }
//
//    init<T: ConvertableToStream>(inner: GRPCAsyncResponseStream<T>.Iterator) {
//
//    }
//}

//extension GRPCAsyncResponseStream.Iterator: SesIterator {
//    mutating func nextResp() async throws -> SubscribeResponse? {
//
//    }
//}

//extension Ca_Joelathiessen_Kaly2_Proto_SubscribeResponse: ConvertableToStream {
//    func convertSelf<T>() -> T {
//        return SubscribeResponse(iteration: Iteration(itr: <#T##Ca_Joelathiessen_Kaly2_Proto_Iteration#>))
//    }
//}


//protocol Iteration {
//    var iterationNo: Int64 { get }
//    var timestamp: Int64 { get }
//    var bestPose: Pose { get }
//    var odoPose: Pose { get }
//    var truePose: Pose { get }
//    var features: [Feature] { get }
//    var particles: [Particle] { get }
//    var slamSettings: SlamSettings { get }
//    var sessionSettings: SessionSettings { get }
//}
//
//
//
//
//
//
//
//extension Ca_Joelathiessen_Kaly2_Proto_Iteration: Iteration {
//    var bestPose: Pose {
//        <#code#>
//    }
//
//    var odoPose: Pose {
//        <#code#>
//    }
//
//    var truePose: Pose {
//        <#code#>
//    }
//
//    var features: [Feature] {
//        <#code#>
//    }
//
//    var particles: [Particle] {
//        <#code#>
//    }
//
//    var slamSettings: SlamSettings {
//        <#code#>
//    }
//
//    var sessionSettings: SessionSettings {
//        <#code#>
//    }
//
//}


//
//struct Iteration {
//    private let inner: Ca_Joelathiessen_Kaly2_Proto_Iteration
//    var bestPose: Pose {
//        inner.bestPose
//    }
//
//    var odoPose: Pose {
//        inner.odoPose
//    }
//
//    var truePose: Pose {
//        inner.truePose
//    }
//
//    var features: [Feature] {
//        inner.features
//    }
//
//    var particles: [Particle] {
//        inner.particles
//    }
//
//    var slamSettings: SlamSettings {
//        inner.slamSettings
//    }
//
//    var sessionSettings: SessionSettings {
//        inner.sessionSettings
//    }
//
//}
