//
//  YYButton.h
//  YYCategories
//
//  Created by 杨洋 on 2/12/16.
//  Copyright © 2016 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIButton (Add)

//倒计时
-(void)countDownTime:(NSInteger)time ;

@end

IB_DESIGNABLE

@interface YYButton : UIButton

@property (nonatomic,strong) UILabel *badgeLabel;

@property (nonatomic,copy) IBInspectable NSString *badgeValue;

@property (nonatomic,copy) IBInspectable UIColor *badgeBgColor;

@end
