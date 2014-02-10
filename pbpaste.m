#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

int pbpaste(NSString *pasteboardType) {
    UIPasteboard *clipboard = [UIPasteboard generalPasteboard];

    if (![clipboard containsPasteboardTypes:@[pasteboardType]])
        return -1;

    NSData *data = [clipboard dataForPasteboardType:pasteboardType];
    [[NSFileHandle fileHandleWithStandardOutput] writeData:data];

    return 0;
}

int main(int argc, char **argv, char **envp) {
    @autoreleasepool {
        if (argc > 1) {
            if (strcmp(argv[1], "-help") == 0 || strcmp(argv[1], "--help") == 0 || strcmp(argv[1], "-h") == 0) {
                printf("Usage: %s [-help | public.pasteboard-type ]\n%s takes the string from the clipboard and writes it to the standard output. Optionally, the pasteboard type to retrieve may be specified.\n", argv[0], argv[0]);
                return 0;
            } else {
                return pbpaste([NSString stringWithUTF8String:argv[1]]);
            }
        } else {
            // UIPasteboardTypeListString is nil for some reason; no time to debug right now
            NSArray *stringTypes = @[(id)kUTTypeText, (id)kUTTypePlainText, (id)kUTTypeUTF8PlainText];

            int result;
            for (NSString *type in stringTypes) {
                result = pbpaste(type);
                if (result == 0)
                    break;
            }
            return result;
        }
    }
}
