//
//  HYTencentHandler.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYTencentHandler.h"

@implementation HYTencentHandler

#pragma mark - Override

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [QQApiInterface handleOpenURL:url delegate:(id<QQApiInterfaceDelegate>)self];
}


#pragma mark - Public

- (HYTencentSessionActivity *)buildTencentSessionActivity
{
    return [[HYTencentSessionActivity alloc] init];
}

- (HYTencentQzoneActivity *)buildTencentQzoneActivity
{
    return [[HYTencentQzoneActivity alloc] init];
}


#pragma mark - QQApiInterfaceDelegate

- (void)onReq:(QQBaseReq *)req
{
    
}

- (void)isOnlineResponse:(NSDictionary *)response
{
    
}

- (void)onResp:(QQBaseResp *)resp
{
    if ([resp isKindOfClass:SendMessageToQQResp.class]) {
        switch ([resp.result integerValue]) {
            case 0:
                [self.delegate didShareSuccessed:self];
                break;
                
            case -4:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYTencentCancelCode
                                                    userInfo:@{NSLocalizedDescriptionKey:
                                                                   NSLocalizedString(@"已取消分享", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            default:
                break;
        }
    }
}

@end
