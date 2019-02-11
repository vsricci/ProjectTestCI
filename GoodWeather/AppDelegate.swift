//
//  AppDelegate.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 30/01/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootViewController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
        
    }

    private lazy var appCoordinator : Coordinator = self.makeCoordinator()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //MARK: Custom color navigationController
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
//        UIBarButtonItem.appearance().tintColor = .white
//        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setupDefaultsSettings()
        
        appCoordinator.start()
       
        return true
    }
    
    
    
    func makeCoordinator() -> Coordinator {
        return AppCoordinator(router: AppRouter(rootController: self.rootViewController), coordinatorFactory: AppCordinatorFactory())
    }
    
    private func setupDefaultsSettings() {
        
        let userDefaults = UserDefaults.standard
        if userDefaults.value(forKey: "unit") == nil {
            userDefaults.set(Unit.fahrenheit.rawValue, forKey: "unit")
        }
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

