//
//  TESTAnimationViewController.m
//  Test1
//
//  Created by 山浩 罗 on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TESTAnimationViewController.h"
#import "TESTViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface TESTAnimationViewController ()

@end

@implementation TESTAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    TESTViewController *testViewController = [[TESTViewController alloc] init];
   // [testViewController.view setFrame:CGRectMake(0, 0, 100, 100)];
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 50, 300, 100)];
    view1.layer.cornerRadius = 8;
    [view1 setBackgroundColor:[UIColor redColor]];

    


    view1.transform = CGAffineTransformMakeScale(0.001, 0.001);
    view1.center = CGPointMake(0, 50);
    
    
    CGPoint center = view1.center;
    CGRect frame = view1.frame;
    [self.view addSubview:view1];
    [view1 release];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(0, 0, 40, 30);
    [btn1 addTarget:self action:@selector(zoomView1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
//    [UIView transitionFromView:view1
//                        toView:testViewController.view 
//                      duration:2
//                       options:UIViewAnimationOptionTransitionFlipFromRight
//                    completion:^(BOOL finished){
//                        [UIView animateWithDuration:1
//                                         animations:^(void){
//                                             testViewController.view.transform = CGAffineTransformMakeScale(2, 2);
//                                         }completion:^(BOOL finished){
//                                             
//                                         }
//                         ];
//
//                
//                    }
//     ];
    
    
	// Do any additional setup after loading the view.
}

- (void)zoomView1
{
    if (view1.frame.size.width != 300) {
        [UIView animateWithDuration:0.3
                        animations:^(void){
                            CGAffineTransform t1 = CGAffineTransformMakeTranslation(150, 50);
                            CGAffineTransform t2 = CGAffineTransformMakeScale(1, 1);
                            view1.transform = CGAffineTransformConcat(t1, t2);
            
                        }
                        completion:^(BOOL finished){
                        }
        ];
    }
    else {
        [UIView animateWithDuration:0.3 
                         animations:^(void){
                           //  CGAffineTransform t1 = CGAffineTransformMakeTranslation(-50, -150);
                             CGAffineTransform t2 = CGAffineTransformMakeScale(0.001, 0.001);
                             view1.transform = t2;//CGAffineTransformConcat(t1, t2);
                             
                         }
         ];
            
    }
    CGPoint center = view1.center;
    CGRect frame = view1.frame;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
