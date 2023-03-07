// // ignore_for_file: non_constant_identifier_names
// import 'languages.dart';
// class LanguageEn extends Languages {
//
//   //general
//   @override
//   String get PASSWORD => "Password";
//   @override
//   String get EMAIL => "Email";
//   @override
//   String get NO_ADDS_FOUND => "No ads found";
//   @override
//   String get NO_NOTIFICATIONS => "No notifications";
//   @override
//   String get SAVE => "SAVE";
//   @override
//   String get SEND => "SEND";//
//   @override
//   String get SUBMIT => "SUBMIT";
//   @override
//   String get ALL => "All";
//   @override
//   String get OK => "Ok";
//   @override
//   String get ZERO_SAR => "0 SAR";
//   @override
//   String get SAR => "SAR";
//   @override
//   String get TO => "to";
//
//   //MAINPAGE
//   @override
//   String get SIGNIN => "Sign In";
//   @override
//   String get CONTINUE_AS_GUEST => "Continue as guest";
//   @override
//   String get CREATE_ACCOUNT => "Create Account";
//
//   //LOGIN
//   @override
//   String get SIGNIN_EMAIL_HINT => "Email";
//   @override
//   String get SIGNIN_PASSWORD_HINT => "Password";
//   @override
//   String get LOGIN => "Log In";
//   @override
//   String get DONT_HAVE_AN_ACCOUNT => "Dont have an account? Signup";
//   @override
//   String get CONTINUE_WITH_FACEBOOK => "Continue with Facebook";
//   String get CONTINUE_WITH_GOOGLE => "Continue with Google";
//   @override
//   String get FORGOT_PASSWORD => "Forgot Password";//
//   @override
//   String get NO_ACCOUNT => "Don't have an account? ";//
//
//   //SIGNUP
//   @override
//   String get BACK_TO_LOGIN => "Back to Login";
//   @override
//   String get BIRTHDAY => "Date of Birth *";
//   @override
//   String get CONFIRM_PASSWORD => "Confirm Password *";
//   @override
//   String get FIRST_NAME => "First Name *";
//   @override
//   String get FORGOTPASSWORD => "Forgot Password?";
//   @override
//   String get LAST_NAME => "Last Name *";
//   @override
//   String get MOBILE_NUMBER => "Mobile Number *";
//   @override
//   String get MOBILE_NUMBER_EXTRA => "This number will be used to contact you in case of a problem with your order";
//   @override
//   String get MOBILE_NUMBER_HINT => "12345678";
//   @override
//   String get NEWS_LETTER => "Receive our Newsletter";
//   @override
//   String get NEWS_LETTER_EXTRA => "Discover our latest collections, news and inspirations before anyone else.";
//   @override
//   String get NEWS_LETTER_NO => "No";
//   @override
//   String get NEWS_LETTER_YES => "Yes";
//   @override
//   String get REGISTER => "Register";
//   @override
//   String get REQUIRED_FIELDS => "Required Fields";
//   @override
//   String get SIGNUP_EMAIL_HINT => "Email";
//   @override
//   String get SIGNUP_PASSWORD_EXTRA => "Your password must have atleast 8 characters";
//   @override
//   String get SIGNUP_PASSWORD_HINT => "Password";
//   @override
//   String get TERMS =>  "I have read and agreed to Term and condition";
//   @override
//   String get TITLE => "Title *";
//   @override
//   String get TITLE_MR => "Mr.";
//   @override
//   String get TITLE_MS => "Ms.";
//   @override
//   String get USERNAME => "Username *";
//
//
//   //HOME
//   @override
//   String get ADD_MY_OUTLET => "Add My Outlet";
//   @override
//   String get BEST_PRODUCTS => "Best Products";
//   @override
//   String get BRAND_CATEGORY => "Brand Category";
//   @override
//   String get NEW_IN_BOUTIQUE => "NEW IN from Boutiques";
//   @override
//   String get NEW_IN_BOUTIQUE_DETAILS => ' Add your favorite boutiques and see items that you like';
//   @override
//   String get SEARCH => 'Search for items,members...';
//   @override
//   String get SUPER_SELLER => "Super Seller";
//   @override
//   String get VIEW_ALL => "View all";
//   @override
//   String get CATEGORY => "Category";
//
//   //LATESTPRODUCTS
//   @override
//   String get LATEST_PRODUCTS_TITLE => "New Arrivals";
//   @override
//   String get NEW_PRODUCTS_COUNT => "New Products";
//
//   //NOTIFICATIONS
//   @override
//   String get NOTIFICATIONS_TITLE => "Notifications";
//
//   //MY_PAGE
//   @override
//   String get EDIT_ACCOUNT_INFO => "Edit Account Info";
//   @override
//   String get FAQ => "FAQ";
//   @override
//   String get HELP => "Help";
//   @override
//   String get INBOX => "Inbox";
//   @override
//   String get MY_AF24 => "My Af24";
//   @override
//   String get MY_ITEMS => "My Items";
//   @override
//   String get MY_PAGE_TITLE => "My page";
//   @override
//   String get ORDER_HISTORY => "Order History";
//   @override
//   String get PRIVACY => "Privacy";
//   @override
//   String get PUSH_NOTIFICATIONS => "Push Notifications";
//   @override
//   String get SELL_WITH_US => "Sell with us!";
//   @override
//   String get SETTINGS => "Settings";
//
//
//
//
//   //signup
//   @override
//   String get NAME_HINT => "Full name";
//   @override
//   String get EMAIL_HINT => "Email";
//   @override
//   String get GENDER => "Gender";
//   @override
//   String get MALE => "Male";
//   @override
//   String get FEMALE => "Female";
//   @override
//   String get AGE => "Age";
//   @override
//   String get COUNTRY => "Country";
//   @override
//   String get SELECT_COUNTRY => "Select Country";
//   @override
//   String get CITY => "City";
//   @override
//   String get SELECT_CITY => "Select City";
//   @override
//   String get AREA => "Area";
//   @override
//   String get SELECT_AREA => "Select Area";
//   @override
//   String get ZONE => "Zone";
//   @override
//   String get SELECT_ZONE => "Select Zone";
//   @override
//   String get TERMS_CONDITIONS => "Terms and Conditions";
//   @override
//   String get VERIFICATION_CODE_SENT => "A verification code has been sent to your email";
//   @override
//   String get AGREE_TERMS => "Please agree to our Terms and Conditions";
//   @override
//   String get ALREADY_ACCOUNT => "Already have an account? ";
//   @override
//   String get INVALID_NAME => "Name is required";
//   @override
//   String get INVALID_AGE => "Age is required";
//   @override
//   String get INVALID_EMAIL => "Invalid email";
//   @override
//   String get INVALID_PASSWORD => "Password is required";
//   @override
//   String get PASSWORD_LENGTH => "Password must be at least 8 characters";
//   @override
//   String get INVALID_PHONE => "Phone number is required";
//   @override
//   String get INVALID_MOBILE_NUMBER => "Invalid Mobile Number";
//   @override
//   String get REQUIRED => "This field is required";
//   @override
//   String get SKIP => "Skip";
//   @override
//   String get UNDER => "Under";
//   @override
//   String get ABOVE => "Above";
//   @override
//   String get PLEASE_WAIT => "Please wait";
//
//   //OTP
//   @override
//   String get VERIFICATION => "Verification";
//   @override
//   String get ENTER_OTP => "Enter your otp";
//   @override
//   String get VERIFY => "Verify";
//   @override
//   String get NO_OTP => "No code received?";
//   @override
//   String get RESEND_CODE => "Resend new code";
//
//   //bottom navigation
//   @override
//   String get YES => "Yes";
//   @override
//   String get NO => "No";
//   @override
//   String get EXIT_APP_TEXT => "Are you sure you want to exit the app?";
//   @override
//   String get HOME => "Live Ad";
//   @override
//   String get ARCHIVE => "Last 24h Ads";
//   @override
//   String get WINNERS => "Winners";
//   @override
//   String get PROFILE => "Profile";
//   @override
//   String get WISHLIST => "Favorite Ads";
//
//   //drawer
//   @override
//   String get DASHBOARD => "Dashboard";
//   @override
//   String get NOTIFICATIONS => "Notifications";
//   @override
//   String get PRIVACY_POLICY => "Privacy Policy";
//   @override
//   String get ABOUT_US => "About Us";
//   @override
//   String get LOGOUT => "Logout";
//
//   //winners page
//   @override
//   String get NO_WINNERS_FOUND => "No winners found";
//   @override
//   String get GROUP => "Group: ";
//   @override
//   String get WINNING_DATE => "Winning date: ";
//   @override
//   String get SELECT_DATE => "Select date: ";
//   @override
//   String get ALL_WINNERS => "All Winners";
//   @override
//   String get PRIZE_MONEY => "Value: ";
//
//   //profile page
//   @override
//   String get PROFILE_UPDATED => "Profile Updated Successfully";
//
//   //dashboard
//   @override
//   String get TOTAL_APP_DOWNLOADS => "Followers";
//   @override
//   String get TODAY_LOTTERY_VALUE => "Next Lucky Draw";
//   @override
//   String get TODAY_LOTTERY_PRIZE => "Value of Upcoming Lucky Draw";
//   @override
//   String get NUMBER_OF_WINNERS => "# of Winners";
//   @override
//   String get VALUE => "Value, SAR";
//   @override
//   String get NO_LOTTERY => "No lucky draw has been declared yet";
//
//
//
//
//
// }
//




// ignore_for_file: non_constant_identifier_names
import 'languages.dart';
class LanguageEn extends Languages {

  //general
  @override
  String get PASSWORD => "Password";
  @override
  String get EMAIL => "Email";
  @override
  String get NO_ADDS_FOUND => "No ads found";
  @override
  String get NO_NOTIFICATIONS => "No notifications";
  @override
  String get SAVE => "SAVE";
  @override
  String get SEND => "SEND";//
  @override
  String get SUBMIT => "SUBMIT";
  @override
  String get ALL => "All";
  @override
  String get OK => "Ok";
  @override
  String get ZERO_SAR => "0 SAR";
  @override
  String get SAR => "SAR";
  @override
  String get TO => "to";
  @override
  String get SUCCESS => "Success";
  @override
  String get ERROR => "Error";
  @override
  String get ADDRESS => "Address";
  @override
  String get CANCEL => "Cancel";
  @override
  String get WISHLIST => "Wishlist";
  @override
  String get Orders => "Orders";

  //MAINPAGE
  @override
  String get SIGNIN => "Sign In";
  @override
  String get CONTINUE_AS_GUEST => "Continue as guest";
  @override
  String get CREATE_ACCOUNT => "Create Account";

  //LOGIN
  @override
  String get SIGNIN_EMAIL_HINT => "Email";
  @override
  String get LOGIN_FAILED => "Login Failed.";
  @override
  String get SIGNIN_PASSWORD_HINT => "Password";
  @override
  String get LOGIN => "Log In";
  @override
  String get DONT_HAVE_AN_ACCOUNT => "Don't have an account? Signup";
  @override
  String get CONTINUE_WITH_FACEBOOK => "Continue with Facebook";
  String get CONTINUE_WITH_GOOGLE => "Continue with Google";
  @override
  String get FORGOT_PASSWORD => "Forgot Password";//
  @override
  String get NO_ACCOUNT => "Don't have an account? ";//

  //SIGNUP
  @override
  String get BACK_TO_LOGIN => "Back to Login";
  @override
  String get BIRTHDAY => "Date of Birth *";
  @override
  String get CONFIRM_PASSWORD => "Confirm Password";
  @override
  String get FIRST_NAME => "First Name";
  @override
  String get FORGOTPASSWORD => "Forgot Password?";
  @override
  String get LAST_NAME => "Last Name";
  @override
  String get MOBILE_NUMBER => "Mobile Number *";
  @override
  String get MOBILE_NUMBER_EXTRA => "This number will be used to contact you in case of a problem with your order";
  @override
  String get MOBILE_NUMBER_HINT => "12345678";
  @override
  String get NEWS_LETTER => "Receive our Newsletter";
  @override
  String get NEWS_LETTER_EXTRA => "Discover our latest collections, news and inspirations before anyone else.";
  @override
  String get NEWS_LETTER_NO => "No";
  @override
  String get NEWS_LETTER_YES => "Yes";
  @override
  String get REGISTER => "Register";
  @override
  String get REQUIRED_FIELDS => "Required Fields";
  @override
  String get SIGNUP_EMAIL_HINT => "Email";
  @override
  String get SIGNUP_PASSWORD_EXTRA => "Your password must have atleast 8 characters";
  @override
  String get SIGNUP_PASSWORD_HINT => "Password";
  @override
  String get TERMS =>  "I have read and agreed to ";
  @override
  String get TITLE => "Gender *";
  @override
  String get TITLE_MR => "Male";
  @override
  String get TITLE_MS => "Female";
  @override
  String get USERNAME => "Username";
  @override
  String get CONFIRM_PASSWORD_MATCH => "Confirm password didn't match";
  @override
  String get PASSWORD_CONDITION => "Password Should be at least 8 characters";
  @override
  String get DOB_CONDITION => "Date of Birth is not Valid.";
  @override
  String get EMAIL_CONDITION => "Email is not correct";
  @override
  String get MOBILE_CONDITION => "Mobile Number should be from 4 - 14 digits.";
  @override
  String get TERMS_CONDITION => "Terms and Conditions.";
  @override
  String get COUNTRY_CONDITION => "Country is required.";


  //HOME
  @override
  String get ADD_MY_OUTLET => "Add My Outlet";
  @override
  String get BEST_PRODUCTS => "Best Products";
  @override
  String get BRAND_CATEGORY => "Brand Category";
  @override
  String get NEW_IN_BOUTIQUE => "NEW IN from Boutiques";
  @override
  String get NEW_IN_BOUTIQUE_DETAILS => ' Add your favorite boutiques and see items that you like';
  @override
  String get SEARCH => 'Search for items,members...';
  @override
  String get SUPER_SELLER => "Super Seller";
  @override
  String get VIEW_ALL => "View all";
  @override
  String get CATEGORY => "Category";
  @override
  String get NO_TOP_RATED_PRODUCTS => "No Top Rated Products";
  @override
  String get NO_BRAND_PRODUCTS => "No Brands Found";
  @override
  String get NO_TOP_SELLERS => "No Top Sellers Found";
  @override
  String get BEST_PRODUCT => "Best Products";
  @override
  String get NO_BEST_PRODUCT => "No Best Products";

  //LATESTPRODUCTS
  @override
  String get LATEST_PRODUCTS_TITLE => "New Arrivals";
  @override
  String get NEW_PRODUCTS_COUNT => "New Products";

  //NOTIFICATIONS
  @override
  String get NOTIFICATIONS_TITLE => "Notifications";
  @override
  String get SIZE => "Size";
  @override
  String get COLOR => "Color";
  @override
  String get QUANTITY => "Quantity";

  //MY_PAGE
  @override
  String get EDIT_ACCOUNT_INFO => "Edit Account Info";
  @override
  String get FAQ => "FAQ";
  @override
  String get HELP => "Help";
  @override
  String get INBOX => "Inbox";
  @override
  String get MY_AF24 => "My Af24";
  @override
  String get MY_ITEMS => "My Items";
  @override
  String get MY_PAGE_TITLE => "My page";
  @override
  String get ORDER_HISTORY => "Order History";
  @override
  String get PRIVACY => "Privacy";
  @override
  String get PUSH_NOTIFICATIONS => "Push Notifications";
  @override
  String get SELL_WITH_US => "Sell with us!";
  @override
  String get SETTINGS => "Settings";




  //signup
  @override
  String get NAME_HINT => "Full name";
  @override
  String get EMAIL_HINT => "Email";
  @override
  String get GENDER => "Gender";
  @override
  String get MALE => "Male";
  @override
  String get FEMALE => "Female";
  @override
  String get AGE => "Age";
  @override
  String get COUNTRY => "Country";
  @override
  String get SELECT_COUNTRY => "Select Country";
  @override
  String get CITY => "City";
  @override
  String get SELECT_CITY => "Select City";
  @override
  String get AREA => "Area";
  @override
  String get SELECT_AREA => "Select Area";
  @override
  String get ZONE => "Zone";
  @override
  String get SELECT_ZONE => "Select Zone";
  @override
  String get TERMS_CONDITIONS => "Terms and Conditions";
  @override
  String get VERIFICATION_CODE_SENT => "A verification code has been sent to your email";
  @override
  String get AGREE_TERMS => "Please agree to our Terms and Conditions";
  @override
  String get ALREADY_ACCOUNT => "Already have an account? ";
  @override
  String get INVALID_NAME => "Name is required";
  @override
  String get INVALID_AGE => "Age is required";
  @override
  String get INVALID_EMAIL => "Invalid email";
  @override
  String get INVALID_PASSWORD => "Password is required";
  @override
  String get PASSWORD_LENGTH => "Password must be at least 8 characters";
  @override
  String get INVALID_PHONE => "Phone number is required";
  @override
  String get INVALID_MOBILE_NUMBER => "Invalid Mobile Number";
  @override
  String get REQUIRED => "This field is required";
  @override
  String get SKIP => "Skip";
  @override
  String get UNDER => "Under";
  @override
  String get ABOVE => "Above";
  @override
  String get PLEASE_WAIT => "Please wait";

  //OTP
  @override
  String get VERIFICATION => "Verification";
  @override
  String get ENTER_OTP => "Enter your otp";
  @override
  String get VERIFY => "Verify";
  @override
  String get NO_OTP => "No code received?";
  @override
  String get RESEND_CODE => "Resend new code";

  //bottom navigation
  @override
  String get YES => "Yes";
  @override
  String get NO => "No";
  @override
  String get EXIT_APP_TEXT => "Are you sure you want to exit the app?";
  @override
  String get HOME => "Live Ad";
  @override
  String get ARCHIVE => "Last 24h Ads";
  @override
  String get WINNERS => "Winners";
  @override
  String get PROFILE => "Profile";
  @override
  String get WISHLIST_ADS => "Favorite Ads";

  //drawer
  @override
  String get DASHBOARD => "Dashboard";
  @override
  String get NOTIFICATIONS => "Notifications";
  @override
  String get PRIVACY_POLICY => "Privacy Policy";
  @override
  String get ABOUT_US => "About Us";
  @override
  String get LOGOUT => "Logout";

  //winners page
  @override
  String get NO_WINNERS_FOUND => "No winners found";
  @override
  String get GROUP => "Group: ";
  @override
  String get WINNING_DATE => "Winning date: ";
  @override
  String get SELECT_DATE => "Select date: ";
  @override
  String get ALL_WINNERS => "All Winners";
  @override
  String get PRIZE_MONEY => "Value: ";

  //profile page
  @override
  String get PROFILE_UPDATED => "Profile Updated Successfully";

  //dashboard
  @override
  String get TOTAL_APP_DOWNLOADS => "Followers";
  @override
  String get TODAY_LOTTERY_VALUE => "Next Lucky Draw";
  @override
  String get TODAY_LOTTERY_PRIZE => "Value of Upcoming Lucky Draw";
  @override
  String get NUMBER_OF_WINNERS => "# of Winners";
  @override
  String get VALUE => "Value, SAR";
  @override
  String get NO_LOTTERY => "No lucky draw has been declared yet";
//Address and AddressCheckOut
  @override
  String get GUEST => "Guest";
  @override
  String get NAME => "Name";
  @override
  String get ADDRESS_TYPE => "Address Type";
  @override
  String get TEMPORARY_PERMANENT => "Temporary / Permanent";
  @override
  String get ZIP_CODE => "Zip Code";
  @override
  String get PHONE_NO => "Phone No. *";
  @override
  String get HINT_NO => "12345678";
  @override
  String get ORDER_PROBLEM_NO => "This number will be used to contact you in case of a problem with your order";
  @override
  String get ADDRESS_DETAILS => "Add Address details";
  @override
  String get LOGIN_BACK => "Back to Login";
  @override
  String get FIELDS_REQ => "Required fields";
  //AddressList
  @override
  String get LOGIN_FIRST => "You have to Log In first.";
  @override
  String get EMPTY_ADDRESS => "Address is Empty";
  //Select_Address_CheckOut
  @override
  String get SELECT_ADDRESS => "Select Address";
  //Favourites_List_screens
  @override
  String get FAVOURITE_SELLERS => "Favourite Sellers";
  @override
  String get REMOVE_FAVOURITES => "Remove from Favourite";
  @override
  String get GUEST_MODE => "Guest Mode";
  //Add_favourite_screens
  @override
  String get ADD_FAVOURITE => "Add To Favourite";
  @override
  String get VIEW_FAVOURITES => "View Favourites";
  @override
  String get ALL_SELLERS => "All Sellers";
  //AllBrands
  @override
  String get ALL_BRANDS=> "All Brands";
  //Language_main
  @override
  String get SEARCH_ITEM=> "Search for items,members...";
  @override
  String get APP_LANGUAGE_SETTING=> "App Language Settings";
  @override
  String get KOREAN=> "Korean (KR)";
  @override
  String get AREA_SETUP=> "Same as area set up on your phone, Shall we set it up?";
  @override
  String get CHANGE=> "To Change";
  @override
  String get SELECT => "To Select";
//Language_OPTION
  @override
  String get SELECT_REGION=> "To Select a region";
  @override
  String get SELECT_LOCATION=> "Please select the location";
  @override
  String get LANGUAGE_WHERE_YOU=> "(language) where you are '";
  @override
  String get USING_APP=> "using the App";
  @override
  String get VALIDATE=> "VALIDATE";
  @override
  String get PRODUCT_FOUND=> "No Products Found.";

//BRAND
  @override
  String get REQUEST_COMPLETED=> "Request Completed";
  @override
  String get FOLLOW=> "Follow";
  @override
  String get UN_FOLLOW=> "UnFollow";
  @override
  String get PRODUCT=> "Product";
//CART
  @override
  String get VOUCHER_CODE=> "Enter Voucher code";
  @override
  String get APPLY_VOUCHER=> "Apply Voucher";
  @override
  String get YOUR_CART=> "Your Cart";
  @override
  String get EMPTY_CART=> "Cart is Empty";
  @override
  String get ADD_VOUCHER_CODE=> "Add voucher code";
  @override
  String get TOTAL=> "Total";
  @override
  String get CHECK_OUT=> "Check Out";
  //CHAT_SCREEN
  @override
  String get QUICK_ANS=> "A quick answer, usually in a few minutes";
  @override
  String get WRITE_MESSAGE=> "Write a message";

//CHECK_OUT
  @override
  String get CHECKOUT=> "Checkout";
  @override
  String get ADD_ADDRESS=> "Add Address";
  @override
  String get PAYMENT_METHOD=> "Select Payment Method";
  @override
  String get SUB_TOTAL=> "Sub total";
  @override
  String get PLACE_ORDER=> "Place Order";
  @override
  String get ORDER_PLACED=> "Order Placed Successfully";
//Edit_Customer_info
  @override
  String get EDIT_CUSTOMER_INFO=> "EDIT_CUSTOMER_INFO";
  String get PHONE_LENGTH=> "Phone Number Length is not correct.";
  String get SELECT_COUNTRY_FIRST=> "Kindly Select country first.";
  //FAQ_SCREEN
  @override
  String get NO_UPDATES_YET=> "There is no updates yet.";
//FORGOT_PASSWORD
  @override
  String get  EMAIL_ADDRESS=> "Your email address";
  @override
  String get  CONFIRM=> "Confirm";
  @override
  String get  CHECK_EMAIL=> "Check Your Email";
  //INBOX
  @override
  String get CHATS => "Chats";
  @override
  String get CONGRATULATIONS_UP_TO_DATE=> "Congratulations - you're up to date.";
//My_item
  @override
  String get CART => "Cart";
  @override
  String get  ALL_CATEGORY=> "All Category";
  // //ORDER_DETAILS
  @override
  String get  ORDERS_DETAILS=> "Orders details";
  @override
  String get  ORDER_NO=> "Order_No";
  @override
  String get METHOD => "Method";
  @override
  String get  CASH_ON_DELIVERY=> "Cash on delivery";
  @override
  String get  TIME_DATE=> "1:51 AM / 18 Mar-2022";
  @override
  String get  PAYMENT_STATUS=> "Payment status";
  @override
  String get  TAX=> "Tax";
  @override
  String get  DISCOUNT=> "Discount";
  @override
  String get  COUPON=> "Coupon";
  @override
  String get  SHIPPING_FEE=> "Shipping Fee";
  @override
  String get  TOTAL_AMOUNT=> "Total Amount";
  @override
  String get  CUSTOMER_CONTACT_DETAILS=> "Customer Contact Details";
  @override
  String get  CONTACT=> "Contact";
  @override
  String get  CANCEL_ORDER=> "Cancel order";
  //ORDER_LIST
  @override
  String get  MY_ORDER=> "My Order";
  @override
  String get  NO_ORDER_FOUND => "No Orders Found.";
  @override
  String get  SEARCH_DATE=> "Search Date";
  @override
  String get BLACK => "Black";
  @override
  String get  DETAILS=> "Details";
  @override
  String get  TRACKING_ID=> "Enter Tracking ID";
  @override
  String get DELIVERY_COMPANY => "Enter Delivery Company";
  @override
  String get  CONFIRMED=> "confirmed";
  //PAYMENT_METHOD
  @override
  String get  ONLINE_PAYMENT=> "Online Payment";
  @override
  String get  CONFIRM_PAYMENT_METHOD=> "Confirm payment method";
  //PRIVACY_SCREEN
  @override
  String get  PRIVACY_POLICES=> "Privacy Polices";
  @override
  String get  PRIVACY_POLICES_UPDATES=> "There is no privacy polices updates yet.";
  //PRODUCT_DETAILS_SCREEN
  @override
  String get  SELECT_SIZE=> "Select Size";
  @override
  String get  SELECT_COLOR=> "Select Color";
  @override
  String get  ENTER_QUANTITY=> "Enter Quantity";
  @override
  String get  SEND_REQUEST=> "Send Request";
  @override
  String get  ADD_TO_CART=> "Add to cart";
  @override
  String get  PRICE=> "Price";
  @override
  String get  BUY_REQUEST=> "Make an Offer";
  @override
  String get  CONTACT_SELLER=> "Contact seller";
  @override
  String get  MORE_DESCRIPTION=> "More Description";
  @override
  String get QUALITY_CONTROL=> "Quality control";
  @override
  String get  SELLER=> "Seller";
  @override
  String get  COMMENT=> "Comment";
  @override
  String get  LEAVE_FIRST_COMMENT=> "  Leave the first comment.";
  //WEB_VIEW
  @override
  String get  PAYMENT=> "Payment";
  //MY_PAGE
  @override
  String get  MY_ACCOUNT=> "My Account";
  @override
  String get  CHAT_WITH_US=> "Chat with us";
  //SELLER_PROFILE
  @override
  String get  BANK_NAME=> "Bank Name";
  @override
  String get  BRANCH=> "Branch";
  @override
  String get  ACCOUNT_ID=> "Account ID";
  @override
  String get  HOLDER_NAME=> "Holder Name";
  @override
  String get  PHONE_NUMBER=> "Phone Number";


//


  //New Screens
//
  @override
  String get ContinuewithGoogle=> 'Continue with Google';
  @override
  String get ContinuewithAppleID=> 'Continue with Apple ID';
  @override
  String get ContinuewithEmail=> 'Continue with Email';
  @override
  String get Consent=> 'Consent';
  @override
  String get Close=> 'Close';
  @override
  String get TermsandConditionse=> 'Terms and Conditionse';
  @override
  String get PrivacyPolicy=> 'Privacy Policy';
  @override
  String get MarketingandProfiling=> 'Marketing & Profiling';
  @override
  String get Continue=> 'Continue';
  @override
  String get Signup=> 'Sign up';
  @override
  String get Login=> 'Log in';
  @override
  String get Firstname=> 'First name';
  @override
  String get Lastname=> 'Last name';
  @override
  String get EmailAddress=> 'Email Address';
  @override
  String get CreatePassword=> 'Create Password';
  @override
  String get ConfirmPassword=> 'Confirm Password';
  @override
  String get Passwordneedstobeatleast8characters=> 'Password needs to be at least 8 characters';
  @override
  String get Register=> 'Register';
  @override
  String get Almostdone=> 'Almost done';
  @override
  String get Forgotpassword=> 'Forgot password';
  @override
  String get Verified=> 'Verified';
  @override
  String get Appsetting=> 'App setting';
  @override
  String get Cookies=> 'Cookies';
  @override
  String get WeusecookiesimproveyourexperienceonAf24=> 'We use cookies improve your experience on Af24';
  @override
  String get Customize=> 'Customize';
  @override
  String get Accept=> 'Accept';
  @override
  String get Chooseyourshippingcountry=> 'Choose your shipping country';
  @override
  String get Turnonmylocation=> 'Turn on my location';
  @override
  String get Next=> 'Next';
  @override
  String get Notification=> 'Notification';
  @override
  String get NotificationCategorieA=> 'Notification Categorie A';
  @override
  String get NotificationCategorieB=> 'Notification Categorie B';
  @override
  String get SkipIwillsetuplater=> 'Skip, I will setup later';
  @override
  String get Newsletter=> 'Newsletter';
  @override
  String get Done=> 'Done';
  @override
  String get Hot=> 'Hot';
  @override
  String get Boutiques=> 'Boutiques';
  @override
  String get Activities=> 'Activities';
  @override
  String get Favourites=> 'Favourites';
  @override
  String get Setting=> 'Setting';
  @override
  String get Areyouinterestedinthisproduct=> 'Are you interested in this product';
  @override
  String get Leaveacommenttotheseller=> 'Leave a comment to the seller';
  @override
  String get Aboutseller=> 'About seller';
  @override
  String get Followthisseller=> 'Follow this seller';
  @override
  String get Locatoin=> 'Locatoin';
  @override
  String get Shippingto=> 'Shippingt o';
  @override
  String get Comment=> 'Comment';
  @override
  String get Availablelanguage=> 'Available language';
  @override
  String get Since=> 'Since';
  @override
  String get Superseller=> 'Superseller';
  @override
  String get follwers=> 'follwers';
  @override
  String get Activeonlist=> 'Active on list';
  @override
  String get Sold=> 'Sold';
  @override
  String get Sellerreview=> 'Seller review';
  @override
  String get addcomment=> 'add comment';
  @override
  String get AboutBoutique=> 'About Boutique';
  @override
  String get FollowthisBoutique=> 'Follow this Boutique';
  @override
  String get boutiquereview=> 'boutique review';
  @override
  String get Support=> 'Support';
  @override
  String get Commentdetails=> 'Comment details';
  @override
  String get Ordernow=> 'Order now';
  @override
  String get Cancel=> 'Cancel';
  @override
  String get Ihaveanissuewithmyproduct=> 'I have an issue with my product';
  @override
  String get Imageupload=> 'Image upload';
  @override
  String get Orderdetails=> 'Orde rdetails';
  @override
  String get Shipping=> 'Shipping';
  @override
  String get Arrived=> 'Arrived';
  @override
  String get WaitforFeedback=> 'Wait for Feedback';
  @override
  String get Commenthistory=> 'Comment history';
  @override
  String get Reportmyissue=> 'Report my issue';
  @override
  String get DoyouhaveanyQuestion=> 'Do you have any Question';
  @override
  String get Ihaveaquestion=> 'I have a question';
  @override
  String get Title=> 'Title';
  @override
  String get Description=> 'Description';
  @override
  String get Writingsomething=> 'Writing something';
  @override
  String get Send=> 'Send';
  @override
  String get Supportmessage=> 'Support message';
  @override
  String get Feedback=> 'Feedback';
  @override
  String get AllgoodThanks=> 'All good Thanks';
  @override
  String get Products=> 'Products';
  @override
  String get Brands=> 'Brands';
  @override
  String get Sellers=> 'Sellers';
  @override
  String get Boutigues=> 'Boutigues';
  @override
  String get Account=> 'Account';
  @override
  String get Logout=> 'Log out';
  @override
  String get Personalinfo=> 'Personal info';
  @override
  String get Passwordchange=> 'Password change';
  @override
  String get Shippinginformation=> 'Shipping information';
  @override
  String get Postcode=> 'Postcode';
  @override
  String get City=> 'City';
  @override
  String get Country=> 'Country';
  @override
  String get Billingaddressissameasshipping=> 'Billing address is same as shipping';
  @override
  String get SignuporLogin=> 'Signup or Login';
  @override
  String get Search=> 'Search';
  @override
  String get Women=> 'Women';
  @override
  String get Men=> 'Men';
  @override
  String get Kids=> 'Kids';
  @override
  String get Lifestyle=> 'Lifestyle';
  @override
  String get Seller=> 'Seller';
  @override
  String get Category=> 'Category';
  @override
  String get Filter=> 'Filter';
  @override
  String get Reset=> 'Reset';
  @override
  String get Addtomyfilter=> 'Add to my filter';


}

