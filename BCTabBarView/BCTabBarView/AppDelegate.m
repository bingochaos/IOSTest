//
//  AppDelegate.m
//  BCTabBarView
//
//  Created by 黄斌超 on 15/9/9.
//  Copyright (c) 2015年 bingoc. All rights reserved.
//

#import "AppDelegate.h"
#import "BCTabBarViewController.h"
#import "BCContactViewController.h"
#import "BCWebChatViewController.h"


#import "BCQQContactViewController.h"
#import "BCFriendViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

//    BCTabBarViewController *tabBarViewController = [[BCTabBarViewController alloc]init];
//    BCWebChatViewController *webChatViewController = [[BCWebChatViewController alloc]init];
//    BCContactViewController *contactViewController = [[BCContactViewController alloc]init];
//    tabBarViewController.viewControllers = @[webChatViewController,contactViewController];
//
//    for(UIViewController *controller in tabBarViewController.viewControllers){
//        UIViewController *view = controller.view;
//    }
//
//    _window.rootViewController = tabBarViewController;

    _window.backgroundColor =[UIColor colorWithRed:249/255.0 green:249/255.0 blue:180/255.0 alpha:1];

    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:23/255.0 green:180/255.0 blue:237/255.0 alpha:1]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    BCFriendViewController *friendController = [[BCFriendViewController alloc]init];
    UINavigationController *naviationController = [[UINavigationController alloc]initWithRootViewController:friendController];
    _window.rootViewController = naviationController;
    [_window makeKeyAndVisible];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
