//
//  HYSinaHandler.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HYShareHandler.h"
#import "HYSinaActivity.h"

@interface HYSinaHandler : HYShareHandler


/**
 *  初始化新浪微博activity
 *
 *  @param completion 回调block
 *
 *  @return self
 */
- (HYSinaActivity *)buildSinaActivity;

@end
