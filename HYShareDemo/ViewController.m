//
//  ViewController.m
//  HYShareDemo
//
//  Created by Harry Yan on 15/2/5.
//  Copyright (c) 2015年  Harry Yan. All rights reserved.
//

#import "ViewController.h"
#import "HYShareKit.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"第三方分享Demo", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareButton setFrame:CGRectMake(0, 0, 80, 50)];
    shareButton.center = self.view.center;
    shareButton.contentMode = UIViewContentModeCenter;
    [shareButton setTitle:NSLocalizedString(@"分享", nil) forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [shareButton addTarget:self
                    action:@selector(didTapShareButton:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:shareButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action

- (void)didTapShareButton:(id)sender
{
    HYShareItem *shareItem = [[HYShareItem alloc] init];
    shareItem.title = NSLocalizedString(@"HY旅行", nil);
    shareItem.message = NSLocalizedString(@"HY旅行", nil);
    shareItem.thumbImage = [UIImage imageNamed:@"ico_share_thumbImage"];
    shareItem.url = [NSURL URLWithString:@"http://www.baidu.com"];
    shareItem.shareOptions = kHYShareAll;
    
    [HYShareKit setUp];
    
//    __weak typeof(self) weakSelf = self;
    [HYShareKit shareWithItem:shareItem onViewController:self completion:^(NSString * shareActivityType, BOOL isSuccessed,NSError *error){
        if (error == nil) {
            NSLog(@"分享成功");
        }else{
            NSLog(@"分享失败");
        }
    }];
}

@end
