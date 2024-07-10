//
//  Coordinator.swift
//  HelloAR
//
//  Created by Fatih Emre Sarman on 10.07.2024.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        
        guard let view = self.view else {return}
        
        guard view.scene.anchors.first(where: { $0.name == "LunarRoverAnchor"}) == nil else {
            return
        }
        
        let tapLocation = recognizer.location(in: view)
        
        
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            let anchor = AnchorEntity(raycastResult: result)
            
            cancellable = ModelEntity.loadAsync(named: "shoe")
                .append(ModelEntity.loadAsync(named: "teapot"))
                .collect()
                .sink { loadCompletion in
                    if case let .failure(error) = loadCompletion {
                        print("Unable to load model \(error)")
                    }
                    
                    self.cancellable?.cancel()
                    
                } receiveValue: { entities in
                    
//                    var x: Float = 0.0
                    
                    entities.forEach { entity in
                        anchor.name = "LunarRoverAnchor"
                        anchor.addChild(entity)
//                        entity.position = simd_make_float3(x,0,0)
//                        anchor.addChild(entity)
//                        x += 0.3
                    }
        }
        
//        if let result = results.first {
//            //ARAnchor - ARKit Framework
//            //AnchorEntity - RealityKit Framework
//            
//            
//            let anchor = AnchorEntity(raycastResult: result)
//            
//            guard let entity = try? ModelEntity.load(named: "Cosmonaut") else {
//                fatalError("model not found")
//            }
//            
//            anchor.addChild(entity)
            
            view.scene.addAnchor(anchor)
            
            
            
            
//            let anchor = ARAnchor(name: "Plane Anchor", transform: result.worldTransform)
//            view.session.add(anchor: anchor)
            
//            let anchorEntity = AnchorEntity(raycastResult: result)
//            
//            let modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 0.3))
//            modelEntity.generateCollisionShapes(recursive: true)
//            modelEntity.model?.materials = [SimpleMaterial(color: .blue, isMetallic: true)]
            
//            let anchorEntity = AnchorEntity(anchor: anchor)
//            anchorEntity.addChild(modelEntity)
            
//            view.scene.addAnchor(anchorEntity)
//            
//            view.installGestures(.all, for: modelEntity)
        }
        
        //        if let entity = view.entity(at: tapLocation) as? ModelEntity {
        //            let material = SimpleMaterial(color: UIColor.random(), isMetallic: true)
        //            entity.model?.materials = [material]
        //        }
        
    }
    
}
