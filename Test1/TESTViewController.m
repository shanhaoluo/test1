//
//  TESTViewController.m
//  Test1
//
//  Created by Qu on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TESTViewController.h"
#import "UIImageView+WebCache.h"
#import "JSONKit.h"

@interface TESTViewController ()

@end


@implementation TESTViewController

- (void)dealloc
{
    [formDataRequest clearDelegatesAndCancel];
    [formDataRequest release];
    [super dealloc];
} 
- (void)uploadAnImage
{
    NSURL * url = [NSURL URLWithString:@"http://pass.rayli.com.cn/api/upfile.php"];
    formDataRequest = [[ASIFormDataRequest alloc] initWithURL:url];
    NSString *uploadedImg1Path = [[NSBundle mainBundle] pathForResource:@"screen" ofType:@"png"];
//    NSString *uploadedImg2Path = [[NSBundle mainBundle] pathForResource:@"IMG_0301" ofType:@"JPG"];
    [formDataRequest setFile:uploadedImg1Path withFileName:@"screen.png" andContentType:@"image/png" forKey:@"avatar"];
//    [formDataRequest setFile:uploadedImg2Path withFileName:@"IMG_0301" andContentType:@"image/jpg" forKey:@"uploadedImg[1]"];
//    NSArray ary = [NSArray arrayWithObjects:@"", nil
//    NSString *jsonString =  [ary JSONString];
//    NSLog(@"jsonString:%@",jsonString);

    [formDataRequest setTimeOutSeconds:20];
    [formDataRequest setPostValue:@"4419918" forKey:@"uid"];
    
//    [formDataRequest setPostValue:jsonString forKey:@"cid"];
    [formDataRequest setDelegate:self];
    [formDataRequest startAsynchronous];
    
    NSLog(@"uploading images");
}
- (void)dismissSelf
{
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"DismissTestViewNotification" object:nil]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    
//    webView = [[UIWebView alloc] initWithFrame:self.view.frame];
//    webView.delegate = self;
//    [webView loadRequest:[NSURL URLWithString:@"http://t.rayli.com.cn/index.php?m=account.Sinalogin&cb=login&loginCallBack='+encodeURIComponent(gameUrl"]];
//    [self.view addSubview:webView];
	// Do any additional setup after loading the view, typically from a nib.
    
//    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
//    [self.view addSubview:_bgImageView];

    UIButton *UploadImageBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [UploadImageBtn setFrame:CGRectMake(50, 50, 100, 50)];
    [UploadImageBtn setTitle:@"upload" forState:UIControlStateNormal];
    [UploadImageBtn addTarget:self action:@selector(uploadAnImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:UploadImageBtn];
//    
//    UIButton *dismissBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [dismissBtn setFrame:CGRectMake(150, 50, 50, 50)];
//
//    [dismissBtn setTitle:@"dismiss" forState:UIControlStateNormal];
//    [dismissBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:dismissBtn];
//    self.view.tag = 0;
    
    UIButton *compressBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    compressBtn.backgroundColor = [UIColor greenColor];
    [compressBtn addTarget:self action:@selector(compressImg) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:compressBtn];
    
}



- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"tag:%i",self.view.tag);
    if (self.view.tag == 0) {
        self.view.tag = 1;
    }else {
        [_bgImageView setImageWithURL:[NSURL URLWithString:@"http://www.baidu.com/img/baidu_sylogo1.gif"]];//@"http://www.brallis.se/dokument/bibliotek/Image/lancome.jpg"]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark- ==================== ASIHttpRequestDelegate ======================

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"request finished:\n%@",[request responseString]);
    NSLog(@"response code:%i",[request responseStatusCode]);
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"request failed:");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
