//
//  ImageUtils.swift
//  ScratchMap
//
//  Created by Sebastien on 07/10/2018.
//  Copyright © 2018 Epseelon sprl. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    
    /// Get `NSImage` representation of the view.
    ///
    /// - Returns: `NSImage` of view
    
    func image() -> NSImage {
        let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
        cacheDisplay(in: bounds, to: imageRepresentation)
        return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
    }
    
}

extension NSView {
    
    /// Get `Data` representation of the view.
    ///
    /// - Parameters:
    ///   - fileType: The format of file. Defaults to PNG.
    ///   - properties: A dictionary that contains key-value pairs specifying image properties.
    /// - Returns: `Data` for image.
    
    func data(using fileType: NSBitmapImageRep.FileType = .png, properties: [NSBitmapImageRep.PropertyKey : Any] = [:]) -> Data {
        let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
        cacheDisplay(in: bounds, to: imageRepresentation)
        return imageRepresentation.representation(using: fileType, properties: properties)!
    }
    
}

extension CALayer {
    
    /// Get `NSImage` representation of the layer.
    ///
    /// - Returns: `NSImage` of the layer.
    
    func image() -> NSImage {
        let width = Int(bounds.width * self.contentsScale)
        let height = Int(bounds.height * self.contentsScale)
        let imageRepresentation = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: NSColorSpaceName.deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
        imageRepresentation.size = bounds.size
        
        let context = NSGraphicsContext(bitmapImageRep: imageRepresentation)!
        
        render(in: context.cgContext)
        
        return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
    }
    
}

extension CALayer {
    
    /// Get `Data` representation of the layer.
    ///
    /// - Parameters:
    ///   - fileType: The format of file. Defaults to PNG.
    ///   - properties: A dictionary that contains key-value pairs specifying image properties.
    ///
    /// - Returns: `Data` for image.
    
    func data(using fileType: NSBitmapImageRep.FileType = .png, properties: [NSBitmapImageRep.PropertyKey : Any] = [:]) -> Data {
        let width = Int(bounds.width * self.contentsScale)
        let height = Int(bounds.height * self.contentsScale)
        let imageRepresentation = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: NSColorSpaceName.deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
        imageRepresentation.size = bounds.size
        
        let context = NSGraphicsContext(bitmapImageRep: imageRepresentation)!
        
        render(in: context.cgContext)
        
        return imageRepresentation.representation(using: fileType, properties: properties)!
    }
    
}
