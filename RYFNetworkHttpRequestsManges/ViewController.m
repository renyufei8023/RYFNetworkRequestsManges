//
//  ViewController.m
//  RYFNetworkHttpRequestsManges
//
//  Created by renyufei on 15/7/3.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "ViewController.h"
#import "RYFNetworkHttpRequestsManges.h"

@interface ViewController ()

@property (nonatomic,retain)RYFNetworkHttpRequestsManges *mangers;
@end

@implementation ViewController
@synthesize mangers = _mangers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mangers = [RYFNetworkHttpRequestsManges new];
    [_mangers initHttpRequestManges];
    [self downloadDataFromServer];
}

- (void)downloadDataFromServer
{
    [_mangers networkState:^(NSString *state) {
        NSLog(@"state状态是%@",state);
    }];
    
    [_mangers download:@"http://192.168.1.122/v2/index" andMethod:RYFRequestMethodGet andParameter:nil andPassParameters:nil success:^(id returnData, id passParameters) {
        NSLog(@"成功了");
    } failure:^(id returnData, NSError *error, id passParameters) {
        NSLog(@"失败了");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

@end
