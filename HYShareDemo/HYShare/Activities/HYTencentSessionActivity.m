//
//  HYTencentSessionActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYTencentSessionActivity.h"
#import <TencentOpenAPI/QQApiInterface.h>

@implementation HYTencentSessionActivity

#pragma mark - override

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"ico_user_qq"];
}

- (NSString *)activityTitle
{
    return @"QQ好友";
}

- (void)performActivity
{
    NSData * imageData = UIImageJPEGRepresentation([HYImageUtilities scaleImage:self.thumbImage
                                                              withStandardWidth:320.0f], 1.0);
    QQApiNewsObject *messge = [QQApiNewsObject objectWithURL:self.url
                                                       title:self.title
                                                 description:self.message
                                            previewImageData:imageData];
    
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:messge];
    [QQApiInterface sendReq:req];
    
    [self activityDidFinish:YES];
}

@end
