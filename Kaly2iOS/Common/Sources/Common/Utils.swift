// From: https://www.avanderlee.com/swift/unwrap-or-throw/
infix operator ?!: NilCoalescingPrecedence

/// Throws the right hand side error if the left hand side optional is `nil`.
public func ?! <T>(value: T?, error: @autoclosure () -> Error) throws -> T {
    guard let value = value else {
        throw error()
    }
    return value
}
