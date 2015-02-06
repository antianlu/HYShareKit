//
//  HYShareItem.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXApi.h"
#import "WeiboSDK.h"

typedef NS_OPTIONS(NSUInteger, HYShareActivityOptions) {
    kHYShareNone = 0,
    kHYShareWeiXinSession = 1 << 0,
    kHYShareWeiXinTimeLine = 1 << 1,
    kHYShareSinaWeiBo = 1 << 2,
    kHYShareTencentSession = 1 << 3,
    kHYShareTencentQzone = 1 << 4,
    kHYShareAll = 0xFF,
};

@interface HYShareItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) UIImage *thumbImage;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, assign) HYShareActivityOptions shareOptions;


/**
 *  返回用于activity进行初始化的items
 *
 *  @return
 */
- (NSArray *)activityItems;

@end
