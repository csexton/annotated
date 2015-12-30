//
//  AnnotatedImageController.h
//  Captured
//
//  Created by Christopher Sexton on 9/10/11.
//  Copyright 2011 Codeography. All rights reserved.
//

#import "APoint.h"

@implementation APoint

- (id)initWithCGPoint:(CGPoint)p {
  if ((self = [super init]) == nil) {
    return self;
  } // end if
  point.x = p.x;
  point.y = p.y;

  return self;
}

- (CGPoint)getCGPoint {
  return point;
}

- (float)x {
  return point.x;
}

- (float)y {
  return point.y;
} // end y

@end