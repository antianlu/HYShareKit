//
//  HYTencentHandler.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYShareHandler.h"
#import "HYTencentSessionActivity.h"
#import "HYTencentQzoneActivity.h"

@interface HYTencentHandler : HYShareHandler <QQApiInterfaceDelegate>

@property (nonatomic, strong) HYTencentSessionActivity *tencentQQActivity;
@property (nonatomic, strong) HYTencentQzoneActivity *tencentQzoneActivity;


/**
 *  初始化QQ好友 activity
 *
 *  @param completion 回调block
 *
 *  @return self
 */
- (HYTencentSessionActivity *)buildTencentSessionActivity;

/**
 *  初始化QQ空间 activity
 *
 *  @param completion 回调block
 *
 *  @return self
 */
- (HYTencentQzoneActivity *)buildTencentQzoneActivity;

@end
