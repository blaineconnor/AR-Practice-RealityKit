//
//  ContentView.swift
//  HelloAR
//
//  Created by Fatih Emre Sarman on 10.07.2024.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        
        let arView = ARView(frame: .zero)
        
        
//            let anchor = AnchorEntity()
//            
//            guard let entity = try? ModelEntity.load(named: "Cosmonaut") else {
//                fatalError("model not found")
//            }
//            
//            anchor.addChild(entity)
//            
//            arView.scene.addAnchor(anchor)
        
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
        
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        
//        let anchor = AnchorEntity(plane: .horizontal)
//        
//        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
//        box.generateCollisionShapes(recursive: true)
//        
//        anchor.addChild(box)
        
//        let material = SimpleMaterial(color: .blue, isMetallic: true)
//
//        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
//
//        let sphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.3), materials: [SimpleMaterial(color: .yellow, isMetallic: true)])
//        sphere.position = simd_make_float3(0, 0.4, 0)
//
//        let plane = ModelEntity(mesh: MeshResource.generatePlane(width: 0.5, depth: 0.5
//                                                                ), materials: [SimpleMaterial(color: .red, isMetallic: true)])
//        plane.position = simd_make_float3(0, 0.7, 0)
//        
//        anchor.addChild(box)
//        anchor.addChild(sphere)
//        anchor.addChild(plane)
//        arView.scene.anchors.append(anchor)

//        // Create a cube model
//        let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//        let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
//        let model = ModelEntity(mesh: mesh, materials: [material])
//        model.transform.translation.y = 0.05
//
//        // Create horizontal plane anchor for the content
//        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//        anchor.children.append(model)
//
//        // Add the horizontal plane anchor to the scene
//        arView.scene.anchors.append(anchor)

        return arView
        
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}
