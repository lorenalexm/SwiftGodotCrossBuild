//
//  SpinningCube.swift
//  
//
//  Created by Alex Loren on 10/3/23.
//

import SwiftGodot

class SpinningCube: Node3D {
	required init(nativeHandle _: UnsafeRawPointer) {
		fatalError("init(nativeHandle:) called, it is a sign that something is wrong, as these objects should not be re-hydrated")
	}

	required init() {
		SpinningCube._initClass
		super.init()
	}

	static var _initClass: Void = {
		let className = StringName("SpinningCube")
		let classInfo = ClassInfo<SpinningCube>(name: className)
	} ()


    public override func _ready() {
        let renderer = MeshInstance3D()
        renderer.mesh = BoxMesh()
        addChild(node: renderer)
    }
    
    public override func _process(delta: Double) {
        rotateY(angle: delta)
    }
}
