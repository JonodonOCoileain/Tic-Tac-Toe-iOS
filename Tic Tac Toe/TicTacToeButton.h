//
//  TicTacToeButton.h
//  Tic Tac Toe
//
//  Created by Jonathan Collins on 12/8/17.
//  Copyright © 2017 JC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicTacToeButton : UIButton

@property (nonatomic) NSArray *coordinates;
@property (nonatomic) NSNumber *value;
@property (nonatomic) BOOL isBottomToTopDiagnol;
@property (nonatomic) BOOL isTopToBottomDiagnol;
@property (nonatomic) BOOL isCorner;

@end
