//
//  HYWxHandler.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYWxHandler.h"

@implementation HYWxHandler

#pragma mark - Public

- (HYWxSessionActivity *)buildWxSessionActivity
{
    return [[HYWxSessionActivity alloc] init];
}

- (HYWxTimeLineActivity *)buildWxTimelineActivity
{
    return [[HYWxTimeLineActivity alloc] init];
}

#pragma mark - Override

- (BOOL)handleOpenURL:(NSURL *)url
{
    return [WXApi handleOpenURL:url delegate:(id<WXApiDelegate>)self];
}


#pragma mark - WxDelegate

- (void)onResp:(BaseResp *)resp
{
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        switch (resp.errCode) {
            case WXSuccess:
                [self.delegate didShareSuccessed:self];
                break;
                
            case WXErrCodeUserCancel:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYWxCancelCode
                                                    userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"已取消分享", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            case WXErrCodeSentFail:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYWxFailureCode
                                                    userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"发送失败,请检查网络环境", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            case WXErrCodeUnsupport:
                self.error = [[NSError alloc ]initWithDomain:kHYShareErrorDomain
                                                        code:kHYWxFailureCode
                                                    userInfo:@{NSLocalizedDescriptionKey:NSLocalizedString(@"不支持的请求", nil)}];
                [self.delegate handler:self didShareFailed:self.error];
                break;
                
            default:
                break;
        }
    }
    
    
}

@end
