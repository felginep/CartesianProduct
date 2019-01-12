generate:
	gyb --line-directive '' -o Sources/CartesianProduct/CartesianProduct.swift Sources/CartesianProduct/CartesianProduct.swift.gyb

build:
	swift build

test:
	swift test