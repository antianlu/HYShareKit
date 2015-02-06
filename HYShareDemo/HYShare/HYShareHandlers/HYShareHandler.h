//
//  HYShareHandler.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HYShareHandler;

@protocol HYShareHandlerDelegate <NSObject>

@required

- (void)handler:(HYShareHandler *)handler didShareFailed:(NSError *)error;
- (void)didShareSuccessed:(HYShareHandler *)handler;

@end


typedef NS_ENUM(NSUInteger, HYShareErrorCode){
    kHYWxCancelCode,
    kHYWxFailureCode,
    kHYSinaCancelCode,
    kHYSinaFailureCode,
    kHYTencentCancelCode,
};


FOUNDATION_EXTERN NSString *const kHYShareErrorDomain;

@interface HYShareHandler : NSObject

@property (nonatomic, weak) id<HYShareHandlerDelegate> delegate;
@property (nonatomic, strong) NSError *error;


/**
 *  从第三方平台返回时调用
 *
 *  @param url 返回url
 */
- (BOOL)handleOpenURL:(NSURL *)url;

@end
