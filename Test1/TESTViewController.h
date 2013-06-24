//
//  TESTViewController.h
//  Test1
//
//  Created by Qu on 12-6-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface TESTViewController : UIViewController<ASIHTTPRequestDelegate,UIWebViewDelegate>
{
    UIWebView *webView;
    ASIFormDataRequest * formDataRequest;
    UIImageView *_bgImageView;
}

@end
