//
//  APoint.h
//  Captured
//
//  Created by Christopher Sexton on 9/10/11.
//  Copyright 2011 Codeography. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface APoint : NSObject {
  CGPoint point;
}
- (id)initWithCGPoint:(CGPoint)p;
- (CGPoint)getCGPoint;
- (float)x;
- (float)y;

@end