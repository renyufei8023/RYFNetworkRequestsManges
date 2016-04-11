//
//  LoadingView.h
//  多汇网
//
//  Created by renyufei on 15/6/20.
//  Copyright (c) 2015年 renyufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView
+(LoadingView*)shareLoadingView;
-(void)setMessage:(NSString *)message;
-(void)setLoadingViewAlpha:(CGFloat)alpha;
-(void)shareLoadingViewFrame;
-(void)setLoadingViewHidden;
-(void)removeAll;
@end
