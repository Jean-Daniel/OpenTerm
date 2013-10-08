//
//  main.m
//  OpenTerm
//
//  Created by Jean-Daniel Dupas on 13/08/09.
//  Copyright 2009 Ninsight. All rights reserved.
//

#import "Finder.h"

@interface OpenTerm : NSObject

- (void)openTerm:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)outError;
- (void)openTermFront:(NSPasteboard *)pboard userData:(NSString *)data error:(NSString **)outError;

@end

int main (int argc, const char * argv[]) {
  @autoreleasepool {
    OpenTerm *term = [[OpenTerm alloc] init];
    NSRegisterServicesProvider(term, @"org.shadowlab.open-term");
    // Quit after 3 seconds of inactivity (avoid zombies)
    [NSTimer scheduledTimerWithTimeInterval:3 target:term selector:@selector(terminate:) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] run];
  }
  return 0;
}

@implementation OpenTerm

static CFStringRef const kTerminalBundleIdentifier = CFSTR("com.apple.Terminal");

static
void OpenTerminalInFolder(NSURL *url) {
  CFURLRef term = NULL;
  if (noErr == LSFindApplicationForInfo(kLSUnknownCreator, kTerminalBundleIdentifier, NULL, NULL, &term)) {
    NSArray *urls = @[url];
    
    LSLaunchURLSpec spec = {};
    spec.appURL = term;
    spec.itemURLs = SPXNSToCFArray(urls);
    LSOpenFromURLSpec(&spec, NULL);
  }
}

- (void)terminate:(NSTimer *)aTimer {
  NSUnregisterServicesProvider(@"org.shadowlab.open-term");
  // probably called by double-clic, refresh the list
  NSUpdateDynamicServices();
  exit(0);
}

- (BOOL)openTerm:(NSArray *)urls {
  if ([urls count] > 1) {
    // More than one item, open parent of .
    OpenTerminalInFolder([[urls objectAtIndex:0] URLByDeletingLastPathComponent]);
    return YES;
  } else if ([urls count] > 0) {
    BOOL isDir = NO;
    NSString *path = [[urls objectAtIndex:0] path];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir]) {
      if (isDir) {
        OpenTerminalInFolder([urls objectAtIndex:0]);
        return YES;
      } else {
        // open parent of [urls objectAtIndex:0]
        OpenTerminalInFolder([[urls objectAtIndex:0] URLByDeletingLastPathComponent]);
        return YES;
      }
    }
  }
  return NO;
}

- (void)openTermFront:(NSPasteboard *)pboard userData:(NSString *)data error:(__autoreleasing NSString **)outError {
  FinderApplication *finder = [FinderApplication applicationWithBundleIdentifier:@"com.apple.Finder"];
  NSURL *url = nil;
#if 0
  // not reliable
  FinderItem *item = [finder.insertionLocation get];
  NSString *here = item.URL;
  if (here)
    url = [NSURL URLWithString:here];
#else
  SBElementArray *windows = finder.windows;
  if ([windows count] > 0) {
    id item = [[windows objectAtIndex:0] get];
    if ([item respondsToSelector:@selector(target)]) {
      FinderItem *target = [[item target] get];
      if ([target respondsToSelector:@selector(URL)]) {
        NSString *str = [target URL];
        if (str)
          url = [NSURL URLWithString:str];
      }
    }
  }
#endif
  if (!url)
    url = [NSURL fileURLWithPath:[@"~/Desktop" stringByExpandingTildeInPath]];
  if (url)
    [self openTerm:[NSArray arrayWithObject:url]];
}

- (void)openTerm:(NSPasteboard *)pboard userData:(NSString *)data error:(__autoreleasing NSString **)outError {
  if (outError) *outError = nil;
  
  NSArray *classes = [NSArray arrayWithObject:[NSURL class]];
  NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] 
                                                   forKey:NSPasteboardURLReadingFileURLsOnlyKey];
  if ([pboard canReadObjectForClasses:classes options:opts]) {
    // contains URLS
    NSArray *urls = [pboard readObjectsForClasses:classes options:opts];
    if ([self openTerm:urls])
      [self terminate:nil];
  }
  
  NSString *type = [pboard availableTypeFromArray:[NSArray arrayWithObject:NSFilenamesPboardType]];
  if (type) {
    NSArray *filenames = [pboard propertyListForType:type];
    // do the same.
    NSMutableArray *urls = [NSMutableArray array];
    for (NSString *file in filenames) {
      [urls addObject:[NSURL fileURLWithPath:file]];
    }

    if ([self openTerm:urls])
      [self terminate:nil];
  }
  [self terminate:nil];
}

@end

