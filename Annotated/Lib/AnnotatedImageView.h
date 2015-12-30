//
//  AnnotatedImageView.h
//  Captured
//
//  Created by Christopher Sexton on 9/10/11.
//  Copyright 2011 Codeography. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ABrushStroke.h"

@interface AnnotatedImageView : NSView {
  CGColorSpaceRef colorSpace;
  CGPoint currentLocation;
  CGPoint downLocation;
  NSImage *image;
  CGImageRef imageRef;

  BOOL useBrush;
  BOOL useHighlighter;
  BOOL useArrow;

  NSColor *brushColor;
  NSCursor *pencilCursor;
  NSCursor *highlighterCursor;

  NSMutableArray *arrayOfBrushStrokes;
  NSMutableArray *arrayOfPoints;

  ADrawable *currentStroke;
}

- (void)selectBrushTool;
- (void)selectHighlighterTool;
- (void)selectArrowTool;

- (void)drawBrushStrokesOn:(CGContextRef)context;

- (void)setImage:(NSImage *)i;

- (CGImageRef)nsImageToCGImageRef:(NSImage *)image;
- (void)saveViewToFile:(NSString *)path;
- (void)undoDraw;

@property (readwrite, retain) NSColor *brushColor;

@end