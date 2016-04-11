//
//  LoadingView.m
//  多汇网
//
//  Created by renyufei on 15/6/20.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import "LoadingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LoadingView
static LoadingView*_shareLoadView;
+(LoadingView *)shareLoadingView
{
    @synchronized([LoadingView class]){
        if (! _shareLoadView ) {
            _shareLoadView = [[self alloc]init];
            _shareLoadView.backgroundColor = [UIColor darkGrayColor];
            [_shareLoadView setBackgroundColor:[UIColor colorWithRed:64/255.0 green:68/255.0 blue:72/255.0 alpha:0.6]];
            UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(38, 27, 20, 20)];
            [activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
            [activityIndicatorView startAnimating];
            UILabel *loadingLab = [[UILabel alloc]initWithFrame:CGRectMake(84, 25, 83, 21)];
            [loadingLab setText:@"请稍后.."];
            [loadingLab setFont:[UIFont systemFontOfSize:17.0]];
            [loadingLab setTextColor:[UIColor whiteColor]];
            [loadingLab setBackgroundColor:[UIColor clearColor]];
            [loadingLab setTag:9000];
            [_shareLoadView addSubview:activityIndicatorView];
            [_shareLoadView addSubview:loadingLab];
            _shareLoadView.layer.cornerRadius = 6;
            _shareLoadView.layer.masksToBounds = YES;

            
        }
        return _shareLoadView;
    }
    return nil;
    
}

- (void)shareLoadingViewFrame
{
    _shareLoadView.frame = CGRectMake(60, 205, 200, 70);
}

-(void)setMessage:(NSString *)message
{
    UILabel *messageLab = (UILabel *)[self viewWithTag:9000];
    [messageLab setText:message];
}

+(id)alloc
{
    @synchronized([LoadingView class])
    {
        if(_shareLoadView == nil)
        {
            _shareLoadView = [super alloc];
            return _shareLoadView;
        }
    }
    return nil;
}


-(void)setLoadingViewAlpha:(CGFloat)alpha
{
    self.alpha = alpha;
}

-(void)setLoadingViewHidden
{
    self.hidden = YES;
}

-(void)removeAll
{
    [self removeFromSuperview];
}
@end
