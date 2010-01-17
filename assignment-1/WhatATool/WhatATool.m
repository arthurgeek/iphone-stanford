#import <Foundation/Foundation.h>

void printHeader(NSString *sectionName) {
  NSLog(@"========== %@ ==========", sectionName);
}

void printPathInfo() {
  NSString *path = @"~";
  NSString *fullPath = [path stringByExpandingTildeInPath];
  NSArray *pathComponents = [fullPath pathComponents];

  printHeader(@"Path Info");
  NSLog(@"My home folder is at '%@'", fullPath);

  for (NSString *element in pathComponents) {
    NSLog(@"%@", element);
  }
}

void printProcessInfo() {
  NSProcessInfo *processInfo = [NSProcessInfo processInfo];

  printHeader(@"Process Info");
  NSLog(@"Process Name: '%@' Process ID: '%d'", [processInfo processName], [processInfo processIdentifier]);
}

void printBookmarkInfo() {
  NSMutableDictionary *bookmarks = [NSMutableDictionary dictionary];

  [bookmarks setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
  [bookmarks setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
  [bookmarks setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
  [bookmarks setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
  [bookmarks setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];

  printHeader(@"Bookmark Info");

  for (id key in bookmarks) {
    if ([key hasPrefix:@"Stanford"]) {
      NSLog(@"Key: '%@' URL: '%@'", key, [bookmarks objectForKey:key]);
    }
  }
}

void printIntrospectionInfo() {
  NSArray *anArray;
  NSURL *anURL = [NSURL URLWithString:@"http://www.stanford.edu"];
  NSString *aString = @"A String";
  NSMutableString *aMutableString = [NSMutableString string];
  NSDictionary *aDictionary = [NSDictionary dictionary];

  anArray = [NSArray arrayWithObjects:anURL, aString, aMutableString, aDictionary, nil];
  SEL selector = @selector(lowercaseString);
  [aMutableString setString:@"A Mutable String"];

  printHeader(@"Introspection Info");

  for (id object in anArray) {
    NSLog(@"Class name: %@", [object className]);
    NSLog(@"Is member of NSString: %@", ([object isMemberOfClass:[NSString class]] ? @"YES" : @"NO"));
    NSLog(@"Is kind of NSString: %@", ([object isKindOfClass:[NSString class]] ? @"YES" : @"NO"));
    NSLog(@"Responds to lowerCaseString: %@", ([object respondsToSelector:selector] ? @"YES" : @"NO"));

    if ([object respondsToSelector:selector]) {
      NSLog(@"lowerCaseString is: %@", [object performSelector:selector withObject:object]);
    }

    NSLog(@"=========================");
  }
}

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  printPathInfo();
  printProcessInfo();
  printBookmarkInfo();
  printIntrospectionInfo();

  [pool drain];
  return 0;
}
