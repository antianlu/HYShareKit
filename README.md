# HYShareKit
第三方分享平台, HYShareKit 可分享至新浪微博，微信，QQ和QQ空间这类第三方社交平台，并可自动调回(但是需要自己去分别申请appid, 本代码中id未配置)

##简单介绍
HYShareKit简单易用，通过简单地几行代码，即可注册使用，分享内容的格式已经封装好，可扩展性良好。

##使用方法：


    HYShareItem *shareItem = [[HYShareItem alloc] init];
    shareItem.title = NSLocalizedString(@"HY旅行", nil);
    shareItem.message = NSLocalizedString(@"HY旅行", nil);
    shareItem.thumbImage = [UIImage imageNamed:@"ico_share_thumbImage"];
    shareItem.url = [NSURL URLWithString:@"http://www.baidu.com"];
    shareItem.shareOptions = kHYShareAll;
    
    [HYShareKit setUp];
    [HYShareKit shareWithItem:shareItem onViewController:self completion:^(NSString * shareActivityType, BOOL isSuccessed,NSError *error){
        if (error == nil) {
            NSLog(@"分享成功");
        }else{
            NSLog(@"分享失败");
        }
    }];
    

首先初始化shareItem， 将要分享的属性一一赋值；之后调用setUp类方法进行初始化和注册；最后通过统一接口shareItem: onViewController: completion启动即可。


本组件之后会制作cocoapods，并重新申请appid，使之自动跳回原有程序。敬请期待~