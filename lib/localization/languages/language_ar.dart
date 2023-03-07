// ignore_for_file: non_constant_identifier_names
import 'languages.dart';

class LanguageAr extends Languages {

  //general
  @override
  String get NO_ADDS_FOUND => "لم يتم العثور على أي اعلانات";
  @override
  String get NO_NOTIFICATIONS => "لا يوجد اشعارات";
  @override
  String get SAVE => "حفظ";
  @override
  String get SEND => "أرسل";
  @override
  String get SUBMIT => "ارسال";
  @override
  String get ALL => "الكل";
  @override
  String get OK => "موافق";
  @override
  String get ZERO_SAR => "0 ريال";
  @override
  String get SAR => "ريال";
  @override
  String get TO => "إلى";

  //welcome
  @override
  String get APP_NAME => 'جحا';
  @override
  String get WELCOME => "مرحبا";
  @override
  String get LOGIN => "تسجيل دخول";
  @override
  String get SIGNUP => "اشترك الان";

  //login
  @override
  String get PHONE_HINT => "رقم الهاتف";
  @override
  String get PASS_HINT => "كلمة المرور";
  @override
  String get FORGOT_PASSWORD => "'نسيت كلمة المرور";
  @override
  String get NO_ACCOUNT => "لايوجد لدي حسا ";

  //forgot/reset password
  @override
  String get EMAIL_VERIFICATION_TEXT => "أدخل بريدك الالكتروني للحصول على رابط تفعيل الحساب على بريدك الإلكتروني";
  @override
  String get RESET_PASSWORD => "إعادة تعيين كلمة المرور";
  @override
  String get VERIFICATION_CODE_HINT => "رمز التحقق";
  @override
  String get NEW_PASS_HINT => "'أدخل كلمة مرور جديدة";
  @override
  String get CONFIRM_PASS_HINT => "تأكيد كلمة المرور";
  @override
  String get PASSWORD_MISMATCH => "كلمة المرور غير مطابقة";
  @override
  String get CODE_MISMATCH => "الرمز غير مطابق";

  //signup
  @override
  String get NAME_HINT => 'الاسم';
  @override
  String get EMAIL_HINT => "البريد الالكتروني";
  @override
  String get GENDER => 'الجنس';
  @override
  String get MALE => 'ذكر';
  @override
  String get FEMALE => 'أنثى';
  @override
  String get AGE => "العمر";
  @override
  String get COUNTRY => "الدولة";
  @override
  String get SELECT_COUNTRY => "اختيار الدولة";
  @override
  String get CITY => "المدينة";
  @override
  String get SELECT_CITY => "اختيار المدينة";
  @override
  String get AREA => "المنطقة";
  @override
  String get SELECT_AREA => "اختيار المنطقة";
  @override
  String get ZONE => "منطقة";
  @override
  String get SELECT_ZONE => "اختيار الحي";
  @override
  String get TERMS_CONDITIONS => "الشروط والأحكام";
  @override
  String get VERIFICATION_CODE_SENT => "تم ارسال رمز التحقق إلى بريدك الالكتروني";
  @override
  String get AGREE_TERMS => "نرجو الموافقة على' الشروط والأحكام";
  @override
  String get ALREADY_ACCOUNT => "'هل لديك حساب؟ ";
  @override
  String get INVALID_NAME => "مطلوب الأسم";
  @override
  String get INVALID_EMAIL => "مطلوب البريد الإلكتروني";
  @override
  String get INVALID_AGE => "مطلوب العمر";
  @override
  String get INVALID_PASSWORD => "مطلوب كلمة المرور";
  @override
  String get PASSWORD_LENGTH => "كلمة المرور' يجب أن تحتوي على ٨ خانات";
  @override
  String get INVALID_PHONE => "مطلوب رقم الهاتف";
  @override
  String get INVALID_MOBILE_NUMBER => "رقم الجوال غير صالح";
  @override
  String get REQUIRED => "هذه الخانة مطلوبه";
  @override
  String get SKIP => "يتخطى";
  @override
  String get UNDER => "تحت";
  @override
  String get ABOVE => "في الاعلى";
  @override
  String get PLEASE_WAIT => "أرجو الإنتظار";

  //OTP
  @override
  String get VERIFICATION => "التحقق";
  @override
  String get ENTER_OTP => "أدخل كلمة المرور المؤقتة";
  @override
  String get VERIFY => "تحقق";
  @override
  String get NO_OTP => "لم يتم استلام الرمز?";
  @override
  String get RESEND_CODE => "اعادة ارسال الرمز";

  //bottom navigation
  @override
  String get YES => "نعم";
  @override
  String get NO => "لا";
  @override
  String get EXIT_APP_TEXT => "هل أنت متأكد من أنك’ تريد الخروج من التطبيق";
  @override
  String get HOME => "إعلان مباشر";
  @override
  String get ARCHIVE => "أعلانات اخر ٢٤ ساعة";
  @override
  String get WINNERS => "الفائزين";
  @override
  String get PROFILE => "الملف الشخصي";
  @override
  String get WISHLIST => "المفضلة";


  //drawer
  @override
  String get DASHBOARD => "صفحة المعلومات";
  @override
  String get NOTIFICATIONS => "الإشعارات";
  @override
  String get PRIVACY_POLICY => "سياسة الخصوصية";
  @override
  String get ABOUT_US => "من نحن";
  @override
  String get LOGOUT => "تسجيل خروج";

  //winners page
  @override
  String get NO_WINNERS_FOUND => "لم يتم العثور على فائزين";
  @override
  String get GROUP => "المجموعة: ";
  @override
  String get WINNING_DATE => "تاريخ الفوز: ";
  @override
  String get SELECT_DATE => "حدد تاريخ";
  @override
  String get ALL_WINNERS => "كل الفائزين";
  @override
  String get PRIZE_MONEY => "القيمة: ";

  //profile page
  @override
  String get PROFILE_UPDATED => "تم تحديث الملف الشخصي بنجاح";

  //dashboard
  @override
  String get TOTAL_APP_DOWNLOADS => "متابعون";
  @override
  String get TODAY_LOTTERY_VALUE => "السحب التالي";
  @override
  String get TODAY_LOTTERY_PRIZE => "قيمة السحوبات القادمة";
  @override
  String get NUMBER_OF_WINNERS => "# الفائزين";
  @override
  String get VALUE => " القيمة، ريال";
  @override
  String get NO_LOTTERY => "لم يتم الإعلان عن قرعة الحظ حتى الآن";

  @override
  // TODO: implement BACK_TO_LOGIN
  String get BACK_TO_LOGIN => throw UnimplementedError();

  @override
  // TODO: implement BIRTHDAY
  String get BIRTHDAY => throw UnimplementedError();

  @override
  // TODO: implement CONFIRM_PASSWORD
  String get CONFIRM_PASSWORD => throw UnimplementedError();

  @override
  // TODO: implement CONTINUE_AS_GUEST
  String get CONTINUE_AS_GUEST => throw UnimplementedError();

  @override
  // TODO: implement CONTINUE_WITH_FACEBOOK
  String get CONTINUE_WITH_FACEBOOK => throw UnimplementedError();

  @override
  // TODO: implement CONTINUE_WITH_GOOGLE
  String get CONTINUE_WITH_GOOGLE => throw UnimplementedError();

  @override
  // TODO: implement CREATE_ACCOUNT
  String get CREATE_ACCOUNT => throw UnimplementedError();

  @override
  // TODO: implement DONT_HAVE_AN_ACCOUNT
  String get DONT_HAVE_AN_ACCOUNT => throw UnimplementedError();

  @override
  // TODO: implement EMAIL
  String get EMAIL => throw UnimplementedError();

  @override
  // TODO: implement FIRST_NAME
  String get FIRST_NAME => throw UnimplementedError();

  @override
  // TODO: implement FORGOTPASSWORD
  String get FORGOTPASSWORD => throw UnimplementedError();

  @override
  // TODO: implement LAST_NAME
  String get LAST_NAME => throw UnimplementedError();

  @override
  // TODO: implement MOBILE_NUMBER
  String get MOBILE_NUMBER => throw UnimplementedError();

  @override
  // TODO: implement MOBILE_NUMBER_EXTRA
  String get MOBILE_NUMBER_EXTRA => throw UnimplementedError();

  @override
  // TODO: implement MOBILE_NUMBER_HINT
  String get MOBILE_NUMBER_HINT => throw UnimplementedError();

  @override
  // TODO: implement NEWS_LETTER
  String get NEWS_LETTER => throw UnimplementedError();

  @override
  // TODO: implement NEWS_LETTER_EXTRA
  String get NEWS_LETTER_EXTRA => throw UnimplementedError();

  @override
  // TODO: implement NEWS_LETTER_NO
  String get NEWS_LETTER_NO => throw UnimplementedError();

  @override
  // TODO: implement NEWS_LETTER_YES
  String get NEWS_LETTER_YES => throw UnimplementedError();

  @override
  // TODO: implement PASSWORD
  String get PASSWORD => throw UnimplementedError();

  @override
  // TODO: implement REGISTER
  String get REGISTER => throw UnimplementedError();

  @override
  // TODO: implement REQUIRED_FIELDS
  String get REQUIRED_FIELDS => throw UnimplementedError();

  @override
  // TODO: implement SIGNIN
  String get SIGNIN => throw UnimplementedError();

  @override
  // TODO: implement SIGNIN_EMAIL_HINT
  String get SIGNIN_EMAIL_HINT => throw UnimplementedError();

  @override
  // TODO: implement SIGNIN_PASSWORD_HINT
  String get SIGNIN_PASSWORD_HINT => throw UnimplementedError();

  @override
  // TODO: implement SIGNUP_EMAIL_HINT
  String get SIGNUP_EMAIL_HINT => throw UnimplementedError();

  @override
  // TODO: implement SIGNUP_PASSWORD_EXTRA
  String get SIGNUP_PASSWORD_EXTRA => throw UnimplementedError();

  @override
  // TODO: implement SIGNUP_PASSWORD_HINT
  String get SIGNUP_PASSWORD_HINT => throw UnimplementedError();

  @override
  // TODO: implement TERMS
  String get TERMS => throw UnimplementedError();

  @override
  // TODO: implement TITLE
  String get TITLE => throw UnimplementedError();

  @override
  // TODO: implement TITLE_MR
  String get TITLE_MR => throw UnimplementedError();

  @override
  // TODO: implement TITLE_MS
  String get TITLE_MS => throw UnimplementedError();

  @override
  // TODO: implement USERNAME
  String get USERNAME => throw UnimplementedError();

  @override
  // TODO: implement ADD_MY_OUTLET
  String get ADD_MY_OUTLET => throw UnimplementedError();

  @override
  // TODO: implement BEST_PRODUCTS
  String get BEST_PRODUCTS => throw UnimplementedError();

  @override
  // TODO: implement BRAND_CATEGORY
  String get BRAND_CATEGORY => throw UnimplementedError();

  @override
  // TODO: implement NEW_IN_BOUTIQUE
  String get NEW_IN_BOUTIQUE => throw UnimplementedError();

  @override
  // TODO: implement NEW_IN_BOUTIQUE_DETAILS
  String get NEW_IN_BOUTIQUE_DETAILS => throw UnimplementedError();

  @override
  // TODO: implement SEARCH
  String get SEARCH => throw UnimplementedError();

  @override
  // TODO: implement SUPER_SELLER
  String get SUPER_SELLER => throw UnimplementedError();

  @override
  // TODO: implement VIEW_ALL
  String get VIEW_ALL => throw UnimplementedError();

  @override
  // TODO: implement CATEGORY
  String get CATEGORY => throw UnimplementedError();

  @override
  // TODO: implement LATEST_PRODUCTS_TITLE
  String get LATEST_PRODUCTS_TITLE => throw UnimplementedError();

  @override
  // TODO: implement NEW_PRODUCTS_COUNT
  String get NEW_PRODUCTS_COUNT => throw UnimplementedError();

  @override
  // TODO: implement NOTIFICATIONS_TITLE
  String get NOTIFICATIONS_TITLE => throw UnimplementedError();

  @override
  // TODO: implement EDIT_ACCOUNT_INFO
  String get EDIT_ACCOUNT_INFO => throw UnimplementedError();

  @override
  // TODO: implement FAQ
  String get FAQ => throw UnimplementedError();

  @override
  // TODO: implement HELP
  String get HELP => throw UnimplementedError();

  @override
  // TODO: implement INBOX
  String get INBOX => throw UnimplementedError();

  @override
  // TODO: implement MY_AF24
  String get MY_AF24 => throw UnimplementedError();

  @override
  // TODO: implement MY_ITEMS
  String get MY_ITEMS => throw UnimplementedError();

  @override
  // TODO: implement MY_PAGE_TITLE
  String get MY_PAGE_TITLE => throw UnimplementedError();

  @override
  // TODO: implement ORDER_HISTORY
  String get ORDER_HISTORY => throw UnimplementedError();

  @override
  // TODO: implement PRIVACY
  String get PRIVACY => throw UnimplementedError();

  @override
  // TODO: implement PUSH_NOTIFICATIONS
  String get PUSH_NOTIFICATIONS => throw UnimplementedError();

  @override
  // TODO: implement SELL_WITH_US
  String get SELL_WITH_US => throw UnimplementedError();

  @override
  // TODO: implement SETTINGS
  String get SETTINGS => throw UnimplementedError();

  @override
  // TODO: implement ACCOUNT_ID
  String get ACCOUNT_ID => throw UnimplementedError();

  @override
  // TODO: implement ADDRESS
  String get ADDRESS => throw UnimplementedError();

  @override
  // TODO: implement ADDRESS_DETAILS
  String get ADDRESS_DETAILS => throw UnimplementedError();

  @override
  // TODO: implement ADDRESS_TYPE
  String get ADDRESS_TYPE => throw UnimplementedError();

  @override
  // TODO: implement ADD_ADDRESS
  String get ADD_ADDRESS => throw UnimplementedError();

  @override
  // TODO: implement ADD_FAVOURITE
  String get ADD_FAVOURITE => throw UnimplementedError();

  @override
  // TODO: implement ADD_TO_CART
  String get ADD_TO_CART => throw UnimplementedError();

  @override
  // TODO: implement ADD_VOUCHER_CODE
  String get ADD_VOUCHER_CODE => throw UnimplementedError();

  @override
  // TODO: implement ALL_BRANDS
  String get ALL_BRANDS => throw UnimplementedError();

  @override
  // TODO: implement ALL_CATEGORY
  String get ALL_CATEGORY => throw UnimplementedError();

  @override
  // TODO: implement ALL_SELLERS
  String get ALL_SELLERS => throw UnimplementedError();

  @override
  // TODO: implement APPLY_VOUCHER
  String get APPLY_VOUCHER => throw UnimplementedError();

  @override
  // TODO: implement APP_LANGUAGE_SETTING
  String get APP_LANGUAGE_SETTING => throw UnimplementedError();

  @override
  // TODO: implement AREA_SETUP
  String get AREA_SETUP => throw UnimplementedError();

  @override
  // TODO: implement BANK_NAME
  String get BANK_NAME => throw UnimplementedError();

  @override
  // TODO: implement BLACK
  String get BLACK => throw UnimplementedError();

  @override
  // TODO: implement BRANCH
  String get BRANCH => throw UnimplementedError();

  @override
  // TODO: implement BUY_REQUEST
  String get BUY_REQUEST => throw UnimplementedError();

  @override
  // TODO: implement CANCEL
  String get CANCEL => throw UnimplementedError();

  @override
  // TODO: implement CANCEL_ORDER
  String get CANCEL_ORDER => throw UnimplementedError();

  @override
  // TODO: implement CART
  String get CART => throw UnimplementedError();

  @override
  // TODO: implement CASH_ON_DELIVERY
  String get CASH_ON_DELIVERY => throw UnimplementedError();

  @override
  // TODO: implement CHANGE
  String get CHANGE => throw UnimplementedError();

  @override
  // TODO: implement CHATS
  String get CHATS => throw UnimplementedError();

  @override
  // TODO: implement CHAT_WITH_US
  String get CHAT_WITH_US => throw UnimplementedError();

  @override
  // TODO: implement CHECKOUT
  String get CHECKOUT => throw UnimplementedError();

  @override
  // TODO: implement CHECK_OUT
  String get CHECK_OUT => throw UnimplementedError();

  @override
  // TODO: implement COMMENT
  String get COMMENT => throw UnimplementedError();

  @override
  // TODO: implement CONFIRM
  String get CONFIRM => throw UnimplementedError();

  @override
  // TODO: implement CONFIRMED
  String get CONFIRMED => throw UnimplementedError();

  @override
  // TODO: implement CONFIRM_PAYMENT_METHOD
  String get CONFIRM_PAYMENT_METHOD => throw UnimplementedError();

  @override
  // TODO: implement CONGRATULATIONS_UP_TO_DATE
  String get CONGRATULATIONS_UP_TO_DATE => throw UnimplementedError();

  @override
  // TODO: implement CONTACT
  String get CONTACT => throw UnimplementedError();

  @override
  // TODO: implement CONTACT_SELLER
  String get CONTACT_SELLER => throw UnimplementedError();

  @override
  // TODO: implement COUPON
  String get COUPON => throw UnimplementedError();

  @override
  // TODO: implement CUSTOMER_CONTACT_DETAILS
  String get CUSTOMER_CONTACT_DETAILS => throw UnimplementedError();

  @override
  // TODO: implement DELIVERY_COMPANY
  String get DELIVERY_COMPANY => throw UnimplementedError();

  @override
  // TODO: implement DETAILS
  String get DETAILS => throw UnimplementedError();

  @override
  // TODO: implement DISCOUNT
  String get DISCOUNT => throw UnimplementedError();

  @override
  // TODO: implement EDIT_CUSTOMER_INFO
  String get EDIT_CUSTOMER_INFO => throw UnimplementedError();

  @override
  // TODO: implement EMAIL_ADDRESS
  String get EMAIL_ADDRESS => throw UnimplementedError();

  @override
  // TODO: implement EMPTY_ADDRESS
  String get EMPTY_ADDRESS => throw UnimplementedError();

  @override
  // TODO: implement EMPTY_CART
  String get EMPTY_CART => throw UnimplementedError();

  @override
  // TODO: implement ENTER_QUANTITY
  String get ENTER_QUANTITY => throw UnimplementedError();

  @override
  // TODO: implement ERROR
  String get ERROR => throw UnimplementedError();

  @override
  // TODO: implement FAVOURITE_SELLERS
  String get FAVOURITE_SELLERS => throw UnimplementedError();

  @override
  // TODO: implement FIELDS_REQ
  String get FIELDS_REQ => throw UnimplementedError();

  @override
  // TODO: implement FOLLOW
  String get FOLLOW => throw UnimplementedError();

  @override
  // TODO: implement GUEST
  String get GUEST => throw UnimplementedError();

  @override
  // TODO: implement GUEST_MODE
  String get GUEST_MODE => throw UnimplementedError();

  @override
  // TODO: implement HINT_NO
  String get HINT_NO => throw UnimplementedError();

  @override
  // TODO: implement HOLDER_NAME
  String get HOLDER_NAME => throw UnimplementedError();

  @override
  // TODO: implement KOREAN
  String get KOREAN => throw UnimplementedError();

  @override
  // TODO: implement LANGUAGE_WHERE_YOU
  String get LANGUAGE_WHERE_YOU => throw UnimplementedError();

  @override
  // TODO: implement LEAVE_FIRST_COMMENT
  String get LEAVE_FIRST_COMMENT => throw UnimplementedError();

  @override
  // TODO: implement LOGIN_BACK
  String get LOGIN_BACK => throw UnimplementedError();

  @override
  // TODO: implement LOGIN_FIRST
  String get LOGIN_FIRST => throw UnimplementedError();

  @override
  // TODO: implement METHOD
  String get METHOD => throw UnimplementedError();

  @override
  // TODO: implement MORE_DESCRIPTION
  String get MORE_DESCRIPTION => throw UnimplementedError();

  @override
  // TODO: implement MY_ACCOUNT
  String get MY_ACCOUNT => throw UnimplementedError();

  @override
  // TODO: implement MY_ORDER
  String get MY_ORDER => throw UnimplementedError();

  @override
  // TODO: implement NAME
  String get NAME => throw UnimplementedError();

  @override
  // TODO: implement NO_ORDER_FOUND
  String get NO_ORDER_FOUND => throw UnimplementedError();

  @override
  // TODO: implement NO_UPDATES_YET
  String get NO_UPDATES_YET => throw UnimplementedError();

  @override
  // TODO: implement ONLINE_PAYMENT
  String get ONLINE_PAYMENT => throw UnimplementedError();

  @override
  // TODO: implement ORDERS_DETAILS
  String get ORDERS_DETAILS => throw UnimplementedError();

  @override
  // TODO: implement ORDER_NO
  String get ORDER_NO => throw UnimplementedError();

  @override
  // TODO: implement ORDER_PROBLEM_NO
  String get ORDER_PROBLEM_NO => throw UnimplementedError();

  @override
  // TODO: implement PAYMENT
  String get PAYMENT => throw UnimplementedError();

  @override
  // TODO: implement PAYMENT_METHOD
  String get PAYMENT_METHOD => throw UnimplementedError();

  @override
  // TODO: implement PAYMENT_STATUS
  String get PAYMENT_STATUS => throw UnimplementedError();

  @override
  // TODO: implement PHONE_NO
  String get PHONE_NO => throw UnimplementedError();

  @override
  // TODO: implement PHONE_NUMBER
  String get PHONE_NUMBER => throw UnimplementedError();

  @override
  // TODO: implement PLACE_ORDER
  String get PLACE_ORDER => throw UnimplementedError();

  @override
  // TODO: implement PRICE
  String get PRICE => throw UnimplementedError();

  @override
  // TODO: implement PRIVACY_POLICES
  String get PRIVACY_POLICES => throw UnimplementedError();

  @override
  // TODO: implement PRIVACY_POLICES_UPDATES
  String get PRIVACY_POLICES_UPDATES => throw UnimplementedError();

  @override
  // TODO: implement PRODUCT
  String get PRODUCT => throw UnimplementedError();

  @override
  // TODO: implement PRODUCT_FOUND
  String get PRODUCT_FOUND => throw UnimplementedError();

  @override
  // TODO: implement QUALITY_CONTROL
  String get QUALITY_CONTROL => throw UnimplementedError();

  @override
  // TODO: implement QUICK_ANS
  String get QUICK_ANS => throw UnimplementedError();

  @override
  // TODO: implement REMOVE_FAVOURITES
  String get REMOVE_FAVOURITES => throw UnimplementedError();

  @override
  // TODO: implement REQUEST_COMPLETED
  String get REQUEST_COMPLETED => throw UnimplementedError();

  @override
  // TODO: implement SEARCH_DATE
  String get SEARCH_DATE => throw UnimplementedError();

  @override
  // TODO: implement SEARCH_ITEM
  String get SEARCH_ITEM => throw UnimplementedError();

  @override
  // TODO: implement SELECT
  String get SELECT => throw UnimplementedError();

  @override
  // TODO: implement SELECT_ADDRESS
  String get SELECT_ADDRESS => throw UnimplementedError();

  @override
  // TODO: implement SELECT_COLOR
  String get SELECT_COLOR => throw UnimplementedError();

  @override
  // TODO: implement SELECT_LOCATION
  String get SELECT_LOCATION => throw UnimplementedError();

  @override
  // TODO: implement SELECT_REGION
  String get SELECT_REGION => throw UnimplementedError();

  @override
  // TODO: implement SELECT_SIZE
  String get SELECT_SIZE => throw UnimplementedError();

  @override
  // TODO: implement SELLER
  String get SELLER => throw UnimplementedError();

  @override
  // TODO: implement SEND_REQUEST
  String get SEND_REQUEST => throw UnimplementedError();

  @override
  // TODO: implement SHIPPING_FEE
  String get SHIPPING_FEE => throw UnimplementedError();

  @override
  // TODO: implement SUB_TOTAL
  String get SUB_TOTAL => throw UnimplementedError();

  @override
  // TODO: implement SUCCESS
  String get SUCCESS => throw UnimplementedError();

  @override
  // TODO: implement TAX
  String get TAX => throw UnimplementedError();

  @override
  // TODO: implement TEMPORARY_PERMANENT
  String get TEMPORARY_PERMANENT => throw UnimplementedError();

  @override
  // TODO: implement TIME_DATE
  String get TIME_DATE => throw UnimplementedError();

  @override
  // TODO: implement TOTAL
  String get TOTAL => throw UnimplementedError();

  @override
  // TODO: implement TOTAL_AMOUNT
  String get TOTAL_AMOUNT => throw UnimplementedError();

  @override
  // TODO: implement TRACKING_ID
  String get TRACKING_ID => throw UnimplementedError();

  @override
  // TODO: implement UN_FOLLOW
  String get UN_FOLLOW => throw UnimplementedError();

  @override
  // TODO: implement USING_APP
  String get USING_APP => throw UnimplementedError();

  @override
  // TODO: implement VALIDATE
  String get VALIDATE => throw UnimplementedError();

  @override
  // TODO: implement VIEW_FAVOURITES
  String get VIEW_FAVOURITES => throw UnimplementedError();

  @override
  // TODO: implement VOUCHER_CODE
  String get VOUCHER_CODE => throw UnimplementedError();

  @override
  // TODO: implement WRITE_MESSAGE
  String get WRITE_MESSAGE => throw UnimplementedError();

  @override
  // TODO: implement YOUR_CART
  String get YOUR_CART => throw UnimplementedError();

  @override
  // TODO: implement ZIP_CODE
  String get ZIP_CODE => throw UnimplementedError();

  @override
  // TODO: implement ORDER_PLACED
  String get ORDER_PLACED => throw UnimplementedError();

  @override
  // TODO: implement PHONE_LENGTH
  String get PHONE_LENGTH => throw UnimplementedError();

  @override
  // TODO: implement SELECT_COUNTRY_FIRST
  String get SELECT_COUNTRY_FIRST => throw UnimplementedError();

  @override
  // TODO: implement CHECK_EMAIL
  String get CHECK_EMAIL => throw UnimplementedError();

  @override
  // TODO: implement NO_TOP_RATED_PRODUCTS
  String get NO_TOP_RATED_PRODUCTS => throw UnimplementedError();

  @override
  // TODO: implement NO_BRAND_PRODUCTS
  String get NO_BRAND_PRODUCTS => throw UnimplementedError();

  @override
  // TODO: implement NO_TOP_SELLERS
  String get NO_TOP_SELLERS => throw UnimplementedError();

  @override
  // TODO: implement BEST_PRODUCT
  String get BEST_PRODUCT => throw UnimplementedError();

  @override
  // TODO: implement NO_BEST_PRODUCT
  String get NO_BEST_PRODUCT => throw UnimplementedError();

  @override
  // TODO: implement LOGIN_FAILED
  String get LOGIN_FAILED => throw UnimplementedError();

  @override
  // TODO: implement CONFIRM_PASSWORD_MATCH
  String get CONFIRM_PASSWORD_MATCH => throw UnimplementedError();

  @override
  // TODO: implement PASSWORD_CONDITION
  String get PASSWORD_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement DOB_CONDITION
  String get DOB_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement EMAIL_CONDITION
  String get EMAIL_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement MOBILE_CONDITION
  String get MOBILE_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement COUNTRY_CONDITION
  String get COUNTRY_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement TERMS_CONDITION
  String get TERMS_CONDITION => throw UnimplementedError();

  @override
  // TODO: implement Orders
  String get Orders => throw UnimplementedError();

  @override
  // TODO: implement COLOR
  String get COLOR => throw UnimplementedError();

  @override
  // TODO: implement QUANTITY
  String get QUANTITY => throw UnimplementedError();

  @override
  // TODO: implement SIZE
  String get SIZE => throw UnimplementedError();







  //


  //New Screens
//
  @override
  String get ContinuewithGoogle=> '';
  @override
  String get ContinuewithAppleID=> '';
  @override
  String get ContinuewithEmail=> '';
  @override
  String get Consent=> '';
  @override
  String get Close=> '';
  @override
  String get TermsandConditionse=> '';
  @override
  String get PrivacyPolicy=> '';
  @override
  String get MarketingandProfiling=> '';
  @override
  String get Continue=> '';
  @override
  String get Signup=> '';
  @override
  String get Login=> '';
  @override
  String get Firstname=> '';
  @override
  String get Lastname=> '';
  @override
  String get EmailAddress=> '';
  @override
  String get CreatePassword=> '';
  @override
  String get ConfirmPassword=> '';
  @override
  String get Passwordneedstobeatleast8characters=> '';
  @override
  String get Register=> '';
  @override
  String get Almostdone=> '';
  @override
  String get Forgotpassword=> '';
  @override
  String get Verified=> '';
  @override
  String get Appsetting=> '';
  @override
  String get Cookies=> '';
  @override
  String get WeusecookiesimproveyourexperienceonAf24=> '';
  @override
  String get Customize=> '';
  @override
  String get Accept=> '';
  @override
  String get Chooseyourshippingcountry=> '';
  @override
  String get Turnonmylocation=> '';
  @override
  String get Next=> '';
  @override
  String get Notification=> '';
  @override
  String get NotificationCategorieA=> '';
  @override
  String get NotificationCategorieB=> '';
  @override
  String get SkipIwillsetuplater=> '';
  @override
  String get Newsletter=> '';
  @override
  String get Done=> '';
  @override
  String get Hot=> '';
  @override
  String get Boutiques=> '';
  @override
  String get Activities=> '';
  @override
  String get Favourites=> '';
  @override
  String get Setting=> '';
  @override
  String get Areyouinterestedinthisproduct=> '';
  @override
  String get Leaveacommenttotheseller=> '';
  @override
  String get Aboutseller=> '';
  @override
  String get Followthisseller=> '';
  @override
  String get Locatoin=> '';
  @override
  String get Shippingto=> '';
  @override
  String get Comment=> '';
  @override
  String get Availablelanguage=> '';
  @override
  String get Since=> '';
  @override
  String get Superseller=> '';
  @override
  String get follwers=> '';
  @override
  String get Activeonlist=> '';
  @override
  String get Sold=> '';
  @override
  String get Sellerreview=> '';
  @override
  String get addcomment=> '';
  @override
  String get AboutBoutique=> '';
  @override
  String get FollowthisBoutique=> '';
  @override
  String get boutiquereview=> '';
  @override
  String get Support=> '';
  @override
  String get Commentdetails=> '';
  @override
  String get Ordernow=> '';
  @override
  String get Cancel=> '';
  @override
  String get Ihaveanissuewithmyproduct=> '';
  @override
  String get Imageupload=> '';
  @override
  String get Orderdetails=> '';
  @override
  String get Shipping=> '';
  @override
  String get Arrived=> '';
  @override
  String get WaitforFeedback=> '';
  @override
  String get Commenthistory=> '';
  @override
  String get Reportmyissue=> '';
  @override
  String get DoyouhaveanyQuestion=> '';
  @override
  String get Ihaveaquestion=> '';
  @override
  String get Title=> '';
  @override
  String get Description=> '';
  @override
  String get Writingsomething=> '';
  @override
  String get Send=> '';
  @override
  String get Supportmessage=> '';
  @override
  String get Feedback=> '';
  @override
  String get AllgoodThanks=> '';
  @override
  String get Products=> '';
  @override
  String get Brands=> '';
  @override
  String get Sellers=> '';
  @override
  String get Boutigues=> '';
  @override
  String get Account=> '';
  @override
  String get Logout=> '';
  @override
  String get Personalinfo=> '';
  @override
  String get Passwordchange=> '';
  @override
  String get Shippinginformation=> '';
  @override
  String get Postcode=> '';
  @override
  String get City=> '';
  @override
  String get Country=> '';
  @override
  String get Billingaddressissameasshipping=> '';
  @override
  String get SignuporLogin=> '';
  @override
  String get Search=> '';
  @override
  String get Women=> '';
  @override
  String get Men=> '';
  @override
  String get Kids=> '';
  @override
  String get Lifestyle=> '';
  @override
  String get Seller=> '';
  @override
  String get Category=> '';
  @override
  String get Filter=> '';
  @override
  String get Reset=> '';
  @override
  String get Addtomyfilter=> '';

}

