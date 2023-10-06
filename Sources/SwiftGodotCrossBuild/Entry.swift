//
//  Entry.swift
//
//
//  Created by Alex Loren on 10/3/23.
//

import SwiftGodot
import SwiftGodotMacros

#if os(macOS)

#initSwiftExtension(cdecl: "swift_entry_point", types: [SpinningCube.self])

#else

func setupScene(level: GDExtension.InitializationLevel) {
	if level == .scene {
		register(type: SpinningCube.self)
	}
}

@_cdecl("swift_entry_point")
public func swift_entry_point(
	interfacePtr: OpaquePointer?,
	libraryPtr: OpaquePointer?,
	extensionPtr: OpaquePointer?
) -> UInt8 {
	print("Extension loaded.")
	guard let interfacePtr, let libraryPtr, let extensionPtr else {
		print("Error: Some parameters were not provided!")
		return 0
	}
	initializeSwiftModule(interfacePtr, libraryPtr, extensionPtr, initHook: setupScene, deInitHook: { x in })
	return 1
}

#endif
