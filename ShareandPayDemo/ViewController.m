//
//  ViewController.m
//  ShareandPayDemo
//
//  Created by 王俊钢 on 2017/8/8.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "ZTVendorManager.h"
@interface ViewController ()
@property (nonatomic, strong) ZTVendorPayManager *payManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.payManager = [[ZTVendorPayManager alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 第三方登录

- (IBAction)qqloginclick:(id)sender {
    [ZTVendorManager loginWith:ZTVendorPlatformTypeQQ completionHandler:^(ZTVendorAccountModel *model, NSError *error) {
        NSLog(@"nickname:%@",model.nickname);
    }];
}

- (IBAction)weixinloginclick:(id)sender {
    [ZTVendorManager loginWith:ZTVendorPlatformTypeWechat completionHandler:^(ZTVendorAccountModel *model, NSError *error) {
        NSLog(@"nickname:%@",model.nickname);
    }];
}

- (IBAction)weibologinclick:(id)sender {
    [ZTVendorManager loginWith:ZTVendorPlatformTypeSina completionHandler:^(ZTVendorAccountModel *model, NSError *error) {
        NSLog(@"nickname:%@",model.nickname);
    }];
}

- (IBAction)QQshareclick:(id)sender {
    ZTVendorShareModel *model = [[ZTVendorShareModel alloc]init];
    [ZTVendorManager shareWith:ZTVendorPlatformTypeQQ shareModel:model completionHandler:^(BOOL success, NSError * error) {
        
    }];
}

- (IBAction)weichatshareclick:(id)sender {
    ZTVendorShareModel *model = [[ZTVendorShareModel alloc]init];
    [ZTVendorManager shareWith:ZTVendorPlatformTypeWechat shareModel:model completionHandler:^(BOOL success, NSError * error) {
        
    }];
}

- (IBAction)weichatfriendshareclick:(id)sender {
    ZTVendorShareModel *model = [[ZTVendorShareModel alloc]init];
    [ZTVendorManager shareWith:ZTVendorPlatformTypeWechatFriends shareModel:model completionHandler:^(BOOL success, NSError * error) {
        
    }];
}

- (IBAction)weiboshareclick:(id)sender {
    ZTVendorShareModel *model = [[ZTVendorShareModel alloc]init];
    [ZTVendorManager shareWith:ZTVendorPlatformTypeSina shareModel:model completionHandler:^(BOOL success, NSError * error) {
        
    }];
}

- (IBAction)weixinpay:(id)sender {
    
    ZTVendorPayModel *model = [[ZTVendorPayModel alloc] init];
    model.timeStamp = 1495528775;
    model.partnerId = @"1315923801";
    model.prepayId = @"wx2017052316393786541b3d9f0025699422";
    model.package = @"Sign=WXPay";
    model.nonceStr = @"0dafe2cad92c228816a13add3c08108d";
    model.sign = @"B765700116024576DCB656DB8D9B305C";
    model.appid = @"wx9d022487205c4ada";
    [self.payManager payOrderWith:1 orderModel:model payResultBlock:^(BOOL success, NSError *error) {
        if (success) {
            NSLog(@"支付成功");
        }else{
            NSLog(@"%@",error);
        }
        
    }];
}

- (IBAction)zhifubaopay:(id)sender {
    ZTVendorPayModel *model = [[ZTVendorPayModel alloc] init];
    //model.aliPayOrderString = @"app_id=2016022601164789&biz_content=%7B%22body%22%3A%22Mytee%5Cu5546%5Cu57ce%5Cu5546%5Cu54c1%22%2C%22subject%22%3A%22Mytee%5Cu5546%5Cu57ce%5Cu5546%5Cu54c1%22%2C%22out_trade_no%22%3A%222017052397991011%22%2C%22total_amount%22%3A%22462.08%22%2C%22seller_id%22%3A%22apps%40yunys.com.cn%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22goods_type%22%3A1%7D&format=JSON&method=alipay.trade.app.pay&notify_url=http%3A%2F%2Ffashion.apiyys.com%2Fapi%2Fpay%2Falipay-notify&sign=ALod77e%2BlPMRGJlUQB6bLiZxop580a5SLcvIjSFMhnx%2FC4%2FfUXUv7r9seWzjgxA9lv0xwnVW2PdYzWJfKxC5uXtCIrBN4LWmuLN1dk%2FWFyRK12Krz1mPpIucHWY3GO52Ti3ixy4SvDSW%2FhlOU1ap2gNlQIbbGRJyofQu6lnjcq4%3D&sign_type=RSA&timestamp=2017-05-23+16%3A35%3A25&version=1.0";
    model.aliPayOrderString = @"alipay_sdk=alipay-sdk-php-20161101&app_id=2017091108668497&biz_content=%7B%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22subject%22%3A+%22App%E6%94%AF%E4%BB%98%E6%B5%8B%E8%AF%95%22%2C%22out_trade_no%22%3A+%2220170125test01%22%2C%22timeout_express%22%3A+%2230m%22%2C%22total_amount%22%3A+%220.01%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%7D&charset=UTF-8&format=json&method=alipay.trade.app.pay¬ify_url=http%3A%2F%2Faimidao.tv%2Fadmin.php%2FLogin%2Fnotify&sign_type=RSA×tamp=2017-09-30+11%3A42%3A41&version=1.0&sign=kO1b%2B9HIutQaWkqnEer8zxq7brCulBwF%2BVslcSZsT8LdzTrzu8qbxmwE1tFO7yvEJtxkBwPU5pZxhFDLBFIuY11M8EtNfKPi8MRC6bs40UX1SR3Nq0ZPQ3Gm7KRjmBh9y6sc%2FttNbrdT%2FkFv0WFDxsvefJVb3YOW7aDCqLxVQ%2FQ%3D";
    [self.payManager payOrderWith:0 orderModel:model payResultBlock:^(BOOL success,NSError *error) {
        if (success) {
            NSLog(@"支付成功");
        }else{
            NSLog(@"%@",error);
        }
    }];
}





@end
