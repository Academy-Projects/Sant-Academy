//
//  Sant_AcademyApp.swift
//  Sant Academy
//
//  Created by kevin marinho on 12/12/22.
//

import SwiftUI

@main
struct Sant_AcademyApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate .self) var appDelegate
   
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MasterView()
            }
           
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
