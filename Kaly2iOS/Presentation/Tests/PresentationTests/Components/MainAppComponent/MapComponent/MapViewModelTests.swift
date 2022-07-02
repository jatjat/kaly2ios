//
//  MapViewModelTests.swift
//  presentation-tests
//
//  Created by Joel Thiessen on 2022-04-20.
//

import Combine
import Foundation
@testable import Presentation
// import SwiftUI
import XCTest

class MapViewTests: XCTestCase {
//    @ObservedObject var sut: MapViewModel
    var sut: MapViewModel!

//    override init() {
//        super.init()
//    }
//    override func setUpWithError() throws {
//        sut =
//    }
//
//    override func tearDownWithError() throws {
//    }

//    func esttestInitialMap() throws {
//        // GIVEN
//        // WHEN
//        await sut.onAppear()
    ////        sut.onDissappear()
//
    //////        let bestPoses = sut.$bestPoses.collect(2).compactMap { $0 }
    ////        let bestPoses = sut.$bestPoses//.dropFirst()
    //////        let bestPoses = sut.bestPoses//.dropFirst()
    //////        let bestPoses = sut.$bestPoses.collect(2).first()
    ////
    //////        let seq = try await bestPoses.asyncStream().next()?.first
    ////        let stream = bestPoses.asyncStream()
    ////        await try stream.next()
    ////        let seq = try await stream.next()
    //////        let seq = try await bestPoses.asyncStream().next()
    ////        let sequn = try XCTUnwrap(seq)
    ////        let first = try XCTUnwrap(sequn.first)
    ////
    ////        try awaitPublisher(bestPoses)
//        // THEN
//
//
//
//        let best = try awaitPublisher(sut.$bestPoses.collectNext(1))
//
    ////        let best = try awaitPublisher(sut.bestPoses.$array.collectNext(1).$array)
//        let first = try XCTUnwrap(best.first?.first)
//        XCTAssertEqual(first.x, 0)
//        XCTAssertEqual(first.y, 0)
//        XCTAssertEqual(first.heading, 0)
    ////        sut.onDissappear()
//    }

    func esttestPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testMapAgain() async throws {
//        sut = await MapViewModel(updateMapUseCase: UpdateMapUseCase())
        sut = MapViewModel(updateMapUseCase: UpdateMapUseCase())

        sut.onAppear()

        let bob = try await awaitPublisherV2(sut.$bestPoses)

        var counter = 0
        var itr = bob.makeAsyncIterator()

        let next = try await itr.next()
        do {
            for try await quake in bob {
                print("Quake: \(quake.first?.x)")
                if counter > 10 {
                    break
                }
                counter += 1
            }
            print("Stream done.")
        } catch {
            print("Error: \(error)")
        }

//        XCTAssertEqual(next?.first?.x, 0)
    }
}

// extension Published.Publisher {
//    func collectNext(_ count: Int) -> AnyPublisher<[Output], Never> {
//        self.dropFirst()
//            .collect(count)
//            .first()
//            .eraseToAnyPublisher()
//    }
// }
//
//// See: https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
// extension XCTestCase {
//    func awaitPublisher<T: Publisher>(
//        _ publisher: T,
//        timeout: TimeInterval = 10,
//        file: StaticString = #file,
//        line: UInt = #line
//    ) throws -> T.Output {
//        var result: Result<T.Output, Error>?
//        let expectation = self.expectation(description: "Awaiting publisher")
//
//        let cancellable = publisher
//            .receive(on: RunLoop.main)
// .sink(
//            receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    result = .failure(error)
//                case .finished:
//                    break
//                }
//
//                expectation.fulfill()
//            },
//            receiveValue: { value in
//                result = .success(value)
//            }
//        )
//
//        wait(for: [expectation], timeout: timeout)
//
////        let results = XCTWaiter().wait(for: [expectation], timeout: timeout)
////        results == .completed
////        waitForExpectations(timeout: timeout)
//        cancellable.cancel()
//
//        let unwrappedResult = try XCTUnwrap(
//            result,
//            "Awaited publisher did not produce any output",
//            file: file,
//            line: line
//        )
//
//        return try unwrappedResult.get()
//    }
// }

// See: https://www.swiftbysundell.com/articles/unit-testing-combine-based-swift-code/
extension XCTestCase {
    func awaitPublisherV2<T: Publisher>(
        _ publisher: T,
        timeout _: TimeInterval = 10,
        file _: StaticString = #file,
        line _: UInt = #line
    ) throws -> AsyncThrowingStream<T.Output, Error> {
        AsyncThrowingStream { cont in
            var cancellable: AnyCancellable?
//            async var termm: AsyncThrowingStream<T.Output, Error>.Continuation.Termination? = nil

//            @Sendable func doo() {
//                DispatchQueue.global().async {
//                    cancellable?.cancel()
//                }
//
//            }
            let onCancel = { cancellable?.cancel() }

            cont.onTermination = { @Sendable term in
//                termm = term
                onCancel()
//                q.async {
//                    cancellable?.cancel()
//                }
            }

            let q = DispatchQueue.global(qos: .background)
            cancellable = publisher
                .subscribe(on: q, options: nil)
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case let .failure(error):
                            DispatchQueue.main.async {
                                cont.finish(throwing: error)
                            }
                        case .finished:
                            DispatchQueue.main.async {
                                cont.finish(throwing: nil)
                            }
                        }
                    },
                    receiveValue: { value in
                        DispatchQueue.main.async {
                            cont.yield(value)
                        }
                    }
                )

//        wait(for: [expectation], timeout: timeout)
//
            ////        let results = XCTWaiter().wait(for: [expectation], timeout: timeout)
            ////        results == .completed
            ////        waitForExpectations(timeout: timeout)
//        cancellable.cancel()
//
//        let unwrappedResult = try XCTUnwrap(
//            result,
//            "Awaited publisher did not produce any output",
//            file: file,
//            line: line
//        )

//            cont.resume(with: <#T##Result<T.Output, Error>#>)
        }

//        return try unwrappedResult.get()
    }
    // onCancel: {
//            print("sf")
    ////            cancellable?.cancel()
//        }
//    }
}

// public protocol AwaitablePublisher: Publisher {
// }
//
// public extension AwaitablePublisher where Failure == Error {
//
//    /// Retrieves the result of the publisher as an async function, allowing you to `await` it.
//    ///
//    /// ```swift
//    /// let publisher = somePublisher.first()
//    /// let result = try await publisher.get()
//    /// ```
//    ///
//    /// - Important: If the Publisher never emits your code will stay suspended forever. Be incredibly
//    /// careful when using this.
//    ///
//    func get() async throws -> Output {
//        let subscriber = Subscribers.Await(upstream: self.eraseToAnyPublisher())
//
//        return try await withTaskCancellationHandler {
//            subscriber.cancel()
//
//        } operation: {
//            try await withUnsafeThrowingContinuation { continuation in
//                subscriber.continue { result in
//                    continuation.resume(with: result)
//                }
//            }
//        }
//    }
//
// }
//

//
////
////  Subscriber+Await.swift
////  CombineAsyncually
////
////  Created by Rob Amos on 10/6/21.
////
// import Combine
//
// extension Subscribers {
//
//    final class Await<Input> {
//
//        // MARK: - Properties
//        private let upstream: AnyPublisher<Input, Failure>
//
//        private var upstreamSubscription: Combine.Subscription? = nil
//        private var didEmitValue = false
//
//        private let upstreamLock = UnfairLock()
//        private let emitLock = UnfairLock()
//
//        typealias Continuation = (Result<Input, Failure>) -> Void
//
//        private var continuation: Continuation?
//
//        // MARK: - Initialisation
//        init(upstream: AnyPublisher<Input, Failure>) {
//            self.upstream = upstream
//        }
//
//        // MARK: - Continuing
//        func `continue`(with continuation: @escaping Continuation) {
//            self.continuation = continuation
//            upstream.subscribe(self)
//        }
//
//        func cancel() {
//            upstreamLock.synchronized {
//                upstreamSubscription?.cancel()
//            }
//            cleanup()
//        }
//
//        private func cleanup() {
//            upstreamSubscription = nil
//            continuation = nil
//        }
//
//        // MARK: - Errors
//        enum AwaitError: Error {
//            case upstreamDidNotEmitValue
//        }
//
//    }
// }
//
//// MARK: - Upstream -> Downstream Messaging
// extension Subscribers.Await: Subscriber {
//
//    typealias Input = Input
//    typealias Failure = Error
//
//    // Receive a subscription and request a single element back
//    func receive(subscription: Subscription) {
//        upstreamLock.synchronized {
//            upstreamSubscription = subscription
//            subscription.request(.max(1))
//        }
//    }
//
//    func receive(_ input: Input) -> Subscribers.Demand {
//        emitLock.synchronized {
//            guard didEmitValue == false else {
//                return .none
//            }
//
//            didEmitValue = true
//            continuation?(.success(input))
//            cleanup()
//            return .none
//        }
//    }
//
//    func receive(completion: Subscribers.Completion<Failure>) {
//        emitLock.synchronized {
//            guard didEmitValue == false else {
//                return
//            }
//
//            switch completion {
//            case .finished:
//                continuation?(.failure(AwaitError.upstreamDidNotEmitValue))
//            case .failure(let error):
//                continuation?(.failure(error))
//            }
//        }
//        cleanup()
//    }
//
// }
//
////
////  UnfairLock.swift
////  CombineAsyncually
////
////  Created by Rob Amos on 10/6/21.
////
// import Foundation
//
///// A type of lock or mutex that can be used to synchronise access
///// or execution of code by wrapping `os_unfair_lock`.
/////
///// This lock must be unlocked from the same thread that locked it, attempts to
///// unlock from a different thread will cause an assertion aborting the process.
/////
///// This lock must not be accessed from multiple processes or threads via shared
///// or multiply-mapped memory, the lock implementation relies on the address of
///// the lock value and owning process.
/////
// public class UnfairLock {
//
//    public var mutex = os_unfair_lock()
//
//    public init() {
//        // Intentionally left blank
//    }
//
// }
//
//// MARK: - Lock Implementation
// public extension UnfairLock {
//
//    func lock() {
//        os_unfair_lock_lock(&mutex)
//    }
//
//    func unlock() {
//        os_unfair_lock_unlock(&mutex)
//    }
//
//    func tryLock() -> Bool {
//        os_unfair_lock_trylock(&mutex)
//    }
//
//    func synchronized<T>(_ closure: () throws -> T) rethrows -> T {
//        lock()
//        defer {
//            unlock()
//        }
//        return try closure()
//    }
//
//    func trySynchronized<T>(_ closure: () throws -> T) rethrows -> T? {
//        guard tryLock() else {
//            return nil
//        }
//        defer {
//            unlock()
//        }
//        return try closure()
//    }
//
// }
//
//
//
//
//
//
//
// @available(macOS 12.0, *)
// func awaitUsingExpectation(
//    _ closure: @escaping () async throws -> Void
// ) throws -> Void {
//    let expectation = XCTestExpectation(description: "async test completion")
//    let thrownErrorWrapper = ThrownErrorWrapper()
//
//    Task {
//        defer { expectation.fulfill() }
//
//        do {
//            try await closure()
//        } catch {
//            thrownErrorWrapper.error = error
//        }
//    }
//
//    _ = XCTWaiter.wait(for: [expectation], timeout: 10)
//
//    if let error = thrownErrorWrapper.error {
//        throw error
//    }
// }
//
// private final class ThrownErrorWrapper: @unchecked Sendable {
//
//    private var _error: Error?
//
//    var error: Error? {
//        get {
//            XCTWaiter.subsystemQueue.sync { _error }
//        }
//        set {
//            XCTWaiter.subsystemQueue.sync { _error = newValue }
//        }
//    }
// }
//
//

import Foundation.NSDate // for TimeInterval

struct TimedOutError: Error, Equatable {}

///
/// Execute an operation in the current task subject to a timeout.
///
/// - Parameters:
///   - seconds: The duration in seconds `operation` is allowed to run before timing out.
///   - operation: The async operation to perform.
/// - Returns: Returns the result of `operation` if it completed in time.
/// - Throws: Throws ``TimedOutError`` if the timeout expires before `operation` completes.
///   If `operation` throws an error before the timeout expires, that error is propagated to the caller.
public func withTimeout<R>(
    seconds: TimeInterval,
    operation: @escaping @Sendable () async throws -> R
) async throws -> R {
    try await withThrowingTaskGroup(of: R.self) { group in
        let deadline = Date(timeIntervalSinceNow: seconds)

        // Start actual work.
        group.addTask {
            try await operation()
        }
        // Start timeout child task.
        group.addTask {
            let interval = deadline.timeIntervalSinceNow
            if interval > 0 {
                try await Task.sleep(nanoseconds: UInt64(interval * 1_000_000_000))
            }
            try Task.checkCancellation()
            // We’ve reached the timeout.
            throw TimedOutError()
        }
        // First finished child task wins, cancel the other task.
        let result = try await group.next()!
        group.cancelAll()
        return result
    }
}
