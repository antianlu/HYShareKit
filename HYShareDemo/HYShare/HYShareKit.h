//
//  HYShareManager.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYShareItem.h"
#import "HYShareHandler.h"
#import <TencentOpenAPI/TencentOAuth.h>

typedef void(^HYShareCompletionBlock)(NSString * shareActivityType,  BOOL isSuccessed, NSError * error);

@interface HYShareKit : NSObject <HYShareHandlerDelegate>

@property (nonatomic, strong) TencentOAuth *txOauth;


/**
 *  统一配置分享平台
 */
+ (void)setUp;


/**
 *  控制分享单例模式
 *
 *  @return
 */
+ (instancetype)standardKit;


/**
 *  从第三方平台返回时的回调函数,提示分享成功与失败
 *
 *  @param url WQ url
 */
+ (BOOL)handleOpenUrl:(NSURL *)url;


/**
 *  分发item到第三方平台handler
 *
 *  @param item            分享的数据
 *  @param viewController  回调VC
 *  @param completionBlock 回调函数
 */
+ (void)shareWithItem:(HYShareItem *)item
     onViewController:(UIViewController *)viewController
           completion:(HYShareCompletionBlock) completionBlock;

@end
