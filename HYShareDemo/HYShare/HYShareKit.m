//
//  HYShareManager.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/4.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "HYShareKit.h"

#import "HYWxHandler.h"
#import "HYSinaHandler.h"
#import "HYTencentHandler.h"

#define kWeixinAppID        @"wx4ed2cc595102e07c"
#define kWeiboAppID         @"315112544"
#define kTencentAppID       @"1102292249"


#define kWeixinScheme       @"wx4ed2cc595102e07c"
#define kWeiboScheme        @"wb315112544"
#define kTencentScheme      @"tencent1102292249"


@interface HYShareKit()

@property (nonatomic, strong) HYWxHandler *wxHandler;
@property (nonatomic, strong) HYSinaHandler *sinaHandler;
@property (nonatomic, strong) HYTencentHandler *tencentHandler;
@property (nonatomic, strong) HYShareHandler *shareHandler;
@property (nonatomic, strong) NSString * lastShareActivityType;
@property (nonatomic,   copy) HYShareCompletionBlock shareCompletionBlock;

@end

@implementation HYShareKit

#pragma mark - Life Cycle

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.wxHandler = [[HYWxHandler alloc] init];
        self.sinaHandler = [[HYSinaHandler alloc] init];
        self.tencentHandler = [[HYTencentHandler alloc] init];
        self.shareHandler = [[HYShareHandler alloc] init];
        self.sinaHandler.delegate = self;
        self.wxHandler.delegate = self;
        self.tencentHandler.delegate = self;
        
        [WXApi registerApp:kWeixinAppID];
        [WeiboSDK registerApp:kWeiboAppID];
        
#ifndef __OPTIMIZE__ //#ifdef DEBUG
        [WeiboSDK enableDebugMode:YES];
#endif
        self.txOauth = [[TencentOAuth alloc] initWithAppId:kTencentAppID andDelegate:(id<TencentSessionDelegate>)self.tencentHandler];
    }
    
    return self;
}

#pragma mark - class method

+ (void)setUp
{
    [HYShareKit standardKit];
}


+ (instancetype)standardKit
{
    static dispatch_once_t once;
    static HYShareKit *_standardKit = nil;
    dispatch_once(&once,^{
        _standardKit = [[self alloc] init];
    });
    
    return _standardKit;
}


+ (BOOL)handleOpenUrl:(NSURL *)url
{
    NSString *scheme = [url scheme];
    
    if ([scheme isEqualToString:kWeixinScheme]) {
        return [[HYShareKit standardKit].wxHandler handleOpenURL:url];
    } else if([scheme isEqualToString:kTencentScheme]){
        return [[HYShareKit standardKit].tencentHandler handleOpenURL:url];
    } else if ([scheme isEqualToString:kWeiboScheme]){
        return [[HYShareKit standardKit].sinaHandler handleOpenURL:url];
    }
    
    return NO;
}


+ (void)shareWithItem:(HYShareItem *)item
     onViewController:(UIViewController *)viewController
           completion:(HYShareCompletionBlock) completionBlock
{
    [HYShareKit standardKit].shareCompletionBlock = completionBlock;
    NSMutableArray *activities = [[self standardKit] buildHandlerWithOptions:item.shareOptions];
    
    //初始化UIActivityViewController,以弹出选择界面
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:item.activityItems applicationActivities:activities];
    
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_7_0) {
        activityViewController.excludedActivityTypes = @[UIActivityTypePostToWeibo,
                                                         UIActivityTypeMessage,
                                                         UIActivityTypeMail,
                                                         UIActivityTypePrint,
                                                         UIActivityTypeCopyToPasteboard,
                                                         UIActivityTypeAssignToContact,
                                                         UIActivityTypeSaveToCameraRoll];
    }else{
        activityViewController.excludedActivityTypes = @[UIActivityTypeAssignToContact,
                                                         UIActivityTypeCopyToPasteboard,
                                                         UIActivityTypePrint,
                                                         UIActivityTypeMail,
                                                         UIActivityTypeSaveToCameraRoll,
                                                         UIActivityTypeAddToReadingList,
                                                         UIActivityTypePostToWeibo,
                                                         UIActivityTypePostToVimeo,
                                                         UIActivityTypePostToFlickr,
                                                         UIActivityTypePostToTencentWeibo,
                                                         UIActivityTypeMessage,
                                                         UIActivityTypeAirDrop];
    }
    
    [viewController presentViewController:activityViewController animated:YES completion:nil];
}


#pragma mark - Private

- (NSMutableArray *)buildHandlerWithOptions:(HYShareActivityOptions)options
{
    NSMutableArray *activities = [[NSMutableArray alloc] init];
    
    if (kHYShareWeiXinSession && options > 0 && [WXApi isWXAppInstalled]) {
        [activities addObject:[self.wxHandler buildWxSessionActivity]];
    }
    
    if (kHYShareWeiXinTimeLine && options > 0 && [WXApi isWXAppInstalled]) {
        [activities addObject:[self.wxHandler buildWxTimelineActivity]];
    }
    
    if (kHYShareSinaWeiBo && options > 0 && [WeiboSDK isWeiboAppInstalled]) {
        [activities addObject:[self.sinaHandler buildSinaActivity]];
    }
    
    if (kHYShareTencentSession && options > 0 && [TencentOAuth iphoneQQInstalled]) {
        [activities addObject:[self.tencentHandler buildTencentSessionActivity]];
    }
    
    if (kHYShareTencentQzone && options > 0 && [TencentOAuth iphoneQQInstalled]) {
        [activities addObject:[self.tencentHandler buildTencentQzoneActivity]];
    }
    
    return activities;
}


#pragma mark - HYShareCompletionDelegate

- (void)handler:(HYShareHandler *)handler didShareFailed:(NSError *)error
{
    if (self.shareCompletionBlock != nil) {
        self.shareCompletionBlock(self.lastShareActivityType, YES, error);
        self.shareCompletionBlock = nil;
    }
}

- (void)didShareSuccessed:(HYShareHandler *)handler
{
    if (self.shareCompletionBlock != nil) {
        self.shareCompletionBlock(self.lastShareActivityType, YES,nil);
        self.shareCompletionBlock = nil;
    }
}


@end
