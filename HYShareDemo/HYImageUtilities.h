//
//  HYImageUtilities.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/5.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYImageUtilities : NSObject

/**
 *  缩放图片
 *
 *  @param image 待缩放图片
 *  @param width 标准宽度
 *
 *  @return 新图片
 */
+ (UIImage *)scaleImage:(UIImage *)image withStandardWidth:(CGFloat)width;

@end
