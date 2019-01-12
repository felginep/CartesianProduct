/// -------- 2 types A1, A2--------

public struct CartesianProduct2Iterator<A1, A2>: IteratorProtocol where A1: IteratorProtocol, A2: Collection {

    public typealias Element = (A1.Element, A2.Element)

    private var a1Iterator: A1
    private let a2Collection: A2
    private var a1: A1.Element?
    private var a2Iterator: A2.Iterator

    public init(_ a1s: A1, _ a2s: A2) {
        a1Iterator = a1s
        a2Collection = a2s
        a1 = a1Iterator.next()
        a2Iterator = a2Collection.makeIterator()
    }

    public mutating func next() -> Element? {
        guard !a2Collection.isEmpty else { return nil }
        guard let someA1 = a1 else { return nil }
        guard let someA2 = a2Iterator.next() else {
            a2Iterator = a2Collection.makeIterator()
            a1 = a1Iterator.next()
            return next()
        }
        return (someA1, someA2)
    }
}

public struct CartesianProduct2Sequence<A1, A2>: Sequence
    where A1: Sequence, A2: Collection {

    public typealias Iterator = CartesianProduct2Iterator<A1.Iterator, A2>

    private let a1s: A1
	private let a2s: A2

    public init(_ a1s: A1, _ a2s: A2) {
        self.a1s = a1s
		self.a2s = a2s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s)
    }
}

public func product<A1, A2>(_ a1s: A1, _ a2s: A2) -> CartesianProduct2Sequence<A1, A2>
    where A1: Sequence, A2: Collection {
        return CartesianProduct2Sequence(a1s, a2s)
}

/// -------- 3 types A1, A2, A3--------

public struct CartesianProduct3Iterator<A1, A2, A3>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct2Iterator<A1, A2>, A3>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3) {
        let productIterator = CartesianProduct2Iterator(a1s, a2s)
        finalIterator = CartesianProduct2Iterator(productIterator, a3s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.1)
    }
}

public struct CartesianProduct3Sequence<A1, A2, A3>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection {

    public typealias Iterator = CartesianProduct3Iterator<A1.Iterator, A2, A3>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s)
    }
}

public func product<A1, A2, A3>(_ a1s: A1, _ a2s: A2, _ a3s: A3) -> CartesianProduct3Sequence<A1, A2, A3>
    where A1: Sequence, A2: Collection, A3: Collection {
        return CartesianProduct3Sequence(a1s, a2s, a3s)
}

/// -------- 4 types A1, A2, A3, A4--------

public struct CartesianProduct4Iterator<A1, A2, A3, A4>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct3Iterator<A1, A2, A3>, A4>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4) {
        let productIterator = CartesianProduct3Iterator(a1s, a2s, a3s)
        finalIterator = CartesianProduct2Iterator(productIterator, a4s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.1)
    }
}

public struct CartesianProduct4Sequence<A1, A2, A3, A4>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection {

    public typealias Iterator = CartesianProduct4Iterator<A1.Iterator, A2, A3, A4>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s)
    }
}

public func product<A1, A2, A3, A4>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4) -> CartesianProduct4Sequence<A1, A2, A3, A4>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection {
        return CartesianProduct4Sequence(a1s, a2s, a3s, a4s)
}

/// -------- 5 types A1, A2, A3, A4, A5--------

public struct CartesianProduct5Iterator<A1, A2, A3, A4, A5>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct4Iterator<A1, A2, A3, A4>, A5>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5) {
        let productIterator = CartesianProduct4Iterator(a1s, a2s, a3s, a4s)
        finalIterator = CartesianProduct2Iterator(productIterator, a5s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.1)
    }
}

public struct CartesianProduct5Sequence<A1, A2, A3, A4, A5>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection {

    public typealias Iterator = CartesianProduct5Iterator<A1.Iterator, A2, A3, A4, A5>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s)
    }
}

public func product<A1, A2, A3, A4, A5>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5) -> CartesianProduct5Sequence<A1, A2, A3, A4, A5>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection {
        return CartesianProduct5Sequence(a1s, a2s, a3s, a4s, a5s)
}

/// -------- 6 types A1, A2, A3, A4, A5, A6--------

public struct CartesianProduct6Iterator<A1, A2, A3, A4, A5, A6>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct5Iterator<A1, A2, A3, A4, A5>, A6>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6) {
        let productIterator = CartesianProduct5Iterator(a1s, a2s, a3s, a4s, a5s)
        finalIterator = CartesianProduct2Iterator(productIterator, a6s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.1)
    }
}

public struct CartesianProduct6Sequence<A1, A2, A3, A4, A5, A6>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection {

    public typealias Iterator = CartesianProduct6Iterator<A1.Iterator, A2, A3, A4, A5, A6>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s)
    }
}

public func product<A1, A2, A3, A4, A5, A6>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6) -> CartesianProduct6Sequence<A1, A2, A3, A4, A5, A6>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection {
        return CartesianProduct6Sequence(a1s, a2s, a3s, a4s, a5s, a6s)
}

/// -------- 7 types A1, A2, A3, A4, A5, A6, A7--------

public struct CartesianProduct7Iterator<A1, A2, A3, A4, A5, A6, A7>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct6Iterator<A1, A2, A3, A4, A5, A6>, A7>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7) {
        let productIterator = CartesianProduct6Iterator(a1s, a2s, a3s, a4s, a5s, a6s)
        finalIterator = CartesianProduct2Iterator(productIterator, a7s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.1)
    }
}

public struct CartesianProduct7Sequence<A1, A2, A3, A4, A5, A6, A7>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection {

    public typealias Iterator = CartesianProduct7Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7) -> CartesianProduct7Sequence<A1, A2, A3, A4, A5, A6, A7>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection {
        return CartesianProduct7Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s)
}

/// -------- 8 types A1, A2, A3, A4, A5, A6, A7, A8--------

public struct CartesianProduct8Iterator<A1, A2, A3, A4, A5, A6, A7, A8>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct7Iterator<A1, A2, A3, A4, A5, A6, A7>, A8>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8) {
        let productIterator = CartesianProduct7Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s)
        finalIterator = CartesianProduct2Iterator(productIterator, a8s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.1)
    }
}

public struct CartesianProduct8Sequence<A1, A2, A3, A4, A5, A6, A7, A8>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection {

    public typealias Iterator = CartesianProduct8Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8) -> CartesianProduct8Sequence<A1, A2, A3, A4, A5, A6, A7, A8>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection {
        return CartesianProduct8Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s)
}

/// -------- 9 types A1, A2, A3, A4, A5, A6, A7, A8, A9--------

public struct CartesianProduct9Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct8Iterator<A1, A2, A3, A4, A5, A6, A7, A8>, A9>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9) {
        let productIterator = CartesianProduct8Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s)
        finalIterator = CartesianProduct2Iterator(productIterator, a9s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.1)
    }
}

public struct CartesianProduct9Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection {

    public typealias Iterator = CartesianProduct9Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9) -> CartesianProduct9Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection {
        return CartesianProduct9Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s)
}

/// -------- 10 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10--------

public struct CartesianProduct10Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct9Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9>, A10>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10) {
        let productIterator = CartesianProduct9Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s)
        finalIterator = CartesianProduct2Iterator(productIterator, a10s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.1)
    }
}

public struct CartesianProduct10Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection {

    public typealias Iterator = CartesianProduct10Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10) -> CartesianProduct10Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection {
        return CartesianProduct10Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s)
}

/// -------- 11 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11--------

public struct CartesianProduct11Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element, A11.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct10Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10>, A11>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11) {
        let productIterator = CartesianProduct10Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s)
        finalIterator = CartesianProduct2Iterator(productIterator, a11s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.0.9, element.1)
    }
}

public struct CartesianProduct11Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection {

    public typealias Iterator = CartesianProduct11Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10
	private let a11s: A11

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
		self.a11s = a11s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11) -> CartesianProduct11Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection {
        return CartesianProduct11Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s)
}

/// -------- 12 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12--------

public struct CartesianProduct12Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element, A11.Element, A12.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct11Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11>, A12>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12) {
        let productIterator = CartesianProduct11Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s)
        finalIterator = CartesianProduct2Iterator(productIterator, a12s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.0.9, element.0.10, element.1)
    }
}

public struct CartesianProduct12Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection {

    public typealias Iterator = CartesianProduct12Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10
	private let a11s: A11
	private let a12s: A12

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
		self.a11s = a11s
		self.a12s = a12s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12) -> CartesianProduct12Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection {
        return CartesianProduct12Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s)
}

/// -------- 13 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13--------

public struct CartesianProduct13Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element, A11.Element, A12.Element, A13.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct12Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12>, A13>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13) {
        let productIterator = CartesianProduct12Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s)
        finalIterator = CartesianProduct2Iterator(productIterator, a13s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.0.9, element.0.10, element.0.11, element.1)
    }
}

public struct CartesianProduct13Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection {

    public typealias Iterator = CartesianProduct13Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10
	private let a11s: A11
	private let a12s: A12
	private let a13s: A13

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
		self.a11s = a11s
		self.a12s = a12s
		self.a13s = a13s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13) -> CartesianProduct13Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection {
        return CartesianProduct13Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s)
}

/// -------- 14 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14--------

public struct CartesianProduct14Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element, A11.Element, A12.Element, A13.Element, A14.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct13Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13>, A14>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14) {
        let productIterator = CartesianProduct13Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s)
        finalIterator = CartesianProduct2Iterator(productIterator, a14s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.0.9, element.0.10, element.0.11, element.0.12, element.1)
    }
}

public struct CartesianProduct14Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection {

    public typealias Iterator = CartesianProduct14Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10
	private let a11s: A11
	private let a12s: A12
	private let a13s: A13
	private let a14s: A14

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
		self.a11s = a11s
		self.a12s = a12s
		self.a13s = a13s
		self.a14s = a14s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s, a14s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14) -> CartesianProduct14Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection {
        return CartesianProduct14Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s, a14s)
}

/// -------- 15 types A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15--------

public struct CartesianProduct15Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15>: IteratorProtocol
    where A1: IteratorProtocol, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection, A15: Collection {

    public typealias Element = (A1.Element, A2.Element, A3.Element, A4.Element, A5.Element, A6.Element, A7.Element, A8.Element, A9.Element, A10.Element, A11.Element, A12.Element, A13.Element, A14.Element, A15.Element)

    private var finalIterator: CartesianProduct2Iterator<CartesianProduct14Iterator<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14>, A15>

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14, _ a15s: A15) {
        let productIterator = CartesianProduct14Iterator(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s, a14s)
        finalIterator = CartesianProduct2Iterator(productIterator, a15s)
    }

    public mutating func next() -> Element? {
        guard let element = finalIterator.next() else {
            return nil
        }
        return (element.0.0, element.0.1, element.0.2, element.0.3, element.0.4, element.0.5, element.0.6, element.0.7, element.0.8, element.0.9, element.0.10, element.0.11, element.0.12, element.0.13, element.1)
    }
}

public struct CartesianProduct15Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15>: Sequence
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection, A15: Collection {

    public typealias Iterator = CartesianProduct15Iterator<A1.Iterator, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15>

    private let a1s: A1
	private let a2s: A2
	private let a3s: A3
	private let a4s: A4
	private let a5s: A5
	private let a6s: A6
	private let a7s: A7
	private let a8s: A8
	private let a9s: A9
	private let a10s: A10
	private let a11s: A11
	private let a12s: A12
	private let a13s: A13
	private let a14s: A14
	private let a15s: A15

    public init(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14, _ a15s: A15) {
        self.a1s = a1s
		self.a2s = a2s
		self.a3s = a3s
		self.a4s = a4s
		self.a5s = a5s
		self.a6s = a6s
		self.a7s = a7s
		self.a8s = a8s
		self.a9s = a9s
		self.a10s = a10s
		self.a11s = a11s
		self.a12s = a12s
		self.a13s = a13s
		self.a14s = a14s
		self.a15s = a15s
    }

    public func makeIterator() -> Iterator {
        return Iterator(a1s.makeIterator(), a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s, a14s, a15s)
    }
}

public func product<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15>(_ a1s: A1, _ a2s: A2, _ a3s: A3, _ a4s: A4, _ a5s: A5, _ a6s: A6, _ a7s: A7, _ a8s: A8, _ a9s: A9, _ a10s: A10, _ a11s: A11, _ a12s: A12, _ a13s: A13, _ a14s: A14, _ a15s: A15) -> CartesianProduct15Sequence<A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12, A13, A14, A15>
    where A1: Sequence, A2: Collection, A3: Collection, A4: Collection, A5: Collection, A6: Collection, A7: Collection, A8: Collection, A9: Collection, A10: Collection, A11: Collection, A12: Collection, A13: Collection, A14: Collection, A15: Collection {
        return CartesianProduct15Sequence(a1s, a2s, a3s, a4s, a5s, a6s, a7s, a8s, a9s, a10s, a11s, a12s, a13s, a14s, a15s)
}

