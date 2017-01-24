//
//  Model.swift
//  SKRotationDemo
//
//  Created by Johanna Wilder on 1/23/17.
//  Copyright © 2017 Emojiency. All rights reserved.
//

import Foundation
import SpriteKit


// http://stackoverflow.com/questions/29179692/how-can-i-convert-from-degrees-to-radians#29179878

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / .pi }
    }

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
    }


enum orientation {
    case portrait
    case upsideDown
    case landscapeLeft
    case landscapeRight
    case error
    }

class DeviceOrientation {
    var deviceIsOriented: orientation {
        get {
            // Orientation values range from -180 degrees to 180 degrees.
            // Portrait is a -90 degree vector pointing downward.
            // Dividing the quadrants into 90 degree quarters, offset by 45 degrees.
            // I think in degrees, but everythings done in radians, of course.
            print(theDeviceOrientation.gravityVector.radiansToDegrees)
            if theDeviceOrientation.gravityVector > CGFloat(45).degreesToRadians && theDeviceOrientation.gravityVector < CGFloat(135).degreesToRadians {
                return .upsideDown
                }
            if theDeviceOrientation.gravityVector > CGFloat(135).degreesToRadians || theDeviceOrientation.gravityVector < CGFloat(-135).degreesToRadians {
                return .landscapeLeft
                }
            if theDeviceOrientation.gravityVector > CGFloat(-135).degreesToRadians && theDeviceOrientation.gravityVector < CGFloat(-45).degreesToRadians {
                return .portrait
                }
            if theDeviceOrientation.gravityVector > CGFloat(-45).degreesToRadians && theDeviceOrientation.gravityVector < CGFloat(45).degreesToRadians {
                return .landscapeRight
            }
           
            return .error
                }
        set {
            
            }
        }
    var orientations:[orientation: String] = [.portrait: "Portrait", .upsideDown: "Upside Down", .landscapeLeft: "Landsape Left", .landscapeRight: "Landscape Right"]
    var motionGravity: (x: Double, y: Double) = (0.0, 0.0)
    var gravityVector: CGFloat {
        get {
            // Trigonometry!
            return CGFloat( atan2(motionGravity.y, motionGravity.x) )
            }
        }
    }

var theDeviceOrientation = DeviceOrientation()
