//
//  YYTextView.h
//  YYCategories
//
//  Created by 杨洋 on 2/12/16.
//  Copyright © 2016 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface YYTextView : UITextView

@property (copy, nonatomic) IBInspectable NSString *placeholder;
@property (nonatomic) IBInspectable double fadeTime;
@property (copy, nonatomic) NSAttributedString *attributedPlaceholder;
@property (retain, nonatomic) UIColor *placeholderTextColor UI_APPEARANCE_SELECTOR;

@end
