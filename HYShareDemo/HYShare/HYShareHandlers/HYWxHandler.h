//
//  HYWxHandler.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYShareHandler.h"
#import "HYWxSessionActivity.h"
#import "HYWxTimeLineActivity.h"

@interface HYWxHandler : HYShareHandler <WXApiDelegate>

/**
 *  初始化具体微信好友activity
 *
 *  @param completion 回调block
 *
 *  @return self
 */
- (HYWxSessionActivity *)buildWxSessionActivity;

/**
 *  初始化具体微信朋友圈activity
 *
 *  @param completion 回调block
 *
 *  @return self
 */
- (HYWxTimeLineActivity *)buildWxTimelineActivity;

@end
