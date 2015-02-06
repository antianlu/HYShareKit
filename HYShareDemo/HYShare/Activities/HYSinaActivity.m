//
//  HYSinaActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYSinaActivity.h"

@implementation HYSinaActivity

#pragma mark - override

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"ico_user_sina"];
}

- (NSString *)activityTitle
{
    return @"新浪微博";
}

- (void)performActivity
{
    WBMessageObject *message = [WBMessageObject message];
    message.text = [NSString stringWithFormat:@"%@ %@",self.message, self.url];
    WBImageObject *image = [WBImageObject object];
    image.imageData = UIImageJPEGRepresentation(self.thumbImage, 1.0);
    message.imageObject = image;
    
    
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    
    [WeiboSDK sendRequest:request];
    
    [self activityDidFinish:YES];
    
}

@end
