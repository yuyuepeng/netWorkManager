//
//  ViewController.m
//  FYXSNetManager
//
//  Created by 扶摇先生 on 2018/1/6.
//  Copyright © 2018年 扶摇先生. All rights reserved.
//

#import "ViewController.h"
#import "FYXSNetManager.h"
@interface ViewController ()<FYXSNetManagerDelegate>

@property(nonatomic, strong) FYXSNetManager *netManager;

@end

@implementation ViewController

- (FYXSNetManager *)netManager {
    if (_netManager == nil) {
        _netManager = [[FYXSNetManager alloc] init];
        _netManager.delegate = self;
    }
    return _netManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 140, 40)];
    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"请求数据" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
//    UIImage *image = [UIImage imageNamed:@"icon"];

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)startRequest {
    typeof(self) __weak weakself = self;
    [self.netManager postDataWithBaseUrl:@"http://ek7efpZ.91xianpai.com/" path:@"Index/newAddGoods" params:nil token:nil succeeded:^(NSInteger status, id response) {
        
    } failed:^(NSInteger status, NSString *error) {
        
    }];
//    http://ek7efpZ.91xianpai.com/Index/getRecommendList
    [self.netManager getDataWithBaseUrl:@"http://img1.imgtn.bdimg.com/it/u=594559231,2167829292&fm=27&gp=0.jpg" path:nil params:nil token:nil succeeded:^(NSInteger status, id response) {
        if (status == 0) {
            if ([response isKindOfClass:[UIImage class]]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 300)];
                    [imageView setImage:(UIImage *)response];
                    [weakself.view addSubview:imageView];
                });
            }else {
                NSLog(@" successData: %@", response);
            }

        }
    } failed:^(NSInteger status, NSString *error) {
        NSLog(@" failedData: %@", error);

    }];
}
- (void)failureResultData:(id)response {
    NSLog(@" failedData: %@", response);
}
- (void)successResultData:(id)response {
    NSLog(@" successData: %@", response);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
