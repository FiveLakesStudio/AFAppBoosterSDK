/*!
 *  @header    AppsfireSDKConstants.h
 *  @abstract  Appsfire SDK Constants Header
 *  @version   2.0
 */

/*!
 *  @brief Names of notifications you can observe in Appsfire SDK
 *  @since 2.0
 */

// sdk is initializing
#define kAFSDKIsInitializing                @"AFSDKisInitializing"

// sdk is initialized
#define kAFSDKIsInitialized                 @"AFSDKisInitialized"

// notifications count was updated
#define kAFSDKNotificationsNumberChanged    @"AFSDKNotificationsNumberChanged"

// dictionary (localized strings) is updated
#define kAFSDKDictionaryUpdated             @"AFSDKdictionaryUpdated"

// panel (for notifications or feedback) was presented
#define kAFSDKPanelWasPresented             @"AFSDKPanelWasPresented"

// panel (for notifications or feedback) was dismissed
#define kAFSDKPanelWasDismissed             @"AFSDKPanelWasDismissed"


/*!
 *  @brief Enum for deciding appsfire sdk presentation style
 *
 *  @note Embedded display allows users to see your application behind.
 *  Fullscreen is like its name, users won't see your application and will be immersed into the sdk.
 *
 *  @since 2.0
 */
typedef NS_ENUM(NSUInteger, AFSDKPanelStyle) {
    AFSDKPanelStyleDefault,         // display on part of the screen so your app is visible behind
    AFSDKPanelStyleFullscreen       // display on the whole screen (iPhone/iPod only)
};


/*!
 *  @brief Enum for deciding appsfire sdk content type
 *
 *  @note Default displays by default the notifications, but the user can send a feedback too thanks to a button.
 *  'Feedback only' will directly display the feedback form, user won't be able to see notifications list.
 *
 *  @since 2.0
 */
typedef NS_ENUM(NSUInteger, AFSDKPanelContent) {
    AFSDKPanelContentDefault,       // display notifications wall
    AFSDKPanelContentFeedbackOnly   // display the feedback form only
};


/*!
 *  @brief Enum for sdk error code.
 *  @since 2.0
 */
typedef NS_ENUM(NSUInteger, AFSDKErrorCode) {
    // base sdk
    AFSDKErrorCodeUnknown,                              // unknown
    AFSDKErrorCodeLibraryNotInitialized,                // library isn't initialized yet
    AFSDKErrorCodeInternetNotReachable,                 // internet isn't reachable (and is required)
    AFSDKErrorCodeNeedsApplicationDelegate,             // you need to set the application delegate to proceed
    // advertising sdk / requesting a modal ad
    AFSDKErrorCodeAdvertisingNoAd,                      // no ad available
    AFSDKErrorCodeAdvertisingBadCall,                   // the request call isn't appropriate
    AFSDKErrorCodeAdvertisingAlreadyDisplayed,          // an ad is currently displayed for this format
    AFSDKErrorCodeAdvertisingCanceledByDevelopper,      // the request was canceled by the developer
    // base sdk / presenting panel
    AFSDKErrorCodePanelAlreadyDisplayed,                // the panel is already displayed
    // base sdk / open notification
    AFSDKErrorCodeOpenNotificationNotFound              // the notification wasn't found
    
};
