//
//  SetCard.h
//  Matchismo
//
//  Created by Hamdan Javeed on 2013-05-06.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

+ (NSUInteger)maxNumber;

+ (NSArray *)symbols;

+ (NSArray *)shading;

+ (NSArray *)colors;

@property (nonatomic) NSUInteger number;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *shading;
@property (strong, nonatomic) NSDictionary *color;

@end
