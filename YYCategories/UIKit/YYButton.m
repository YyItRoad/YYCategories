//
//  YYButton.m
//  YYCategories
//
//  Created by 杨洋 on 2/12/16.
//  Copyright © 2016 ibireme. All rights reserved.
//

#import "YYButton.h"


@interface YYButton ()

@end

@implementation YYButton

- (void)setBadgeValue:(NSString *)badgeValue {
    _badgeValue = badgeValue;
    if (!badgeValue || badgeValue.integerValue == 0 ) {
        badgeValue = nil;
    }
    self.badgeLabel.hidden = !badgeValue;
    self.badgeLabel.text = badgeValue;
    [self layoutIfNeeded];
}

- (void)setBadgeBgColor:(UIColor *)badgeBgColor {
    _badgeBgColor = badgeBgColor;
    _badgeLabel.backgroundColor = badgeBgColor;
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat titleLabelHeight = self.titleLabel.frame.size.height;
    if (titleLabelHeight == 0) {
        titleLabelHeight = 10;
    }
    
    CGFloat imageMaxHeight = self.frame.size.height - titleLabelHeight - 8 * 2;
    CGFloat imageMaxWidth = self.frame.size.width - 8 * 2;
    
    //Set ImageView Threshold
    if (self.imageView.frame.size.height > imageMaxHeight) {
        CGRect newImageView = self.imageView.frame;
        newImageView.size = CGSizeMake(imageMaxHeight / self.imageView.frame.size.height * self.imageView.frame.size.width, imageMaxHeight);
        self.imageView.frame = newImageView;
    }
    
    if (self.imageView.frame.size.width > imageMaxWidth) {
        CGRect newImageView = self.imageView.frame;
        newImageView.size = CGSizeMake(imageMaxWidth , imageMaxWidth / self.imageView.frame.size.width * self.imageView.frame.size.height);
        self.imageView.frame = newImageView;
    }
    
    CGFloat totalHeight = self.imageView.frame.size.height  + titleLabelHeight;
    
    //Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width / 2.0;
    center.y = self.frame.size.height / 2.0 - totalHeight / 2.0 + self.imageView.frame.size.height / 2.0;
    self.imageView.center = center;
    
    CGRect titleLabelFrame = self.titleLabel.frame;
    titleLabelFrame.size = CGSizeMake(self.frame.size.width, titleLabelHeight);
    self.titleLabel.frame = titleLabelFrame;
    
    //Center text
    CGPoint titleCenter = self.titleLabel.center;
    titleCenter.x = self.frame.size.width / 2.0;
    titleCenter.y = self.imageView.center.y + self.imageView.frame.size.height / 2.0 + titleLabelHeight / 2.0 + 8 ;
    self.titleLabel.center = titleCenter;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.badgeLabel sizeToFit];
    CGRect badgeFrame = self.badgeLabel.frame;
    CGFloat badgeH = 16.f;
    CGFloat badgeW = badgeH;
    if (badgeFrame.size.width > badgeH - 2) {
        badgeW = badgeFrame.size.width + 2;
    }
    self.badgeLabel.frame = CGRectMake(0, 0, badgeW, badgeH);
    self.badgeLabel.layer.cornerRadius = badgeH/2.f;
    if (self.imageView.image) {
        self.badgeLabel.center = CGPointMake(CGRectGetMaxX(self.imageView.frame), CGRectGetMinY(self.imageView.frame));
    }else{
        self.badgeLabel.center = CGPointMake(CGRectGetMaxX(self.titleLabel.frame), CGRectGetMinY(self.titleLabel.frame));
    }
}

- (UILabel *)badgeLabel {
    if (!_badgeLabel) {
        _badgeLabel = [UILabel new];
        _badgeLabel .textColor = [UIColor whiteColor];
        _badgeLabel.font = [UIFont systemFontOfSize:12];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.backgroundColor = _badgeBgColor?:[UIColor redColor];
        _badgeLabel.layer.masksToBounds = YES;
        _badgeLabel.hidden = YES;
        [self addSubview:_badgeLabel];
    }
    return _badgeLabel;
}

@end
