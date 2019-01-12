# CartesianProduct

This library provides a `product` function that creates a lazy cartesian product.

For instance:

```
let sequence = product(["a", "b"], ["c", "d"])
sequence.forEach { tuple in
	print(tuple)
}

// prints
("a", "c")
("a", "d")
("b", "c")
("b", "d")
```

Note that in the example above, `sequence` is a `CartesianProduct2Sequence<Array<String>, Array<String>>` and not a `Array<(String, String)>`. Meaning that `sequence` has not computed all the values of the product of both arrays upfront.

You can pass up to 15 parameters to the `product` function (even if that may not be such a good idea).

## Installing

### Using [Cocoapods](https://cocoapods.org/):

Simply add the following line to your Podfile:

```
pod 'CartesianProduct'
```

### Using [Swift Package Manager](https://swift.org/package-manager/):

To include CartesianProduct into a Swift Package Manager package, add it to the dependencies attribute defined in your `Package.swift` file.

```
dependencies: [
	.Package(url: "https://github.com/felginep/CartesianProduct.git", majorVersion: <majorVersion>, minor: <minor>)
]
```

## Generated content

The `CartesianProduct.swift` file is generated with GYB.

You can download GYB like so:

```
wget https://github.com/apple/swift/raw/master/utils/gyb
wget https://github.com/apple/swift/raw/master/utils/gyb.py
chmod +x gyb
```

Then use `make generate`.

## Running the tests

Run `make test`.

## Authors

* **Pierre Felgines** [Blog](https://felginep.github.io/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* Joshua Emmons for his article [Lazy Cartesian Products in Swift](http://www.figure.ink/blog/2017/7/30/lazy-permutations-in-swift)
