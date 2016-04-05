//
//  FifthCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by jiejin on 16/4/2.
//  Copyright © 2016年 jiejin. All rights reserved.
//

#import "FifthCollectionViewCell.h"

@implementation FifthCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if(self){
    
        self.backgroundColor = [UIColor greenColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 20.0f;
    }
    
    return self;
}

@end
