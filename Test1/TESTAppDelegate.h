//
//  TESTAppDelegate.h
//  Test1
//
//  Created by Qu on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TESTAnimationViewController.h"

@class TESTViewController;

@interface TESTAppDelegate : UIResponder <UIApplicationDelegate>
{
   
}

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic)  UITabBarController *tabBarController;

@property (retain, nonatomic)  TESTViewController *testViewController;

@property (retain, nonatomic)  UIViewController *tmpViewController;

@property (retain, nonatomic)  TESTAnimationViewController *animationViewController;

@property (retain, nonatomic)  UIView *view1;

@end
