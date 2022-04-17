//
//  Lock.swift
//  Kaly2iOS
//
//  Created by Joel Thiessen on 2022-02-20.
//

import Foundation

// After SwiftNIO:
// https://github.com/apple/swift-nio/blob/main/Sources/NIOConcurrencyHelpers/lock.swift
public final class Lock {
    private let mutex: UnsafeMutablePointer<pthread_mutex_t> =
        UnsafeMutablePointer.allocate(capacity: 1)

    public init() {
        var attr = pthread_mutexattr_t()
        pthread_mutexattr_init(&attr)
        debugOnly {
            pthread_mutexattr_settype(&attr, .init(PTHREAD_MUTEX_ERRORCHECK))
        }

        let err = pthread_mutex_init(mutex, &attr)
        precondition(err == 0, "\(#function) failed in pthread_mutex with error \(err)")
    }

    deinit {
        let err = pthread_mutex_destroy(self.mutex)
        precondition(err == 0, "\(#function) failed in pthread_mutex with error \(err)")
        mutex.deallocate()
    }

    public func lock() {
        let err = pthread_mutex_lock(mutex)
        precondition(err == 0, "\(#function) failed in pthread_mutex with error \(err)")
    }

    public func unlock() {
        let err = pthread_mutex_unlock(mutex)
        precondition(err == 0, "\(#function) failed in pthread_mutex with error \(err)")
    }
}

@inlinable
internal func debugOnly(_ body: () -> Void) {
    assert({ body(); return true }())
}
