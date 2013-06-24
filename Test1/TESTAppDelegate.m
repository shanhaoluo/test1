//
//  TESTAppDelegate.m
//  Test1
//
//  Created by Qu on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TESTAppDelegate.h"

#import "TESTViewController.h"
#import "TESTAnimationViewController.h"
@implementation TESTAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize testViewController = _testViewController;
@synthesize tmpViewController = _tmpViewController;
@synthesize animationViewController = _animationViewController;
@synthesize view1 = _view1;


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DismissTestViewNotification" object:nil];
    [_window release];
    [_tabBarController release];
    [_testViewController release];
    [_view1 release];
    [_animationViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 160, 230)];

    [self.view1 setBackgroundColor:[UIColor purpleColor]];
    UIGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTabViewController)];
    [self.view1 addGestureRecognizer:tapGestureRecognizer];
    [tapGestureRecognizer release];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissTestViewController) name:@"DismissTestViewNotification" object:nil];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];



    self.testViewController = [[[TESTViewController alloc] init] autorelease];
    CGAffineTransform transform1 = CGAffineTransformMakeScale(0.5, 0.5);
    CGAffineTransform transform2  = CGAffineTransformMakeTranslation(-80, -115);
    self.testViewController.view.transform = CGAffineTransformConcat(transform1, transform2);
        
//    self.animationViewController = [[[TESTAnimationViewController alloc] init] autorelease];
//    self.window.rootViewController = self.animationViewController;
    
    self.window.rootViewController = self.testViewController;


    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dismissTestViewController
{
    [UIView transitionFromView:self.testViewController.view
                        toView:self.view1
                      duration:0.8
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished ){
                        [UIView animateWithDuration:0.5 
                                         animations:^(void){
//                                             CGAffineTransform transform1 =  CGAffineTransformMakeScale(0.4, 0.4);
//                                             CGAffineTransform transform2 = CGAffineTransformMakeTranslation(-70, -100);
//                                             self.testViewController.view.transform = CGAffineTransformConcat(transform1, transform2);
//                                             self.view1.transform = CGAffineTransformConcat(transform1, transform2);
                                             self.view1.transform = CGAffineTransformMakeScale(1, 1);
                                             CGAffineTransform transform1 =  CGAffineTransformMakeScale(0.5, 0.5);
                                             CGAffineTransform transform2 = CGAffineTransformMakeTranslation(80, 115);
                                             self.testViewController.view.transform = CGAffineTransformConcat(transform2, transform1);
                                         }
                                         completion:^(BOOL finished){
                                             CGRect frame = self.testViewController.view.frame;
                                         }
                         ];
                    }
    
     ];
    


}
        
- (void)dismissTabViewController
{
    [UIView transitionFromView:self.view1
                        toView:self.testViewController.view
                      duration:0.8
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    completion:^(BOOL finished ){
                        [UIView animateWithDuration:0.5
                                         animations:^(void){
                                            self.testViewController.view.transform = CGAffineTransformMakeScale(1, 1);
                                             CGAffineTransform transform1 =  CGAffineTransformMakeScale(2, 2);
                                             CGAffineTransform transform2 = CGAffineTransformMakeTranslation(80, 115);
                                               
                                             self.view1.transform = CGAffineTransformConcat(transform1, transform2);

                                            }
                                         completion:^(BOOL finished){
                                             
                                            }
                        ];
                           
                    } 
    ];
}
@end
