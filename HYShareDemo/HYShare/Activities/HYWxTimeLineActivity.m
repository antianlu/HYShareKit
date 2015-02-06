//
//  HYWxTimeLineActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYWxTimeLineActivity.h"

@implementation HYWxTimeLineActivity

#pragma mark - Life Cycle

- (id)init
{
    self = [super init];
    if (self) {
        self.scene = WXSceneTimeline;
    }
    return self;
}


#pragma mark - override

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"ico_user_wx_timeline"];
}

- (NSString *)activityTitle
{
    return @"微信朋友圈";
}


- (void)performActivity
{
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.scene = self.scene;
    req.message = WXMediaMessage.message;
    req.message.title = self.message;
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
