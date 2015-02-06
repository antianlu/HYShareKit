//
//  HYSinaHandler.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYSinaHandler.h"

@implementation HYSinaHandler

#pragma mark - Override

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:(id<WeiboSDKDelegate>)self];
}


#pragma mark - public

- (HYSinaActivity *)buildSinaActivity
{
    return [[HYSinaActivity alloc] init];
}


#pragma mark - Sina Delegate

- (void)didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if ([response isKindOfClass:WBSendMessageToWeiboResponse.class])
    {
        switch (response.statusCode) {
            case WeiboSDKResponseStatusCodeSuccess:
                [self.delegate didShareSuccessed:self];
                break;
                
            case WeiboSDKResponseStatusCodeUserCancel:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYSinaCancelCode
                                                    userInfo:@{NSLocalizedDescriptionKey:
                                                                   NSLocalizedString(@"已取消分享", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            case WeiboSDKResponseStatusCodeSentFail:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYSinaFailureCode
                                                    userInfo:@{NSLocalizedDescriptionKey:
                                                                   NSLocalizedString(@"发送失败,请检查网络环境", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            case WeiboSDKResponseStatusCodeUnsupport:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYSinaFailureCode
                                                    userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"不支持的请求", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            default:
                break;
        }
        
    }
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request
{
    
}

@end
