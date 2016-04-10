//
//  HZYCollectionReusableView.m
//  HZYCollectionViewDemo
//
//  Created by passionHan on 16/4/9.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYCollectionReusableView.h"

@implementation HZYCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:self.bounds];
        
        [self addSubview:label];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title{
    
    _title = title;
    
    ((UILabel *)self.subviews[0]).text = title;
}

@end
