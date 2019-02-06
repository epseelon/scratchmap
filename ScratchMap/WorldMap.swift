//
//  WorldMap.swift
//  ScratchMap
//
//  Created by Sebastien on 09/10/2018.
//  Copyright © 2018 Epseelon sprl. All rights reserved.
//

import Cocoa

class WorldMap: NSView {
    var backgroundLayer: CALayer = CALayer()
    var countryLayers: [String: CALayer] = [:]
    
    override var frame: CGRect {
        didSet{
            backgroundLayer.frame = frame
            for countryLayerKey in countryLayers.keys {
                countryLayers[countryLayerKey]!.frame = frame
            }
        }
    }
    
    func imageData(withSize size: CGSize) -> Data {
        return self.layer!.data(using: .jpeg, size: size)
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        configureBackgroundLayer()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        configureBackgroundLayer()
    }
    
    func configureBackgroundLayer() {
        self.wantsLayer = true
        
        backgroundLayer.contentsGravity = .resizeAspect
        backgroundLayer.backgroundColor = .black
        backgroundLayer.contents = NSImage(named: "world")!.tint(color: .white)
        backgroundLayer.frame = self.layer!.frame
        backgroundLayer.delegate = self
        self.layer!.addSublayer(backgroundLayer)
    }
    
    func scratch(country: String) {
        let countryLayer = CALayer()
        countryLayer.contentsGravity = .resizeAspect
        countryLayer.contents = NSImage(named: country)
        countryLayer.frame = self.layer!.frame
        countryLayer.delegate = self
        self.countryLayers[country] = countryLayer
        self.layer!.addSublayer(countryLayer)
    }
}

extension WorldMap: CALayerDelegate {
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return NSNull()
    }
}
