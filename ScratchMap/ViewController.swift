//
//  ViewController.swift
//  ScratchMap
//
//  Created by Sebastien on 07/10/2018.
//  Copyright © 2018 Epseelon sprl. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func setAsDesktopWallpaperButtonClicked(_ sender: Any) {
        /*if let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let mapFile = documentsDirectoryUrl.appendingPathComponent("scratchmap.png")
            
            //let screenSize = NSScreen.main!.frame.size
            let screenSize = NSScreen.main!.frame.size
            print("Generating wallpaper with size \(screenSize.width)x\(screenSize.height)")
            let mapData = self.countriesView!.imageData(withSize: screenSize)
            do {
                try mapData.write(to: mapFile)
                print(mapFile.path)
                try Wallpaper.set(mapFile, screen: .main, scale: .fit)
            } catch(let error) {
                print(error.localizedDescription)
            }
        }*/
    }
    
}

