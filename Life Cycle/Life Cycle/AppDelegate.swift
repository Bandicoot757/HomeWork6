//
//  AppDelegate.swift
//  Life Cycle
//
//  Created by Stanislav Leontyev on 03.12.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: TabBarController())
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("Произошло переключение на другое приложение")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Приложение активно")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Приложение перешло в фоновый режим")
        
        // В бэкграунде выполняется логин на страницу профиля (LoginViewController: 96 строка)
        // Время работы 30 секунд

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Приложение перешло в обычный режим")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("Приложение было закрыто")
    }
    
}
