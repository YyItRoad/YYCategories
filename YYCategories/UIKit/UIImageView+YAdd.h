//
//  UIImageView+YAdd.h
//  YYCategories
//
//  Created by 杨洋 on 19/03/2017.
//  Copyright © 2017 ibireme. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YAdd)

@end

@interface UITapImageView : UIImageView

- (void)addTapBlock:(void(^)(id obj))tapAction;

@end
