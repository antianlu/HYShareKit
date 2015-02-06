//
//  WQShareActivity.h
//  HYShareDemo
//
//  Created by Harry Yan on 15/1/30.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYImageUtilities.h"

@interface HYShareActivity : UIActivity

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableString *message;
@property (nonatomic, strong) UIImage *thumbImage;
@property (nonatomic, strong) NSURL *url;

@end
