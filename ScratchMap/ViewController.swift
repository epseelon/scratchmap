//
//  ViewController.swift
//  ScratchMap
//
//  Created by Sebastien on 07/10/2018.
//  Copyright © 2018 Epseelon sprl. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var mapImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func setAsDesktopWallpaperButtonClicked(_ sender: Any) {
        if let documentsDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let mapFile = documentsDirectoryUrl.appendingPathComponent("scratchmap.png")
            let mapData = self.mapImageView.data()
            do {
                try mapData.write(to: mapFile)
                print(mapFile.path)
                try Wallpaper.set(mapFile, screen: .main, scale: .fit)
            } catch(let error) {
                print(error.localizedDescription)
            }
        }
    }
    
}

