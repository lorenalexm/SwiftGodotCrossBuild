//
//  SpinningCube.swift
//  
//
//  Created by Alex Loren on 10/3/23.
//

import SwiftGodot
import SwiftGodotMacros

@Godot
class SpinningCube: Node3D {
    public override func _ready() {
        let renderer = MeshInstance3D()
        renderer.mesh = BoxMesh()
        addChild(node: renderer)
    }
    
    public override func _process(delta: Double) {
        rotateY(angle: delta)
    }
}
