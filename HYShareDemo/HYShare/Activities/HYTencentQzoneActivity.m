//
//  HYTencentQzoneActivity.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYTencentQzoneActivity.h"

@implementation HYTencentQzoneActivity

#pragma mark - override

- (UIImage *)_activityImage
{
    return [UIImage imageNamed:@"ico_user_qzone"];
}

- (NSString *)activityTitle
{
    return @"QQ空间";
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
    [QQApiInterface SendReqToQZone:req];
    
    [self activityDidFinish:YES];
}

@end
