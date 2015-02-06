//
//  HYWxSessionActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYWxSessionActivity.h"

@implementation HYWxSessionActivity

#pragma mark - Life Cycle

- (id)init
{
    self = [super init];
    
    if (self) {
        self.scene = WXSceneSession;
    }
    return self;
}


#pragma mark - override

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"ico_user_wx_session"];
}

- (NSString *)activityTitle
{
    return @"微信好友";
}

- (void)performActivity
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = self.scene;
    req.message = WXMediaMessage.message;
    req.message.title = self.title;
    req.message.description = self.message;
    [req.message setThumbImage:[HYImageUtilities scaleImage:self.thumbImage
                                          withStandardWidth:160.0f]];
    if (self.url) {
        WXWebpageObject *webObject = WXWebpageObject.object;
        webObject.webpageUrl = [self.url absoluteString];
        req.message.mediaObject = webObject;
    }
    
    [WXApi sendReq:req];
    [self activityDidFinish:YES];
}

@end
