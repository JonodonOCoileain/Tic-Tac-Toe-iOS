//
//  TicTacToeConstants.h
//  Tic Tac Toe
//
//  Created by Jonathan Collins on 12/8/17.
//  Copyright © 2017 JC. All rights reserved.
//

#ifndef TicTacToeConstants_h
#define TicTacToeConstants_h

typedef NS_ENUM(NSUInteger, SquareStatus) {
    /* An indicator for an empty square */
    empty = 0,
    /* An inidcator for an X */
    X = 1,
    /* An indicator for an O */
    O = 2
};

#define ARC4RANDOM_MAX 0x100000000
#define kLevelInt 4
#define kGridLineWidth 6.0f
#define kXAndOLineWidth 9.0f
#define kDimensionTitle @"Dimension"
#define kDimensionMessage @"The dimension of this game must be an integer of two or greater and less than or equal to one seventy. The default of four has been entered for you."
#define kOK @"OK"
#define kDrawCircleAnimation @"drawCircleAnimation"
#define kDrawLineAnimation @"drawLineAnimation"
#define kStrokeEnd @"strokeEnd"
#define kMinimumDimension 1
#define kZero 0
#define kOne 1
#define kTwo 2
#define kThree 3
#define kFour 4
#define kFourString @"4";
#define kFourCorners @"Four Corners!"
#define kGameButtonID @"gameButton"
#define kRow @"Row!"
#define kSquare @"Square!"
#define kOImageName @"o.png"
#define kXImageName @"x.png"
#define kAnimationDuration 0.5
#define kSecondHalfOfXWaitSeconds 0.5
#define kGridLineAnimationDuration 0.2
#define kWinningPrefix @"Winner by "
static const float kGridInset = 8.0f;
static const float kButtonInset = 8.0f;
static const float kLevelFloat = (float)kLevelInt;

#endif /* TicTacToeConstants_h */
