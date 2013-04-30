//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-04-27.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.isSelected;
}

@end
