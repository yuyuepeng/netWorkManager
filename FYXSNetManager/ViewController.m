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
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)startRequest {
    
    [self.netManager getDataWithBaseUrl:@"http://ek7efpZ.91xianpai.com/Index/getRecommendList" path:nil params:nil token:nil succeeded:^(NSInteger status, id response) {
        if (status == 0) {
            NSLog(@" successData: %@", response);

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
