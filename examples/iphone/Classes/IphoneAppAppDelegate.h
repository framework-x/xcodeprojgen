//
//  IphoneAppAppDelegate.h
//  IphoneApp
//
//  Created by Dan Manges on 5/13/09.
//  Copyright ThoughtWorks 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IphoneAppAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
