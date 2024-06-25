import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en_US': {
          //Search Edit Business
          "Search Business's Service" : "Search Business's Service",
          //Edit Business Service
          'Sort of Business' : 'Sort of Business',
          'Search Services of Business' : 'Search Services of Business',
          'Search Favorite' : 'Search Favorite',
          '+ Public Service' : '+ Public Service',
          'Your identity is being verified by the authorities. Please login again later' : 'Your identity is being verified by the authorities. Please login again later',

          //Snack Bar
          'Turn on notification Success' : 'Turn on notification Success',
          'Turn on notification Not Success' : 'Turn on notification Not Success',
          'Turn off notification Success' : 'Turn off notification Success',
          'Turn off notification Not Success' : 'Turn off notification Not Success',
          'Successfully Ranked First Organization' : 'Successfully Ranked First Organization',
          'Successfully Canceled The Organization Ranking' : 'Successfully Canceled The Organization Ranking',
          //New UI



          'Please hold and drag to reorder the services displayed on the home page.' : 'Please hold and drag to reorder the services displayed on the home page.',
          'Manage Shortcut Services' : 'Manage Shortcut Services',
          'Shortcut services can be assigned up to 3 sequences. Subsequent sequences do not affect sorting.' : 'Shortcut services can be assigned up to 3 sequences. Subsequent sequences do not affect sorting.',

          'All Business Service' : 'All Business Service',
          'All service categories' : 'All service categories',
          'The searched service or organization was not found.' : 'The searched service or organization was not found.',
          'The searched organization was not found.' : 'The searched organization was not found.',
          'Please search again.' : 'Please search again.',
          'All Service' : 'All Service',
          //Home Page
          'Add Service' : 'Add Service',
          //Login Page
          'Connection Timed Out' : 'Connection Timed Out',
          'Please Reconnect.' : 'Please Reconnect.',
          'Login': 'Login',
          'Login With Email': 'Login With Email',
          'Login With PhoneNumber': 'Login With PhoneNumber',
          'Email': 'Email',
          'Enterprise\'s abbreviation': 'Enterprise\'s abbreviation',
          'Please enter your enterprise\'s abbreviation': 'Please enter your enterprise\'s abbreviation.',
          'If don\'t know, please contact your enterprise': '*If don\'t know, please contact your enterprise*',
          'English': 'English',
          'Sign in with': 'Sign in with',
          'Phone Number': 'Phone Number',
          'Or': 'Or',
          'Username or One Platform account':
              'Username or One Platform account',
          'Password': 'Password',
          'Sign In': 'Sign In',
          'wrong_username_or_password': 'Wrong username or password',
          'account_disable': 'Your account is disabled',
          'Register': 'Register',
          'Need help': 'Need help',
          'help': 'Help',
          'Forget Password ?': 'Forget Password ?',
          "What's the phone number for this device?":
              "What's the phone number for this device?",
          'Continue': 'Continue',
          'Continue ': 'Continue ',
          'Mobile Verification': 'Mobile Verification',
          'We have sent the 6-digit code to':
              'We have sent the 6-digit code to',
          'RefCode': 'RefCode',
          ' Resend OTP in': ' Resend OTP in',
          'Otp': 'Otp',
          'Edit Phone Number': 'Back',
          "Didn't recieve the OTP ?": "Didn't recieve the OTP ?",
          'Verify': 'Verify',
          'Contact Us': 'Contact Us',
          '''One Centric Co.,Ltd \n 1768 Thai Summit Tower 16th Floor\n New Petchaburi Road \n Bangkapi Huay Kwang \n Bangkok 10310 THAILAND\n Email: onechat@one.th''':
              '''One Centric Co.,Ltd \n 1768 Thai Summit Tower 16th Floor\n New Petchaburi Road \n Bangkapi Huay Kwang \n Bangkok 10310 THAILAND\n Email: onechat@one.th''',
          'Session Expired. Please log in again':
              'Session Expired. Please log in again',
          'Session Expired.': 'Session Expired.',
          'Please Log-in again to extend session.':
              'Please Log-in again to extend session.',
          'Update': 'Update',
          'Update Required': 'Update Required',
          'Please Update to the last version.':
              'Please Update to the last version.',
          "You'll receive SMS to verify your Identity for registration.":
              "You'll receive SMS to verify your Identity for registration.",
          'Already Have an account?': 'Already Have an account?',
          'No Account?': 'No Account?',
          'Login here': 'Login here',
          'Register here': 'Register here',
          'Username / Email': 'Username / Email',
          'Incorrect Username or Password.': 'Incorrect Username or Password.',
          'user_has_been_register': 'User has been register',
          'wrong_paramiter': 'Wrong parameter',
          'no_result_from_oneid': 'No result from oneid',
          'access_token_null': 'Access token is null',
          'get_account_fail': 'Get account fail',
          'wrong_type_otp': 'Wrong type OTP',
          'user_not_register':
              "The user's phone number has not been registered.",
          'Mobile number found, but not use for login.':
              'Mobile number found, but not used for login.',

          "This QR code is not working.":"This QR code is not working.",
          "Warning" : "Warning",
          "This Service Cannot Be Used.":"This Service Cannot Be Used.",
          "Thai ID Card" : "Thai ID Card",
          "ID card code is invalid." : "ID card code is invalid.",

          // Register Page
          'Register With Email': 'Register With Email',
          'Register With PhoneNumber': 'Register With PhoneNumber',
          'Mobile No': 'Mobile No',
          'Username': 'Username',
          'Confirm Password': 'Confirm Password',
          'Already have a One Platform account?':
              'Already have a One Platform account?',
          'Change Language to English': 'Change Language to Thai',
          'Please fill out the information completely.':
              'Please enter all the required information.',
          'Please fill information in Thai.':
              'Please fill information in Thai.',
          'Title name': 'Title name',
          'Select title name': 'Select title name',
          'Please Fill Data': 'Please Fill Data',
          'Passwords Do Not Match': 'Passwords Do Not Match',
          'Please fill your mobile number completely.':
              'Please fill your mobile number completely.',
          'Must have at least 6 characters and no special characters.':
              'Must have at least 6 characters and no special characters.',
          'Must contain at least one digit of English letters and numbers. using special characters.':
              'Must contain at least one digit of English letters and numbers. using special characters.',
          'Must have at least 8 characters.':
              'Must have at least 8 characters.',
          'Enter OTP': 'Enter OTP',
          'Enter 6 Digit OTP which sent to number':
              'Enter 6 Digit OTP which sent to number',
          'If not received, please press': 'If not received, please press',
          'sent OTP again': 'sent OTP again',
          'This username already exist.': 'This username already exist.',
          'use Lower or Upper Letter.': 'use Lower or Upper Letter.',
          'At least 8 letter.': 'At least 8 letter.',
          'At least 6 letter.': 'At least 6 letter.',
          'No special symbol.': 'No special symbol.',
          'Create Account complete.': 'Create Account complete.',
          'Get Started': 'Get Started',
          'Add Private Account': 'Add Private Account',
          'Information not found.': 'Information not found.',
          'too many requests': 'too many requests OTP',
          //AcceptService
          'Decline': 'Decline',
          'Accept': 'Accept',
          'Back To Main Page': 'Back To Main Page',
          'Back': 'Back',
          'Unable login with this QR code.' : 'Unable login with this QR code.',

          //Search Page
          'Search Results' : 'Search Results',
          'Search General' : 'Search General',
          'See more' : 'See more',
          'The searched service is not available.' : 'The searched service is not available.',
          //Add Service Page
          'Add General Service' : 'Add General Service',
          'Add Business Service' : 'Add Business Service',
          'Business is not active' :  'Business is not active',
          'Business Service' : 'Business Service',
          'Business' : 'Business',
          'Search Services of Favorite' : 'Search Services of Favorite',
          'Search your favorite services' : 'Search your favorite services',
          //Add Business Page
          '''An organizational account is the account that represents your organization's information. and have access to various services That is used only by the organization you are affiliated with.''' : "An organizational account is the account that represents your organization's information. and have access to various services That is used only by the organization you are affiliated with.",

          'Home': 'Home',
          'Services': 'Services',
          'Setting': 'Setting',
          'General': 'General',
          'Set Default App': 'Set Default App',
          'Type to search services': 'Type to search services',
          'Type to search Private Account': 'Type to search Private Account',
          'Choose Default App': 'Choose Default App',
          'Language': 'Language',
          'ENGLISH': 'ENGLISH',
          'THAI': 'THAI',
          'Dark Mode': 'Dark Mode',
          'On': 'On',
          'Off': 'Off',
          'System': 'System',
          'Base on your device setting': 'Base on your device setting',
          'Font Size': 'Font Size',
          'You want to change font size': 'You want to change font size',
          'You want to change theme': 'You want to change theme',
          'Application will close': 'Application will close',
          'Small': 'Small',
          'Medium': 'Medium',
          'Large': 'Large',
          'Send Feedback': 'Send Feedback',
          'Send': 'Send',
          'Feedback': 'Feedback',
          'Feedback type*': 'Feedback type*',
          'Add Image': 'Add Image',
          'Add Description': 'Add Description',
          'Account': 'Account',
          'Change Password': 'Change Password',
          'Delete Account': 'Delete Account',
          'Sign Out': 'Sign Out',
          'App Info': 'App Info',
          'Terms and Conditions of Use': 'Terms and Conditions of Use',
          'Open source licenses': 'Open source licenses',
          'Current version : ': 'Current version',
          'Profile': 'Profile',
          'Personal Profile': 'Personal Profile',
          'Open Camera': 'Open Camera',
          'Select from photos and videos': 'Select from photos and videos',
          'User name': 'Username',
          'Status': 'Status',
          'Company Name': 'Company Name',
          'Telephone number': 'Phone Number',
          'Job Position': 'Job Position',
          'You want to log out': 'You want to log out',
          'Confirm': 'Confirm',
          'Cancel': 'Cancel',
          'Save Success.': 'Save Success.',
          'Save': 'Save',
          'Send Success.': 'Send Success.',

          // FeedbackPage
          'Please choose your subject': 'Please choose your subject',
          'Feedback ': 'Feedback ',
          'Register ': 'Register ',
          'Sign in': 'Sign in',
          'Verify identity': 'Verify identity',
          'Setting Profile': 'Setting Profile',
          'RA Permission': 'RA Permission',
          'Public Services ': 'Public Services ',
          'Private Services ': 'Private Services ',
          'Services ': 'Services ',
          'Add Services ': 'Add Services ',
          'Other': 'Other',
          'Verify Identity Success' : 'Verify Identity Success',

          //Service Detail
          'Remove from Home': 'Remove from Home',
          'Open Service': 'Open Service',
          'Add to Home': 'Add to Home',
          //Private Services
          'Services Data Not Found.': 'Services Data Not Found.',
          //Pin
          'Set Pin': 'Set Pin',
          'Lock Pin': 'Lock Pin',
          'Unlock Pin': 'Unlock Pin',
          'Please Enter Pin': 'Please Enter Pin',
          'Please Confirm Pin': 'Please Confirm Pin',
          'Please enter the correct Pin': 'Please enter the correct Pin',
          'Save Pin Success': 'Save Pin Success',
          'Activate Touch ID or Face ID' : 'Activate Touch ID or Face ID',
          'Activate Service' : 'Activate Service',
          'Remember: If someone else saved their fingerprint or enrolled their face to this device, they will have access to your account' : 'Remember: If someone else saved their fingerprint or enrolled their face to this device, they will have access to your account',
          'Remember: The service is turned on and off only according to the settings on your device.' : 'Remember: The service is turned on and off only according to the settings on your device.',
          //Delete Account
          'Reason': 'Reason',
          'The user cannot access ths account permanently. After confirmation, the account cannot be recovered.':
              'The user cannot access ths account permanently. After confirmation, the account cannot be recovered.',

          //Notifiaction Page
          'Notification': 'Notification',
          'All': 'All',
          'Read': 'Read',
          'Not Read': 'Not Read',

          //Ekyc Page
          'Only Thai people': 'Only Thai people',
          'Only foreigner': 'Only foreigner',
          "You haven't verified your identity eKyc, request your identity verification eKyc." : "You haven't verified your identity eKyc, request your identity verification eKyc.",

          //Select Account Page
          'This number has multiple accounts opened.':
              'This number has multiple accounts opened.',
          'Please select the account for which you want to set up a login.':
              'Please select the account for which you want to set up a login.',

          //Business Page
          'AccountPage': 'AccountPage',
          'Add Personal Account': 'Add Personal Account',
          'A personal account is an account that displays information in your organization and can beaccess to services that only applies to the organization you belong to':
              'A private account is an account that displays information in your organization and can beaccess to services that only applies to the organization you belong to',
          'Juristic Person Registration Number':
              'Juristic Person Registration Number',
          'Fill in the corporate registration number/taxpayer identification number.':
              'Fill in the corporate registration number/taxpayer identification number.',
          'Use 13 digits': 'Use 13 digits',
          'Branch Code': 'Branch Code',
          'Specify Branch Code': 'Specify Branch Code',
          'Search': 'Search',
          'Check The Organization': 'Check The Organization',
          'Organization/Company Name': 'Organization/Company Name',
          '+ Business Service' : '+ Business Service',
          //QR code
          'QrcodeCreated': 'QrcodeCreated',
          'Scan QR Code': 'Scan QR Code',
          'QR Code': 'QR Code',
          'Create QR Code': 'Create QR Code',
          'Enter The Data': 'Enter The Data',
          'Register by QR Code': 'Register by QR Code',
          'Login by QR Code': 'Login by QR Code',
          'Login by Enterprise Account': 'Login by Enterprise Account',
          'Hi':'Hi,',
          'please enter your phone number.': 'please enter your phone number.',
          'Please enter the link': 'Please enter the link',

          //Fill Personal Data Page
          'Verify Organization Membership': 'Verify Organization Membership',
          'Verified Organization': 'Verified Organization',
          'Employee ID / Member Code': 'Employee ID / Member Code',
          'Fill in Employee ID / Member Code': 'Fill in Employee ID / Member Code',
          'Firstname': 'Firstname',
          'Fill in Firstname': 'Enter your firstname',
          'Lastname': 'Lastname',
          'Fill in Lastname': 'Enter your lastname',
          'ID Card Number': 'ID Card Number',
          'ID Card': 'ID Card',
          'Date of Birth': 'Date of Birth',
          'Day/Month/Year': 'Day/Month/Year',
          // 'Phone Number':'Telephone Number',
          // 'Email':'Email',
          'Address': 'Address',
          'Details': 'Details',
          'Fill in Details': 'Fill in Details',
          'Province': 'Province',
          // 'Select Province':'Select Province',
          'District': 'District',
          // 'Select District':'Select District',
          'Sub District': 'Sub District',
          // 'Select Sub District':'Select Sub District',
          'Zip Code': 'Zip Code',
          // 'Select Zip Code':'Select Zip Code',
          'Accept The Organization Terms And Privacy Policy':
              'Accept The Organization Terms of use',
          'Confirm Registration': 'Confirm Registration',
          'Role ID': 'Select role',
          'Check Role ID': 'Check Role',
          'You have been release from organization':
              'You have been release from organization',
          'Roleaccount already have this role.':
              'You are already in this position of the organization.',
          'Rolealready_sent_request': 'You are already in this organization.',
          'Terms and Conditions': 'Terms and Conditions',
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.":
              "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          // 'Accept':'Accept',
          'Not Accept': 'Not Accept',
          'You Have Added Organization Members':
              'You Have Added Organization Members',
          'Please Wait For Review': 'Please Wait For Review',
          'Back To Home Page': 'Back To Home Page',
          'If this information is incorrect Please contact your organization for assistance in accessing the service.' : 'If this information is incorrect Please contact your organization for assistance in accessing the service.',
          'Please enter user information. for the system to be used to authenticate access access to corporate accounts' : 'Please enter user information. for the system to be used to authenticate access access to corporate accounts',

          //Authenticator
          'Edit Successed.':'Edit Successed.',
          'Delete Successed.':'Delete Successed.',
          'Keep both':'Keep both',
          'Account already exists':'Account already exists',
          'Replace':'Replace',
          'Replace OTP Success':'Replace OTP Success',
          'You already have a Authenticator account called':'You already have a Authenticator account called',
          'account':'account',
          'Code Copied':'Code Copied',
          'Do you want to delete the data?': 'Do you want to delete the data?',
          'OK': 'OK',
          "Couldn't find any two-factor authentication information.":
              "Couldn't find any two-factor authentication information.",
          'Edit Authenticator': 'Edit Authenticator',
          'Authenticator': 'Authenticator',
          'Add Authenticator': 'Add Authenticator',
          'Specify a topic title': 'Specify a topic title',
          'Specify the title of the link': 'Specify the title of the link',
          'Add OTP Success': 'Add OTP Success',
          'Do you want to delete the data?': 'Do you want to delete the data?',
          'Scan your fingerprint (or face or whatever) to authenticate':
              'Scan your fingerprint (or face or whatever) to authenticate',
          'Authentication required' : 'Authentication required',
          'Verify identity' : 'Verify identity',

          //increase the credibility level
          'QR Code Authentication' : 'QR Code Authentication',
          'Identity Assurance Level' : 'Identity Assurance Level',

          //Business ID
          'Branch':'Branch',
          'Business Email' : 'Business Email',

          // Favorite Page
          'Would you like to save your favorite service ratings?' : 'Would you like to save your favorite service ratings?',
          'Do you want to leave editing favorites?' : 'Do you want to leave editing favorites?',
          'Edit Favorite Services':'Edit Favorite Services',
          'Edit Business Services':'Edit Business Services',
          'Unable to add favorite services' : 'Unable to add favorite services',
          '''You have reached the maximum number of favorite services, please delete the services you do not need before adding other services.''' : '''You have reached the maximum number of favorite services, please delete the services you don't need before adding other services.''',

          //Service Page
          'Favorite Services': 'Favorite Services',
          'Public Services': 'Public Services',
          'Private Services': 'Private Services',
          'My Profile': 'My Profile',
          'Public Account': 'Public Account',
          'Private Account': 'Private Account',
          'Waiting for approval': 'Waiting for approval',
          'Remove Default App': 'Remove Default App',
          'Favorite Service': 'Favorite Service',
          'Add Favorite': 'Add Favorite',
          'Delete Favorite' : 'Delete Favorite',
          'Unfavorite Service': 'Unfavorite Service',
          'Delete': 'Delete',
          'Turn off notifications': 'Turn off notifications',
          'Turn on notifications': 'Turn on notifications',
          'Add Services': 'Add Services',
          'Detail': 'Detail',
          'No Results': 'No Results',
          'This service is not available in this version.':
              'This service is not available in this version.',
          'About': 'About',
          'Conditions of Use': """
    OnePlatform Terms and Conditions of Use

    The terms and conditions of use shown here(hereinafter referred to as the"Terms and Conditions")set forth the terms between One Centric Company Limited (hereinafter referred to as the"Company")and users(hereinafter referred to as the"User"or"Users"depending upon context)of any services or features of OnePlatform (hereinafter referred to as the"Service"), which is provided by the Company.

    1. Definitions

    The following words and terms shall have the meanings set forth below when they are used in the Terms and Conditions.
    1.1. "content(s)" means information such as text, audio files, music, images, videos, software, programs, computer code, and the like.
    1.2. "Content(s)" means content(s)that may be accessed through the Service.
    1.3. "Submitted Content(s)" means content(s)that Users have submitted, transmitted, or uploaded.
    1.4. "Separate Terms and Conditions" means documents released or uploaded by the Company that pertain to the Service, under the title"agreement","guideline","policy" and the like.

    2. Agreement to Terms and Conditions

    2.1. All Users shall use the Service in accordance with the terms stated in the Terms and Conditions. Users may not use the Service unless they agree to the Terms and Conditions. Such agreement is valid and irrevocable.
    2.2. Minors may use the Service only with consent from their parents or legal guardian. Furthermore, if Users use the Service on behalf of, or for the purposes of a business enterprise, then that business enterprise shall also be deemed to have agreed to the Terms and Conditions. Such agreement is valid and irrevocable.
    2.3. By actually using the Service, Users are deemed to have agreed to the Terms and Conditions. Such agreement is valid and irrevocable.
    2.4. If there are Separate Terms and Conditions for the Service, Users also shall comply with such Separate Terms and Conditions as well as the Terms and Conditions.

    3. Modification of the Terms and Conditions

    The Company may modify the Terms and Conditions or Separate Terms and Conditions when the Company deems necessary, without providing prior notice to Users. The modification will become effective once the modified Terms and Conditions or Separate Terms and Conditions are posted on an appropriate location within the website operated by the Company. Users shall be deemed to have granted valid and irrevocable consent to the modified Terms and Conditions or Separate Terms and Conditions by continuing to use the Service. Users shall refer to the Terms and Conditions on a regular basis when using the Service, since a separate notification regarding the modification to Terms and Conditions may not be provided.

    4. Account

    4.1. Users, when providing information about him/herself to the Company, shall provide genuine, accurate, and complete information while using the Service, and keep such information up-to-date at all times.
    4.2. If Users register a password while using the Service, Users shall exercise due care and responsibility in order for the password not to be used in an unlawful manner. The Company may treat all activities conducted with the password as activities that have been conducted by the holder of the password him/herself.
    4.3. Any registered User to the Service may delete his/her account and withdraw from using the Service, at any time.
    4.4. The Company may suspend or delete a User's account without giving prior notice to the User if the Company believes that the User is violating or has violated the Terms and Conditions.
    4.5. The Company reserves the right to delete any account that has been inactive for a period of a year or more since its last activation, without any prior notice to the User.
    4.6. Users'rights to use the service shall expire when their account has been deleted for any reason. The account cannot be retrieved even if Users have accidentally deleted their account, and the Company asks Users to be aware of this.
    4.7. Each account in the Service is for the exclusive use and belongs solely to the owner of the account. Users may not transfer or lend their accounts to any third party nor may their accounts be inherited by any third party.

    5. Privacy

    5.1. The Company places its highest priority on the privacy of its Users.
    5.2. The Company promises to protect the privacy and personal information of its users in accordance with the OnePlatform Privacy Policy.
    5.3. The Company promises to exercise the utmost care and attention regarding its security measures for the continued security of any and all User information.

    6. Provision of the Service

    6.1. Users shall supply the necessary PC, mobile phone device, communication device, operating system, and data connection necessary for using the Service under Users'own responsibility and at Users'own expense.
    6.2. The Company reserves the right to limit access to the whole or part of the Service depending upon conditions that the Company considers necessary, such as age, identification, current membership status, and the like.
    6.3. The Company reserves the right to modify or cease, at the Company's own discretion, the whole or part of the Service at anytime without any prior notice to the Users.

    7. Incapability of Emergency Calls

    The Service cannot be depended upon for emergency calls, such as ones made to law enforcement agencies, maritime safety authorities, fire brigade, or other emergency services.

    8. Business Partners'Services

    Contents or other services offered by other business partners cooperating with the Company may be included within the Service. The business partners bear all responsibility regarding such contents and/or services offered. Furthermore, such contents and services may be governed by the explicit terms and conditions etc., which are set accordingly by the business partners.

    9. Contents

    9.1. The Company grants Users the non-transferable, non-re-licensable, non-exclusive license to use the Contents provided by the Company, only for the purpose of using the Service.
    9.2. Users shall abide by the appropriate conditions when using Contents which are subject to additional fees and periods of use. Notwithstanding situations where phrases such as"Purchase","Sales,"and the like appear on the Service screens, the Company shall remain the holder of all intellectual property rights as well as all other rights in the Contents offered to Users by the Company, and such rights shall not be transferred to Users.
    9.3. Users shall not use the Contents beyond the scope of the intended use of the Contents in the Service(including but not limited to copying, transmission, reproduction, modification).
    9.4. If Users wish to back-up the whole or part of the Submitted Contents, they will need to do so themselves. The Company will not undertake the obligation of backing up any of the Submitted Contents.
    9.5. The Service may include functions where multiple users may post, correct, edit, and delete items. In such cases, the User who posted his/her Submitted Contents has to allow other Users to perform any editing in relation to the Submitted Contents.
    9.6. Users shall maintain the rights regarding their Submitted Contents just as before, and the Company shall not acquire any rights to such contents. However, if the Submitted Contents are visible, not just to the User's"friends"but to all the other Users, the User who posts the Submitted Content shall grant the Company a worldwide, non-exclusive, royalty-free license(with the right to sublicense such content to other third parties working together with the Company), for an indefinite period, to use(after modifying such content, if the Company believes it necessary and proper)such content for services and/or promotional purposes.
    9.7. The Company may check the details of the Submitted Contents, when the Company believes that the Submitted Contents may violate related laws or provisions set out in the Terms and Conditions. However, the Company is not obligated to conduct such investigations.
    9.8. If the Company believes that the User has violated or may violate applicable laws or provisions in the Terms and Conditions related to Submitted Contents, then the Company reserves the right to preclude the User's use of the Submitted Contents in certain manners, such as deleting the Submitted Content without providing the User with prior notice.

    10. Restrictions

    Users shall not engage in the following when using the Service.
    10.1. Activities that violate the law, court verdicts, resolutions or orders, or administrative measures that are legally binding.
    10.2. Activities that may hinder public order or customs.
    10.3. Activities that infringe intellectual property rights, such as copyrights, trademarks and patents, fame, privacy, and all other rights of the Company and/or a third party granted by the law or contract.
    10.4. Activities that post or transmit violent or sexual expressions;expressions that lead to discrimination by race, national origin, creed, sex, social status, family origin, etc.;expressions that induce or encourage suicide, self-injury behavior, or drug abuse;or anti-social expressions that include anti-social content and lead to the discomfort of others.
    10.5. Activities that lead to the misrepresentation of the Company and/or a third party, or intentionally spread false information.
    10.6. Activities such as sending messages indiscriminately to numerous Users(except for those approved by the Company), indiscriminately adding Users as Friends or to Group Chats, or any other activities deemed to be spamming by the Company.
    10.7. Activities that exchange the right to use the Contents into cash, property or other economic benefits without Company's authorization.
    10.8. Activities that use the Service for sales, marketing, advertisement, soliciting or other commercial purposes(except for those approved by the Company);use the Service for the purpose of sexual conducts or obscene acts.use the Service for the purpose of meeting a person for sexual encounters.use the Service for the purpose of harassments or libelous attacks against other Users;or use the Service for purposes other than the Service's true intent.
    10.9. Activities that benefit or collaborate with anti-social groups.
    10.10. Activities that are related to religious activities or invitations to certain religious groups.
    10.11. Activities that illegally or improperly lead to the collection, disclosure, or provision of other's personal information, registered information, user history, or the like.
    10.12. Activities that interfere with the servers and/or network systems of the Service;that abuse the Service by means of BOTs, cheat tools, or other technical measures;that deliberately use defects of the Service;that make unreasonable inquires and/or undue claims such as repeatedly asking the same question beyond the necessity, and that interfere with the Company's operation of the Service or Users'use of the Service.
    10.13. Activities that aid or encourage any activity stated in Clauses 1 to 12 above.
    10.14. Other activities that are deemed by the Company to be inappropriate.

    11. User Responsibility

    11.1. Users shall use this Service at his/her own risk, and shall bear all responsibility for actions carried out and their results upon this Service.
    11.2. The Company may take measures that the Company considers necessary and appropriate, if the Company acknowledges that a User is using the service in a way which violates the Terms and Conditions. However, the Company shall not be responsible for correcting or preventing such violation towards Users or others.
    11.3. In the case where the Company has suffered loss/damage or has been charged an expense(including but not limited to lawyer's fees)directly or indirectly(including but not limited to cases where the Company has been sued for damages by a third party)due to the User violating applicable laws or the Terms and Conditions while using the Service, the User shall immediately compensate the Company upon its request.

    12. The Company's Exemption of Liability

    12.1. The Company does not expressly or impliedly guarantee that the Service(including the Contents)are free from de facto or legal flaws(including but not limited to stability, reliability, accuracy, integrity, effectiveness, fitness for certain purposes, security-related faults, errors, bugs, or infringements of rights). The Company shall not be responsible for providing the Service without such defects.
    12.2. The Company shall not be responsible for any damages inflicted upon Users in relation to the use of the Service. However, if the agreement(including but not limited to the Terms and Conditions)between the Company and Users regarding the Service shall be deemed as a consumer contract under the Consumer Contract Law in Japan, then this exemption clause shall not be applied.
    12.3. Notwithstanding the condition stated in clause 12.2 above, the Company shall not be responsible for any indirect, special, incidental, consequential or punitive damages(including but not limited to such damages that the Company or Users predicted or could have predicted)with respect to the Company's contractual default or act of tort due to the Company's negligence(except for gross negligence). The compensation for ordinary damages in respect to the Company's contractual default or act of tort due to the Company's negligence(except for gross negligence)shall be limited to the total amount of received fees from the User in the particular calendar month in which such damages occurred.

    13. Notification and Contact

    13.1. When the Company notifies or contacts Users regarding the Service, the Company may use a method that the Company considers appropriate, such as posting on the website operated by the Company.
    13.2. When Users notifies or contacts the Company in regard to the Service, Users shall use the customer inquiry form available on the website operated by the company or other means designated by the Company.


    End

    Last updated on August 15, 2022

""",
          'BusinessUsTerms': """
          ข้อกำหนดการใช้บริการ ONE ID

            วัตถุประสงค์ของข้อกำหนดการใช้งานบัญชีระบบยืนยันตัวตนกลาง (ONE ID Account Terms of Use) (ต่อไปนี้เรียกว่า “ข้อกำหนด”) มีไว้เพื่อวางข้อกำหนดและเงื่อนไข สำหรับการใช้บริการทั้งหมดที่เกี่ยวกับบัญชีระบบยืนยันตัวตนกลาง (ONE ID Account) (ต่อไปนี้เรียกว่า “บัญชีกลาง”)  ซึ่งให้บริการโดยไทย ไอเด็นติตี้ส์ (THAI IDENTITIES) และบริษัทในเครือ (ต่อไปนี้เรียกรวมกันว่า “บริษัท”) 

            ลูกค้าจะต้องใช้บัญชีกลางโดยเป็นไปตามข้อกำหนดนี้ และข้อกำหนดและระเบียบการ (Terms and Conditions) นอกจากนี้ ลูกค้าจะต้องรับผิดชอบในการปฏิบัติตามกฎหมายและข้อบังคับทั้งหมดที่เกี่ยวข้องเมื่อใช้งานบัญชีกลาง

ข้อ 1  การสมัครใช้งาน การยืนยันตัวตน การปฏิเสธการยืนยันตัวตน  และการยกเลิกการยืนยันตัวตน  

            1.1 ไม่ว่าลูกค้าจะเป็นบุคคลธรรมดาหรือนิติบุคคล ลูกค้าจะได้รับบัญชี (ต่อไปนี้เรียกว่า “บัญชีกลาง”) เพื่อใช้งานบัญชีกลาง โดยการสมัครขอใช้งานบัญชีกลางผ่านทางวิธีการที่บริษัทกำหนด

            1.2 เมื่อลูกค้าได้สมัครใช้งานบัญชีกลางผ่านทางวิธีการที่บริษัทกำหนดและได้รับการอนุมัติจากบริษัทแล้ว บริษัทอาจจะดำเนินการยืนยันบัญชีกลางของลูกค้าดังกล่าว (ต่อไปนี้จะเรียกบัญชีซึ่งได้รับการยืนยันจากบริษัทว่า “บัญชีกลางที่ได้รับการยืนยันแล้ว”) 

            1.3 ในกรณีที่บริษัทเห็นว่ามีข้อใดข้อหนึ่งดังต่อไปนี้เกิดขึ้นกับลูกค้า บริษัทสามารถปฏิเสธคำขอของลูกค้าดังกล่าวสำหรับบัญชีกลางที่ได้รับการยืนยันแล้ว หรือยกเลิกการยืนยันตัวตนของบัญชีกลางที่ได้รับการยืนยันแล้วของลูกค้าดังกล่าวก็ได้

                        (1) ในกรณีที่ลูกค้าให้ข้อมูลเท็จแก่บริษัท

                        (2) ในกรณีที่ไม่เป็นไปตามมาตรฐานของการตรวจสอบ (ซึ่งบริษัทไม่มีหน้าที่ต้องเปิดเผยมาตรฐานดังกล่าว) ที่บริษัทกำหนดขึ้น

                        (3) นอกจากนี้ ในกรณีที่บริษัทเห็นว่าเป็นเรื่องไม่เหมาะสมที่ลูกค้าจะใช้งานบัญชีกลาง

ข้อ 2  การปรับปรุงข้อกำหนด

            บริษัทสามารถปรับปรุงข้อกำหนดนี้และลักษณะของการบริการ และอื่น ๆ ที่ให้บริการโดยบัญชีกลางได้โดยแจ้งให้ลูกค้าทราบถึงการปรับปรุงดังกล่าวโดยการประกาศหรือการบอกกล่าวตามที่บริษัทเห็นว่าจำเป็นโดยดุลพินิจฝ่ายเดียวของบริษัทหรือตามที่กฎหมายที่เกี่ยวข้องกำหนด ในกรณีที่ลูกค้ายังคงใช้งานบัญชีกล่งต่อไปหลังจากการปรับปรุง ให้ถือว่าลูกค้าดังกล่าวได้ให้ความยินยอมในการปรับปรุงข้อกำหนดนี้และลักษณะการบริการ และอื่น ๆ แล้ว

ข้อ 3  ระยะเวลาการใช้งาน

            3.1ระยะเวลาใช้งานสำหรับบัญชีกลาง จะเริ่มต้นตั้งแต่วันที่ลูกค้ามีคำขอใช้งานบัญชีดังกล่าวจนถึงวันที่บัญชีนั้นถูกลบอย่างเสร็จสมบูรณ์

ข้อ 4  ค่าบริการ

            4.1 บริษัทจะกำหนดลักษณะ ค่าบริการ และวันที่ถึงกำหนดชำระค่าบริการสำหรับแผนการบริการที่ต้องชำระค่าบริการ และอื่น ๆ และจะประกาศหรือบอกกล่าวลูกค้าเกี่ยวกับเรื่องดังกล่าว โปรดตรวจสอบเรื่องดังกล่าวข้างต้นในเวลาที่สมัครใช้งานแผนการบริการที่ต้องชำระค่าบริการ

            4.2 บริษัทสามารถเปลี่ยนแปลงหรือเพิ่มเติม แผนการบริการที่ต้องชำระค่าบริการโดยแจ้งให้ลูกค้าทราบโดยการประกาศหรือบอกกล่าวเกี่ยวกับเรื่องดังกล่าว

            4.3 เมื่อลูกค้าประสงค์จะเปลี่ยนแปลงแผนการบริการจากแบบไม่มีค่าบริการเป็นแผนการบริการที่ต้องชำระค่าบริการ ลูกค้าดังกล่าวจะต้องมีคำขอเปลี่ยนแปลงดังกล่าวผ่านทางวิธีการที่บริษัทกำหนดขึ้น และลูกค้า จะสามารถทำการเปลี่ยนแปลงดังกล่าวได้ในวันที่บริษัทได้รับคำขอเช่นว่านั้นแล้ว นอกจากนี้ เมื่อลูกค้าประสงค์จะเปลี่ยนแปลงจากแผนการบริการที่ต้องชำระค่าบริการแผนหนึ่งเป็นอีกแผนหนึ่ง หรือเป็นแบบไม่มีค่าบริการ ลูกค้าจะสามารถทำการเปลี่ยนแปลงดังกล่าวได้ในเดือนถัดจากวันที่บริษัทได้รับคำขอเปลี่ยนแปลงเช่นว่านั้น

            4.4 แม้ว่าลูกค้าจะได้ทำการยกเลิกบัญชีทางการสำหรับแผนการบริการที่ต้องชำระค่าบริการภายในเดือนใดแล้วก็ตาม ลูกค้าดังกล่าวยังจะต้องชำระค่าบริการรายเดือนสำหรับเดือนดังกล่าวเต็มจำนวนและค่าบริการดังกล่าวจะไม่ถูกคำนวณเป็นรายวัน นอกจากนี้ แม้ว่าบัญชีทางการจะถูกยกเลิกแล้ว บริษัทจะไม่คืนค่าบริการที่ลูกค้าได้ชำระไว้ล่วงหน้าให้แก่ลูกค้า

            4.5 ในเวลาที่ชำระค่าบริการให้แก่บริษัท หากค่าบริการดังกล่าวจะต้องเสียภาษีการบริโภคตามบทบัญญัติของพระราชบัญญัติภาษีธุรกิจว่าด้วยภาษีมูลค่าเพิ่มและที่ไม่ใช่ภาษีมูลค่าเพิ่ม (Value-added and Non-value-added Business Tax Act) รวมถึงกฎหมาย และ/หรือ ข้อบังคับที่เกี่ยวข้องกับพระราชบัญญัติดังกล่าว หรือกฎหมายหรือข้อบังคับใด ๆ ที่เกี่ยวข้อง ลูกค้าจะต้องชำระค่าบริการนั้นพร้อมด้วยจำนวนเงินซึ่งเท่ากับภาษีที่เกี่ยวข้อง

ข้อ 5  บัญชีกลาง

          5.1 ลูกค้าจะต้องจัดการรหัสผ่านสำหรับบัญชีกลางด้วยความรับผิดชอบของตนเองอย่างเคร่งครัดเพื่อมิให้ถูกนำไปใช้โดยไม่ได้รับอนุญาต ทั้งนี้ บริษัทจะถือว่าการกระทำใด ๆ และทั้งหลายที่ได้กระทำขึ้นผ่านทางรหัสผ่านที่ได้ลงทะเบียนไว้นั้นเป็นการกระทำของลูกค้า

          5.2 บริษัทไม่ต้องรับผิดชอบสำหรับความเสียหายหรือการเสียประโยชน์ที่เกิดขึ้นกับลูกค้าจากการกระทำที่ได้กระทำผ่านบัญชีกลางไม่ว่าด้วยเหตุใดก็ตาม

          5.3 หากลูกค้ามีความประสงค์ บริษัทอาจให้ความช่วยเหลือลูกค้าในการดำเนินการเกี่ยวกับบัญชีกลางในขอบเขตที่สมเหตุสมผลได้ในบางกรณี ในกรณีดังกล่าว บริษัทสามารถเข้าถึงและดำเนินการเกี่ยวกับบัญชีกลางในขอบเขตที่จำเป็นสำหรับการให้ความช่วยเหลือก็ได้ นอกจากนี้ บริษัทจะไม่รับผิดชอบใด ๆ สำหรับความเสียหายที่เกิดขึ้นแก่ลูกค้าหรือผู้ใช้งานบัญชีกลาง (ต่อไปนี้เรียกว่า “ผู้ใช้งาน”) ซึ่งเกิดขึ้นจากการดำเนินการดังกล่าวข้างต้น

          5.4 ในกรณีที่สัญญาที่เกี่ยวกับการใช้งานบัญชีกลางถูกยกเลิกหรือเสร็จสมบูรณ์ หรือการให้การบริการบัญชีกลางเสร็จสมบูรณ์ บริษัทสามารถลบข้อมูลเกี่ยวกับบัญชีกลางที่เกี่ยวข้องและเนื้อหาที่มีการเผยแพร่ผ่านทางบัญชีกลาง (หมายถึง ข้อมูลหรือเนื้อหาในรูปแบบที่ลูกค้าอนุญาตให้มีการส่งผ่านหรือเข้าถึงได้โดยผู้ใช้งานผ่านการใช้งานบัญชีกลาง รวมถึงแต่ไม่จำกัดเพียง ไอคอน ข้อมูลในโปรไฟล์ ข้อความ รูปภาพและภาพเคลื่อนไหวซึ่งส่งโดยลูกค้า ต่อไปนี้จะเรียกรวมกันว่า “เนื้อหา”) โดยดุลพินิจของบริษัท และลูกค้าจะต้องให้ความยินยอมเพื่อการดำเนินการดังกล่าวด้วย

ข้อ 6  หน้าที่ในการรายงานข้อมูล

          ในกรณีที่ลูกค้าเปลี่ยนแปลงชื่อ นามสกุล ที่อยู่อีเมล์ ภูมิลำเนา เบอร์โทรศัพท์ หรือข้อมูลทางการติดต่อสื่อสารอื่น ๆ ซึ่งได้ลงทะเบียนไว้กับบัญชีกลาง ลูกค้าดังกล่าวจะต้องรายงานการเปลี่ยนแปลงเช่นว่านั้นผ่านทางวิธีการที่บริษัทกำหนดไว้โดยทันที และในกรณีที่ได้มีการรายงานข้อมูลดังกล่าวแล้ว บริษัทอาจร้องขอให้ลูกค้าดังกล่าวนำส่งหลักฐานของการเปลี่ยนแปลงดังกล่าวและลูกค้าจะต้องปฏิบัติตามคำร้องขอเช่นว่านั้นด้วย

ข้อ 7  ความรับผิดชอบของลูกค้า

          7.1 ในกรณีที่บุคคลที่สามได้มีการร้องเรียนหรือเรียกร้อง หรือยื่นฟ้องคดี และอื่น ๆ ต่อบริษัทเนื่องจากการใช้งานบัญชีกลางโดยลูกค้า ลูกค้าจะต้องตอบสนองต่อเรื่องดังกล่าวด้วยค่าใช้จ่ายของตนเองและต้องรับผิดชอบแต่เพียงฝ่ายเดียว และลูกค้าจะต้องไม่สร้างความยุ่งยากให้แก่บริษัทเกี่ยวกับเรื่องดังกล่าว ทั้งนี้ ลูกค้าจะต้องรับผิดชอบต่อความรับผิดทางกฎหมายใด ๆ ที่เกิดขึ้นจากการใช้งานบัญชีทางการโดยลูกค้า ซึ่งผู้บริหารจัดการ (administrators) และบุคลากรผู้ดำเนินการบัญชีกลางจะต้องรับผิดร่วมกันและแทนกันในเรื่องดังกล่าวด้วย ทั้งนี้ ลูกค้าตกลงว่าบริษัทจะไม่ต้องรับผิดชอบ ในความเสียหายหรือความรับผิดใด ๆ ที่เกิดขึ้นแก่บุคคลที่สามใด ๆ ซึ่งเกิดจากการใช้งานบัญชีกลาง

          7.2 หากลูกค้าละเมิดสิทธิใด ๆ หรือก่อให้เกิดความเสียหายใด ๆ แก่บุคคลที่สามโดยการฝ่าฝืนกฎหมายที่เกี่ยวข้องหรือละเมิดข้อกำหนดนี้ นอกเหนือจากข้อ 10.1 ดังกล่าวข้างต้นแล้ว บริษัทสามารถ (1) จำกัดหรือห้ามผู้บริหารจัดการหรือบุคลากรผู้ดำเนินการบัญชีกลางดังกล่าว มิให้ดำเนินการบัญชีทางการอื่นใดที่มีอยู่อีกต่อไป และ (2) ปฏิเสธการขอใช้บริการบัญชีกลางโดยผู้บริหารจัดการหรือบุคลากรผู้ดำเนินการบัญชีกลางที่จะมีขึ้นใหม่ในอนาคตโดยไม่ต้องบอกกล่าวล่วงหน้าหรือชี้แจงเหตุผล

          7.3 ลูกค้าต้องชดใช้ความเสียหายใด ๆ (รวมถึง ค่าทนายความที่เกิดขึ้น) ต่อบริษัทซึ่งเกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าโดยทันที

ข้อ 8  การปฏิบัติต่อข้อมูลซึ่งระบุตัวตนของลูกค้า

          8.1 บริษัทต้องใช้ข้อมูลซึ่งระบุตัวตนของลูกค้าซึ่งลูกค้าดังกล่าวได้ให้ไว้แก่บริษัทภายในขอบเขตซึ่งสอดคล้องกับคำอธิบายที่ระบุไว้ในนโยบายความเป็นส่วนตัวของวันไอดี (One ID Privacy Policy) และการประมวลผลของบัญชีกลาง

          8.2 เว้นแต่จะมีกฎหมาย ข้อบังคับ และ/หรือ นโยบายความเป็นส่วนตัวของวันไอดี (One ID Privacy Policy) และเว้นแต่จะได้มีการขอรับความยินยอมของลูกค้าที่เกี่ยวข้องเป็นรายคนแยกจากกัน บริษัทต้องไม่ให้ข้อมูลซึ่งระบุตัวตนของลูกค้าแก่บุคคลที่สามโดยไม่ได้รับความยินยอมจากลูกค้าดังกล่าว

          8.3 ลูกค้าสามารถร้องขอให้บริษัทเปิดเผย แก้ไข เพิ่มเติม และ/หรือ ลบข้อมูลซึ่งระบุตัวตนซึ่งบริษัทได้รวบรวมไว้จากลูกค้า โดยที่อย่างไรก็ตาม การเปิดเผย การแก้ไข การเพิ่มเติม และ/หรือ การลบข้อมูลนั้นจะต้องเป็นไปตามขั้นตอนที่กำหนดขึ้นต่างหากโดยบริษัท และอาจจะมีค่าใช้จ่ายแยกต่างหากในบางกรณีด้วย ทั้งนี้ โปรดติดต่อ ณ ที่อยู่ของบริษัทดังต่อไปนี้สำหรับคำถามเกี่ยวกับการการเปิดเผย การแก้ไข การเพิ่มเติมและ/หรือการลบหรือการร้องเรียนต่าง ๆ (02-257-7198)

          8.4 ลูกค้าตกลงล่วงหน้าว่าข้อมูลทั้งหมดซึ่งได้ลงทะเบียนไว้โดยลูกค้าเกี่ยวกับการบริการภายใต้ข้อบังคับนี้จะถูกลบเมื่อมีการเลิกสัญญา

          8.5 ลูกค้าตกลงว่า บริษัทสามารถได้รับข้อมูลเชิงสถิติเกี่ยวกับการใช้การบริการของลูกค้า (รวมถึงแต่ไม่จำกัดเพียง ข้อมูลเชิงสถิติ เช่น จำนวนผู้ใช้เฉพาะและจำนวนข้อความ) เพื่อวัตถุประสงค์ในการดำเนินการและปรับปรุงบัญชีและการบริการ

ข้อ 9  การโอนและพันธมิตรทางธุรกิจ

          9.1 บริษัทสามารถโอนการให้การบริการบัญชีกลางบางส่วนให้แก่บริษัทในกลุ่มของบริษัทหรือแก่บุคคลที่สามก็ได้

          9.2 บริษัทสามารถให้ข้อมูลเกี่ยวกับบัญชีกลางแก่คู่ค้าทางธุรกิจและบุคคลที่สามอื่น ๆ (อย่างไรก็ตาม ไม่รวมถึงข้อมูลส่วนบุคคล) เกี่ยวกับลูกค้าเพื่อจัดให้ซึ่งการทำงานของบัญชีกลางแก่คู่ค้าทางธุรกิจและเว็บไซต์ แอพพลิเคชั่น และอื่น ๆ เป็นต้น ของบุคคลที่สามอื่น ๆ ในการนี้ การเชื่อมโยงของลูกค้ากับบัญชีทางการ และอื่น ๆ อาจถูกแสดงอยู่บนเว็บไซต์ของคู่ค้าทางธุรกิจหรือบุคคลที่สามอื่น ๆ ก็ได้ ยิ่งไปกว่านั้น บริษัทสามารถแสดงตัวชี้แหล่งในอินเทอร์เน็ตของเว็บไซต์ (URL) ซึ่งรวมถึงข้อมูลของลูกค้าไว้ที่หุ้นส่วนทางธุรกิจ เผยแพร่การเชื่อมต่อสู่เว็บไซต์ดังกล่าว เป็นต้น ในหน้าบัญชีกลางของลูกค้านั้นด้วย

ข้อ 10  การระงับ การเปลี่ยนแปลง และการเสร็จสมบูรณ์ของการบริการ

            10.1 ในกรณีของข้อใดข้อหนึ่งดังต่อไปนี้ บริษัทสามารถระงับการให้การบริการบัญชีกลางได้ในบางกรณี ถึงแม้ว่าบริษัทจะได้ระงับบัญชีทางการเป็นการชั่วคราว บริษัทจะไม่รับผิดชอบใด ๆ สำหรับการระงับดังกล่าวต่อลูกค้า

                         (1) ในกรณีของการบำรุงรักษา ตรวจสอบ หรือเรื่องอื่นในทำนองเดียวกัน เกี่ยวกับสิ่งอำนวยความหรืออุปกรณ์ที่จำเป็นสำหรับการให้การบริการบัญชีทางการ ซึ่งได้มีขึ้นตามปกติหรือในกรณีฉุกเฉิน

                         (2) ในกรณีที่มีความล้มเหลว การหยุดทำงาน หรือเรื่องอื่นในทำนองเดียวกัน เกิดขึ้นกับสิ่งอำนวยความสะดวกหรืออุปกรณ์ที่ใช้ในการให้การบริการบัญชีทางการ

                        (3) ในกรณีที่เป็นไปไม่ได้ที่จะใช้งานการบริการโทรคมนาคมซึ่งดำเนินการโดยผู้ประกอบธุรกิจโทรคมนาคม

                        (4) ในกรณีที่มีความยุ่งยากในการให้การบริการบัญชีทางการเนื่องจากไฟดับ ไฟไหม้ แผ่นดินไหวการประท้วงของแรงงาน หรือเหตุสุดวิสัยในรูปแบบอื่น

                        (5) ในกรณีที่มีสาเหตุเกี่ยวกับการดำเนินการหรือสาเหตุทางเทคนิคที่เกี่ยวข้องกับบัญชีทางการอย่างสมเหตุสมผล

            10.2 บริษัทสามารถเปลี่ยนแปลงหรือสิ้นสุดการดำเนินการบัญชีกลางทั้งหมดหรือบางส่วนได้โดยการประกาศหรือแจ้งให้ลูกค้าทราบในเรื่องดังกล่าว แม้ว่าบริษัทจะได้เปลี่ยนแปลงหรือสิ้นสุดการดำเนินการบัญชีกลางแล้วไม่ว่าทั้งหมดหรือบางส่วน บริษัทจะไม่รับผิดชอบใด ๆ ในเรื่องดังกล่าวต่อลูกค้าทั้งสิ้น

ข้อ 11   ความเสียหาย

            11.1 ในกรณีที่ลูกค้าได้ละเมิดข้อกำหนดนี้และก่อให้เกิดความเสียหายแก่บริษัท (รวมถึงแต่ไม่จำกัดเพียง ค่าทนายความที่สมเหตุสมผล) ลูกค้าจะต้องรับผิดชดใช้ความเสียหายนั้นให้แก่บริษัทโดยทันที

            11.2 ในกรณีที่ลูกค้าได้รับการการร้องเรียน การอ้างสิทธิ การร้องขอ การเรียกร้อง การคัดค้าน และอื่น ๆ เป็นต้น (ต่อไปนี้จะเรียกว่า “การร้องเรียน และอื่น ๆ”) จากบุคคลที่สาม เกี่ยวกับบัญชีกลาง โดยอ้างว่าสิทธิของบุคคลที่สามนั้นถูกละเมิด ลูกค้าดังกล่าวจะต้องดำเนินการและแก้ไขการร้องเรียน และอื่น ๆ นั้นด้วยค่าใช้จ่ายและความรับผิดชอบของตน ทั้งนี้ ลูกค้าต้องรับผิดชอบในความรับผิดทางกฎหมายใด ๆ ที่เกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าด้วยตนเอง และลูกค้าตกลงว่าบริษัทจะไม่ต้องรับผิดสำหรับความเสียหายและการรับผิดใด ๆ ซึ่งเกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าไม่ว่าในกรณีใดก็ตาม ซึ่งในกรณีที่มีความเสียหายเกิดขึ้นต่อบริษัทที่เกี่ยวข้องกับการร้องเรียน และอื่น ๆ ลูกค้าจะต้องชดใช้ความเสียหายดังกล่าวทั้งหมดให้แก่บริษัท นอกจากนี้ ในกรณีที่บริษัทดำเนินการหรือแก้ไขการร้องเรียน และอื่น ๆ ดังกล่าวในนามของลูกค้าที่เกี่ยวข้อง ลูกค้าที่เกี่ยวข้องต้องรับผิดชอบค่าใช้จ่ายทั้งหมดสำหรับการดำเนินการและการแก้ไขนั้นด้วย

            11.3 บริษัทจะไม่รับผิดชอบต่อความเสียหายใด ๆ ที่เกิดขึ้นแก่ลูกค้าจากการใช้งานบัญชีกลางโดยลูกค้า โดยที่กรณีดังกล่าวจะไม่บังคับใช้กับความเสียหายซึ่งเกิดขึ้นเนื่องจากการจงใจก่อให้เกิดความเสียหายหรือความประมาทเลินเล่ออย่างร้ายแรงโดยบริษัท ในกรณีดังกล่าว บริษัทจะรับผิดชอบในการชดใช้ความเสียหายทั่วไปและความเสียหายโดยตรงที่บริษัทก่อให้เกิดแก่ลูกค้า เป็นจำนวนสูงสุดไม่เกินค่าบริการสำหรับบัญชีทางการที่ได้ชำระแล้วโดยลูกค้านั้นในเดือนที่ความเสียหายนั้นได้มีขึ้น

ข้อ 12  การระงับการใช้และการบอกเลิก

            12.1 ในกรณีที่บริษัทเห็นว่าข้อใดข้อหนึ่งดังต่อไปนี้เกิดขึ้นกับลูกค้าหรืออาจจะเกิดขึ้นกับลูกค้า บริษัทสามารถระงับบัญชีกลาง โดยการระงับการใช้งานบัญชีกลางโดยลูกค้าเป็นการชั่วคราว หรือบอกเลิกสัญญาต่าง ๆ (ต่อไปนี้จะเรียกว่า “สัญญา”) กับลูกค้าภายใต้ข้อกำหนดนี้ โดยไม่จำเป็นต้องแจ้งให้ทราบแต่อย่างใด และหากมีความเสียหายเกิดขึ้นแก่ลูกค้าจากการระงับการใช้งานหรือการบอกเลิกสัญญาดังกล่าว บริษัทจะไม่รับผิดชอบใด ๆ ในเรื่องดังกล่าวแก่ลูกค้านั้น

                        (1)  ในกรณีที่บริษัทได้ทราบถึงการมีอยู่ของเหตุในการปฏิเสธคำขอตามที่ระบุไว้ในข้อ 1.3 หลังจากการเริ่มต้นการใช้งานบัญชีกลาง (ไม่ว่าบัญชีที่เกี่ยวข้องนั้นจะเป็นบัญชีที่ได้รับการยืนยันแล้วหรือไม่ก็ตาม)

                        (2)  ในกรณีที่ลูกค้าได้ใช้บัญชีทางการสำหรับวัตถุประสงค์ที่ไม่ชอบด้วยกฎหมาย

                        (3)  ในกรณีที่บริษัทเชื่อว่ามีการขาดความน่าเชื่อถือของลูกค้า

                        (5)  ในกรณีที่ไม่สามารถติดต่อลูกค้าได้ด้วยสาเหตุที่ไม่ใช่ความผิดของบริษัท

                        (6)  ในกรณีที่ลูกค้าไม่เข้าสู่บัญชีของตนภายในระยะเวลาหนึ่งที่กำหนดขึ้นโดยบริษัท

                        (7)  นอกเหนือจากกรณีที่ได้ระบุไว้ข้างต้น ในกรณีที่ลูกค้าได้ดำเนินการที่บริษัทเห็นว่าไม่เหมาะสม

ข้อ 13 การรักษาข้อมูลความลับ

ลูกค้าตกลงที่จะดูแลรักษาข้อมูลความลับของคู่สัญญาอีกฝ่ายเพื่อให้เป็นความลับต่อไป จะไม่เปิดเผยข้อมูลความลับหรือยินยอมให้บุคคลอื่นรับทราบ หรือใช้ข้อมูลความลับ โดยจะใช้มาตรฐานการดูแลข้อมูลความลับนั้นเสมือนกับการดูแลรักษาข้อมูลความลับที่สุดของตนเองเป็นอย่างน้อย เว้นแต่ จะได้รับความยินยอมเป็นลายลักษณ์อักษรจากบริษัท

This application will be able to:
(บริการนี้ต้องการข้อมูล)

Account Description ( ข้อมูลส่วนตัว )
Title Name ( คำนำหน้าชื่อ )
First Name ( ชื่อจริง )
Last Name ( นามสกุล )
ID Card ( เลขบัตรประชาชน )
Date of Birth ( วันเกิด )
Email ( อีเมล )
Telephone Number ( เบอร์โทร )
Profile Picture ( รูปโปรไฟล์ )
""",
          //Chat Page
        },
        //THAI LANGUAGE
        'th_TH': {
          //Search Edit Business
          "Search Business's Service" : 'ค้นหาบริการองค์กร',
          //Edit Business Service
          'Sort of Business' : 'ลำดับการแสดงองค์กร',
          //New Ui
          '+ Public Service' : '+ เพิ่มบริการทั่วไป',
          'Your identity is being verified by the authorities. Please login again later' : 'Your identity is being verified by the authorities. Please login again later',
          'Please hold and drag to reorder the services displayed on the home page.' : 'โปรดกดค้าง และลากเพื่อจัดลำดับบริการที่แสดงในหน้าแรก',
          'Manage Shortcut Services' : 'จัดการบริการทางลัด',
          'Shortcut services can be assigned up to 3 sequences. Subsequent sequences do not affect sorting.' : 'บริการทางลัดสามารถกำหนดได้มากสุด3ลำดับ ลำดับถัดไปจะไม่มีผลต่อการจัดเรียง',

          'All Business Service' : 'บริการองค์กรทั้งหมด',
          'Add Service' : 'เพิ่มบริการ',
          'Add Business Account' : 'เพิ่มบัญชีองค์กร',
          'Favorite Services' : 'บริการที่ชื่นชอบ',
          'Edit' : 'แก้ไข',
          'Category Services' : 'หมวดบริการ',
          'View all' : 'ดูทั้งหมด',
          'General Services' : 'บริการทั่วไป',
          'Business Services' : 'บริการองค์กร',
          'General Service' : 'บริการทั่วไป',
          'Can not to add favorite services.' : 'ไม่สามารถเพิ่มบริการที่ชื่นชอบได้',
          'You have add the maximum 8 favorite services, Please unfavorite the services you do not need before adding other services.' : 'บริการที่ชื่นชอบครบจำนวนสูงสุดแล้วโปรดลบบริการที่ท่านไม่ต้องการออกก่อนเพิ่มบริการอื่นๆ',
          'Add to Shortcut Service' : 'เพิ่มในบริการทางลัด',
          'Do not have a favorite service yet.' : 'ยังไม่มีบริการที่ชื่นชอบ',
          'User Information' : 'ข้อมูลผู้ใช้งาน',
          'All Service Categories' : 'หมวดบริการทั้งหมด',
          'The searched service or organization was not found.' : 'ไม่พบบริการหรือองค์กรที่ค้นหา',
          'The searched organization was not found.' : 'ไม่พบบริการองค์กรที่ค้นหา',
          'Please search again.' : 'กรุณาค้นหาใหม่อีกครั้ง',
          'All Service' : 'บริการทั้งหมด',
          'Search General' : 'ค้นหาบริการทั่วไป',
          'Search Favorite' : 'ค้นหาบริการที่ชื่นชอบ',
          'See more' : 'ดูเพิ่มเติม',
          'The searched service is not available.' : 'ไม่มีบริการที่ค้นหา',

          "An organizational account is the account that represents your organization's information. and have access to various services That is used only by the organization you are affiliated with." : 'บัญชีองค์กรเป็นบัญชีที่จะแสดงข้อมูลในองค์กรของคุณ และสามารถเข้าถึงบริการต่างๆ ที่ใช้เฉพาะองค์กรที่คุณสังกัด',

          //edit favor page
          'Do you want to leave editing favorites?' : 'คุณต้องการออกจากการแก้ไขรายการที่ชื่นชอบหรือไม่?',
          'Do you want to exit the change?' : 'คุณต้องการออกจากการเปลี่ยนแปลงการแก้ไขหรือไม่?',
          'Edit Favorite Services' : 'แก้ไขบริการที่ชื่นชอบ',
          'Edit Business Services' : 'แก้ไขลำดับการแสดงองค์กร',
          'Please select the services you need from below.' : 'โปรดเลือกบริการที่ท่านต้องการจากด้านล่าง',
          'save' : 'บันทึก',
          'Would you like to save your favorite service ratings?' : 'คุณต้องการบันทึกการจัดลำดับบริการที่ชื่นชอบหรือไม่',
          'Unable to add favorite service' : 'ไม่สามารถเพิ่มบริการที่ชื่นชอบได้',
          '''You have reached the maximum number of favorite services, please delete the services you don't need before adding other services.''' : 'บริการที่ชื่นชอบครบจำนวนสูงสุดแล้วโปรดลบบริการที่ท่านไม่ต้องการออกก่อนเพิ่มบริการอื่นๆ',
          'Search Services of Favorite' : 'ค้นหาบริการที่ชื่นชอบ',
          'Search your favorite services' : 'ค้นหาบริการที่ชื่นชอบ',

          //Add business account page
          'Business account is an account that represents your business information and can use service access, especially for business with which you are affiliation.' : 'บัญชีองค์กรเป็นบัญชีที่จะแสดงข้อมูลในองค์กรของคุณ และสามารถเข้าถึงบริการต่างๆ ที่ใช้เฉพาะองค์กรที่คุณาสังกัด',
          'Select your branch' : 'เลือกสาขา',

          //All service categories page
          'All service categories' : 'หมวดบริการทั้งหมด',
          'All Services' : 'บริการทั้งหมด',

          //Snack Bar
          'Set Default Success' : 'ตั้งค่าเป็นแอปเริ่มต้น',
          'Deleted Service' : 'บริการถูกลบแล้ว',
          'Deleted Not Success' : 'บริการถูกลบไม่สำเร็จ',
          'Deleted Service Private' : 'ลบบริการองค์กรไม่สำเร็จ',
          'Removed Service' : 'บริการถูกเอาออกแล้ว',
          'Removed Not Success' : 'บริการถูกเอาออกไม่สำเร็จ',
          'Added Service Favorite' : 'บริการที่ชื่นชอบถูกเพิ่มแล้ว',
          'Added Not Success' : 'บริการถูกเพิ่มไม่สำเร็จ',
          'Added Service' : 'บริการถูกเพิ่มแล้ว',
          'Removed Service Favorite' : 'บริการที่ชื่นชอบถูกเอาออกแล้ว',
          'Prioritized Service' : 'บริการถูกจัดลำดับแล้ว',
          'Prioritized Not Success' : 'บริการถูกจัดลำดับไม่สำเร็จ',
          'Edited Complete' : 'การแก้ไขสำเร็จแล้ว',
          'Cancel Editing' : 'ยกเลิกการแก้ไขแล้ว',
          'Successfully Ranked First Organization' : 'จัดลำดับองค์กรเป็นอันดับแรกสำเร็จ',
          'Successfully Canceled The Organization Ranking' : 'ยกเลิกจัดลำดับองค์กรสำเร็จ',
          'Turn on notification Success' : 'เปิดแจ้งเตือนสำเร็จ',
          'Turn on notification Not Success' : 'เปิดแจ้งเตือนไม่สำเร็จ',
          'Turn off notification Success' : 'ปิดแจ้งเตือนสำเร็จ',
          'Turn off notification Not Success' : 'ปิดแจ้งเตือนไม่สำเร็จ',

          //Login Page
          'Connection Timed Out' : 'การเชื่อมต่อหมดเวลา',
          'Please Reconnect.' : 'โปรดเชื่อมต่อใหม่',
          'Login' : 'เข้าสู่ระบบ',
          'Login With Email': 'เข้าสู่ระบบผ่านทางอีเมล',
          'Login With PhoneNumber': 'เข้าสู่ระบบผ่านทางเบอร์โทรศัพท์',
          'Email': 'อีเมล',
          'Enterprise\'s abbreviation': 'อักษรย่อองค์กร',
          'Please enter your enterprise\'s abbreviation':'กรุณากรอกอักษรย่อองค์กรของท่าน',
          'If don\'t know, please contact your enterprise':'*กรณีไม่ทราบอักษรย่อ โปรดติดต่อองค์กรของท่าน*',
          'English': 'ภาษาไทย',
          'Sign in with': 'เข้าสู่ระบบผ่าน',
          'Phone Number': 'เบอร์โทรศัพท์',
          'Or': 'หรือ',
          'Username or One Platform account': 'ชื่อผู้ใช้งาน OnePlatform',
          'Password': 'กรุณาใส่รหัสผ่าน',
          'Sign In': 'ลงชื่อเข้าใช้',
          'wrong_username_or_password': 'ชื่อผู้ใช้ หรือ รหัสผ่านไม่ถูกต้อง',
          'account_disable': 'ระบบปิดใช้บัญชีของคุณแล้ว',
          'Register': 'สร้างบัญชีผู้ใช้',
          'Need help': 'ต้องการความช่วยเหลือ',
          'help': 'ศูนย์ช่วยเหลือ',
          'Forget Password ?': 'ลืมรหัสผ่าน ?',
          "What's the phone number for this device?":
              'กรุณากรอกเบอร์โทรศัพท์บนอุปกรณ์เครื่องนี้',
          'Continue': 'ถัดไป',
          'Continue ': 'ดำเนินการต่อ',
          'Mobile Verification': 'ยืนยันตัวตนทางโทรศัพท์',
          'We have sent the 6-digit code to':
              'เราได้ส่งรหัส 6 หลักไปที่หมายเลข',
          'RefCode': 'RefCode',
          ' Resend OTP in': 'ขอรหัส OTP ใหม่ใน',
          'Otp': 'รหัส Otp',
          'Edit Phone Number': 'ย้อนกลับ',
          "Didn't recieve the OTP ?": "ไม่ได้รับรหัส OTP",
          'Verify': 'ยืนยัน',
          'Contact Us': 'ติดต่อเรา',
          '''One Centric Co.,Ltd \n 1768 Thai Summit Tower 16th Floor\n New Petchaburi Road \n Bangkapi Huay Kwang \n Bangkok 10310 THAILAND\n Email: onechat@one.th''':
              '''บริษัท วัน เซ็นทริค จำกัด \n 1768 อาคารไทยซัมมิท ทาวเวอร์ ชั้น 16 \n ถ.เพชรบุรีตัดใหม่ \nแขวงบางกะปิ เขตห้วยขวาง\n กรุงเทพมหานคร 10310\n อีเมล: onechat@one.th''',

          'Session Expired. Please log in again':
              'เซสชั่นหมดอายุ กรุณาล็อกอินอีกครั้ง',
          'Session Expired.': 'เซสชันหมดอายุ',
          'Please Log-in again to extend session.':
              'โปรดเข้าสู่ระบบอีกครั้งเพื่อต่ออายุเซสชัน',

          'Update': 'อัปเดต',
          'Update Required': 'จำเป็นต้องอัปเดต',
          'Please Update to the last version.':
              'กรุณาอัปเดตเป็นเวอร์ชั่นล่าสุด.',

          "You'll receive SMS to verify your Identity for registration.":
              'คุณจะได้รับ SMS สำหรับยืนยันตัวตนเพื่อมาลงทะเบียนต่อไป',
          'Already Have an account?': 'หากมีบัญชีอยู่แล้ว สามารถ',
          'No Account?': 'หากยังไม่มีบัญชี สามารถ',
          'Login here': 'เข้าสู่ระบบได้ที่นี่',
          'Register here': 'ลงทะเบียนได้ที่นี่',
          'Username / Email': 'ชื่อผู้ใช้งาน / อีเมล',
          'Incorrect Username or Password.':
              'ชื่อผู้ใช้งาน หรือ รหัสผ่าน ไม่ถูกต้อง',
          'user_has_been_register': 'ผู้ใช้นี้ได้ลงทะเบียนแล้ว',
          'wrong_paramiter': 'การส่งข้อมูลผิดพลาด',
          'no_result_from_oneid':
              'เกิดข้อผิดพลาดทำให้ไม่ได้รับผลลัพธ์จาก oneid',
          'access_token_null': 'ไม่มีการเข้าถึงโทเค็น',
          'get_account_fail': 'การเข้าถึงบัญชีล้มเหลว',
          'wrong_type_otp': 'ประเภทของรหัส OTP ไม่ถูกต้อง',
          'user_not_register': 'หมายเลขโทรศัพท์ผู้ใช้ยังไม่ได้ลงทะเบียน',
          'Mobile number found, but not use for login.':
              'พบหมายเลขโทรศัพท์มือถือแต่ไม่ได้ใช้สำหรับเข้าสู่ระบบ',

          "This QR code is not working.":"คิวอาร์โค้ดนี้ใช้งานไม่ได้",
          "Warning" : "แจ้งเตือน",
          "This Service Cannot Be Used.":"ไม่สามารถใช้บริการนี้ได้",
          "Thai ID Card" : "รหัสบัตรประจำตัวประชาชน",
          "ID card code is invalid." : "รหัสบัตรประชาชนไม่ถูกต้อง",

          // Register Page
          'Register With Email': 'ลงทะเบียนผ่านทางอีเมล',
          'Register With PhoneNumber': 'ลงทะเบียนผ่านทางเบอร์โทรศัพท์มือถือ',
          'Mobile No': 'หมายเลขโทรศัพท์มือถือ',
          'Username': 'ชื่อผู้ใช้งาน',
          'Confirm Password': 'ยืนยันรหัสผ่าน',
          'Already have a One Platform account?':
              'มีบัญชี One Platform อยู่แล้วใช่ไหม?',
          'Change Language to English': 'Change Language to English',
          'Please fill out the information completely.':
              'กรุณากรอกข้อมูลให้ครบถ้วน',
          'Please fill information in Thai.': 'กรุณากรอกข้อมูลเป็นภาษาไทย',
          'Title name': 'คำนำหน้าชื่อ',
          'Select title name': 'เลือกคำนำหน้าชื่อ',
          'Please Fill Data': 'กรุณากรอกข้อมูล',
          'Passwords Do Not Match': 'รหัสผ่านไม่ตรงกัน',
          'Please fill your mobile number completely.':
              'โปรดกรอกหมายเลขโทรศัพท์มือถือให้ครบ',
          'Must have at least 6 characters and no special characters.':
              'ตัวอักษรอย่างน้อย 6 ตัว และห้ามมีอักขระพิเศษ',
          'Must contain at least one digit of English letters and numbers. using special characters.':
              'ต้องประกอบด้วยตัวอักษรภาษาอังกฤษผสมตัวเลขอย่างน้อยหนึ่งหลัก โดยใช้อักขระพิเศษได้',
          'Must have at least 8 characters.':
              'ความยาวต้องไม่น้อยกว่า 8 ตัวอักษร',
          'Enter OTP': 'กรอกรหัส OTP',
          'Enter 6 Digit OTP which sent to number':
              'กรอกรหัส OTP 6 หลักที่ส่งไปที่หมายเลขโทรศัพท์',
          'If not received, please press': 'ถ้าไม่ได้รับรหัส OTP กรุณากด',
          'sent OTP again': 'ส่ง OTP อีกครั้ง',
          'This username already exist.': 'ชื่อผู้ใช้งานมีการใช้ซ้ำ',
          'use Lower or Upper Letter.': 'ใช้ตัวพิมพ์ใหญ่หรือตัวพิมพ์เล็ก',
          'At least 8 letter.': 'ความยาวอย่างน้อย 8 ตัวอักษร',
          'At least 6 letter.': 'ความยาวอย่างน้อย 6 ตัวอักษร',
          'No special symbol.': 'ห้ามใช้ตัวอักขระพิเศษ',
          'Create Account complete.': 'สร้างบัญชีผู้ใช้เรียบร้อย',
          'Get Started': 'เริ่มต้นใช้งาน',
          'Add Private Account': 'เพิ่มบัญชีองค์กร',
          'Information not found.': 'ไม่พบข้อมูล',
          'too many requests': 'คุณขอ OTP บ่อยเกินไป กรุณาขอใหม่ภายหลัง',
          'The resource owner or authorizaion server denied the request.':
              'คุณขอ OTP บ่อยเกินไป กรุณาขอใหม่ภายหลัง',
          'Unable login with this QR code.' : 'ไม่สามารถเข้าสู่ระบบด้วย QR code นี้ได้',
          //AcceptService
          'Decline': 'ปฏิเสธ',
          'Accept': 'ยอมรับ',
          'Back To Main Page': 'กลับสู่หน้าหลัก',
          'Back': 'ย้อนกลับ',
          'Error': 'เกิดข้อผิดพลาด',
          'Can not read data.': 'ไม่สามารถอ่านข้อมูลได้',

          //Add Service Page
          'Add General Service' : 'เพิ่มบริการทั่วไป',
          'Add Business Service' : 'เพิ่มบริการองค์กร',
          '+ Business Service' : '+ เพิ่มบริการองค์กร',
          'Business is not active' : 'องค์กรของท่านยังไม่เปิดใช้บริการ',
          'Business' : 'องค์กร',

          'Home': 'หน้าหลัก',
          'Services': 'บริการ',
          'Setting': 'ตั้งค่า',
          'General': 'ทั่วไป',
          'Set Default App': 'ตั้งค่า Default Home',
          'Type to search services': 'พิมพ์เพื่อค้นหาบริการ',
          'Type to search Private Account': 'พิมพ์เพื่อค้นหาบัญชีองค์กร',
          'Choose Default App': 'เลือกตั้งค่าแอปเริ่มต้น',
          'Language': 'ภาษา',
          'ENGLISH': 'อังกฤษ',
          'THAI': 'ไทย',
          'Dark Mode': 'โหมดสีเข้ม',
          'On': 'เปิด',
          'Off': 'ปิด',
          'System': 'ระบบ',
          'Base on your device setting': 'ตามการตั้งค่าอุปกรณ์ของท่าน',
          'Font Size': 'ขนาดตัวอักษร',
          'You want to change font size': 'ต้องการเปลี่ยนขนาดตัวอักษร',
          'You want to change theme': 'ต้องการเปลี่ยนธีม',
          'Application will close': 'แอปพลิเคชันจะปิดตัวลง',
          'Small': 'เล็ก',
          'Medium': 'กลาง',
          'Large': 'ใหญ่',
          'Theme': 'ธีม',
          'Use Organize Theme': 'ใช้ธีมองค์กร',
          'Send Feedback': 'ข้อเสนอแนะ',
          'Send': 'ส่งข้อมูล',
          'Feedback': 'ข้อเสนอแนะ',
          'Feedback type*': 'ประเภทข้อเสนอแนะ*',
          'Add Description': 'เพิ่มคำอธิบาย',
          'Add Image': 'เพิ่มรูปภาพ',
          'Personal Information': 'ข้อมูลส่วนตัว',
          'Change Password': 'เปลี่ยนรหัสผ่าน',
          'Delete Account': 'ลบบัญชีผู้ใช้',
          'Sign Out': 'ออกจากระบบ',
          'App Info': 'ข้อมูลเกี่ยวกับแอปพลิเคชัน',
          'Terms and Conditions of Use': 'ข้อกำหนดและเงื่อนไขการใช้งาน',
          'Open source licenses': 'ประกาศทางกฎหมาย',
          'Current version : ': 'เวอร์ชัน',
          'Profile': 'โปรไฟล์',
          'Personal Profile': 'โปรไฟล์ส่วนตัว',
          'Manage Account': 'จัดการบัญชี',
          'Open Camera': 'เปิดกล้อง',
          'Select from photos and videos': 'เลือกจากรูปภาพหรือวิดีโอ',
          'User name': 'ชื่อผู้ใช้งาน',
          'Status': 'สถานะ',
          'Company Name': 'ชื่อองค์กร',
          'Telephone number': 'เบอร์โทรศัพท์มือถือ',
          'Job Position': 'ตำแหน่ง',
          'You want to log out': 'คุณต้องการออกจากระบบ',
          'Confirm': 'ยืนยัน',
          'Cancel': 'ยกเลิก',
          'Save Success.': 'บันทึกสำเร็จ',
          'Save': 'บันทึก',
          'Send Successed.': 'ส่งสำเร็จ',

          //Service Page
          'Favorite Services': 'บริการที่ชื่นชอบ',
          'Public Services': 'บริการทั่วไป',
          'Business Service' : 'บริการองค์กร',
          'Private Services': 'บริการภาคองค์กร',
          'My Profile': 'โปรไฟล์ของฉัน',
          'Public Account': 'บัญชีทั่วไป',
          'Private Account': 'บัญชีองค์กร',
          'Waiting for approval': 'รอการตรวจสอบ',
          'Remove Default App': 'ยกเลิกแอปเริ่มต้น',
          'Favorite Services': 'บริการที่ชื่นชอบ',
          'Add Favorite': 'เพิ่มบริการที่ชื่นชอบ',
          'Delete Favorite' : 'ลบบริการที่ชื่นชอบ',
          'Unfavorite Service': 'ลบบริการที่ชื่นชอบ',
          'Delete': 'ลบ',
          'Turn off notifications': 'ปิดแจ้งเตือน',
          'Turn on notifications': 'เปิดแจ้งเตือน',
          'Add Services': 'เพิ่มบริการ',
          'Detail': 'รายละเอียด',
          'No Results': 'ไม่พบผลการค้นหา',
          'Search Results' : 'ผลการค้นหา',
          'About': 'รายละเอียด',
          'This service is not available in this version.':
              'บริการนี้ไม่สามารถใช้ได้ในเวอร์ชั่นนี้',

          //Authenticator
          'Edit Successed.':'แก้ไขสำเร็จ',
          'Delete Successed.':'ลบสำเร็จ',
          'Keep both':'เก็บไว้ทั้งคู่',
          'Account already exists':'บัญชีมีอยู่แล้ว',
          'Replace':'แทนที่',
          'Replace OTP Success':'แทนที่ OTP สำเร็จแล้ว',
          'You already have a Authenticator account called':'คุณมีบัญชีการยืนยันตัวตนแบบสองขั้นตอนอยู่แล้ว ชื่อ',
          'account':'บัญชีผู้ใช้',
          'Code Copied':'คัดลอกรหัส',
          'Do you want to delete the data?': 'คุณต้องการลบข้อมูลนี้หรือไม่',
          'OK': 'ตกลง',
          'Add OTP Success': 'เพิ่ม OTP สำเร็จ',
          "Couldn't find any two-factor authentication information.":
              'ไม่พบข้อมูลการยืนยันตัวตนแบบสองขั้นตอน',
          'Edit Authenticator': 'แก้ไขการยืนยันตัวตนแบบสองขั้นตอน',
          'Authenticator': 'การยืนยันตัวตนแบบสองขั้นตอน',
          'Add Authenticator': 'เพิ่มการยืนยันตัวตนแบบสองขั้นตอน',
          'Specify a topic title': 'ระบุชื่อหัวข้อ',
          'Specify the title of the link': 'ระบุชื่อหัวข้อลิ้งค์',
          'Do you want to delete the data?': 'คุณต้องการลบข้อมูลนี้หรือไม่',
          'Scan your fingerprint (or face or whatever) to authenticate':
              'สแกนลายนิ้วมือของคุณ (หรือใบหน้าหรืออะไรก็ตาม) เพื่อตรวจสอบสิทธิ',
          'Authentication required':'ต้องมีการตรวจสอบสิทธิ์',
          'Verify identity': 'กรุณาทำการยืนยันตัวตน',

          //increase the credibility level
          'QR Code Authentication': 'ยืนยันตัวตนผ่าน QR Code',
          'Identity Assurance Level': 'ระดับในการพิสูจน์ตัวตน (IAL)',

          //Business ID
          'Branch':'สาขา',
          'Business Email' : 'อีเมลองค์กร',


          //Notifiaction Page
          'Notification': 'การแจ้งเตือน',
          'All': 'ทั้งหมด',
          'Services' : 'บริการ',
          'Read': 'อ่านแล้ว',
          'Read All' : 'อ่านแล้วทั้งหมด',
          'Businesses' : 'องค์กร',
          'Not Read': 'ยังไม่อ่าน',
          'Turn on Notifications' : 'เปิดการแจ้งเตือน',
          'Turn off Notifications' : 'ปิดการแจ้งเตือน',
          'Notifications All' : 'แจ้งเตือนทั้งหมด',

          //Ekyc Page
          'Confirm': 'ยืนยัน',
          'Continue': 'ดำเนินการต่อ',
          'Identification Card': 'บัตรประชาชน',
          'Only Thai people': 'เฉพาะคนไทยเท่านั้น',
          'Only foreigner': 'เฉพาะต่างชาติเท่านั้น',
          'Start Identity Verification': 'เริ่มทำการพิสูจน์ตัวตน',
          'Take Picture Again': 'ถ่ายอีกครั้ง',
          'Back To Home Page': 'กลับสู่หน้าหลัก',
          'eKYC Authentication': 'ยืนยันตัวตนผ่านระบบ eKYC',
          "You haven't verified your identity eKyc, request your identity verification eKyc." : "คุณยังไม่ได้ยืนยันตัวตน eKyc กรุณายืนยันตัวตน eKyc",

          'Take a picture of the front of your ID card.':
              'ถ่ายรูปด้านหน้าบัตรประชาชน',
          'Place the front of your ID card in the frame.':
              'วางด้านหน้าบัตรประชาชนให้อยู่ในกรอบ',
          'Take a photo on the back of your ID card.':
              'ถ่ายรูปด้านหลังบัตรประชาชน',
          'Place the back of your ID card in the frame.':
              'วางด้านหลังบัตรประชาชนให้อยู่ในกรอบ',
          'Take a photo of yourself coupled with an ID card.':
              'ถ่ายรูปคู่กับบัตรประชาชน',
          'Place yourself and hold your ID card in the frame.':
              'วางตัวเองและถือบัตรประชาชนให้อยู่ในกรอบ',

          'Welcome to the eKYC Identification system':
              'ยินดีต้อนรับสู่ระบบยืนยันตัวตน eKYC',
          'Online Authentication': 'การพิสูจน์ตัวตนผ่านระบบออนไลน์ ',
          'Reduces the risk of identity spoof':
              'ช่วยลดความเสี่ยงจากการโดนปลอมแปลงตัวตน',
          'Make transactions trustworthy': 'ทำให้ธุรกรรมมีความน่าเชื่อถือ',
          'Securely keep and guard information':
              'จัดเก็บ และปกป้องข้อมูลให้มีความปลอดภัย',
          'Confidence with International Standards':
              'มั่นใจด้วยมาตรฐานระดับสากล',
          'Please select eKYC authentication method':
              'กรุณาเลือกประเภทการยืนยันตัวตน eKYC',
          'Manage Identity Verification': 'การจัดการข้อมูลยืนยันตัวตน',
          'We are required by law to verify the identity of the applicant. Using a ID card photo and take a photo with the ID card to verify your identity.':
              'เราจำเป็นต้องปฏิบัติตามกฎหมายในการยืนยันตัวตนของผู้สมัครโดยใช้รูปบัตรประชาชน และถ่ายคู่บัตรประชาชน เพื่อยืนยันตัวตนของคุณ',
          'We are required by law to verify the identity of the applicant. Using a passport photo and take a photo with the passport to verify your identity.':
              'เราจำเป็นต้องปฏิบัติตามกฎหมายในการยืนยันตัวตนของผู้สมัคร โดยใช้รูปหนังสือเดินทาง และถ่ายคู่หนังสือเดินทาง เพื่อยืนยันตัวตนของคุณ',
          'We are required by law to verify the identity of the applicant. Using the required proof of identity to verify your identity.':
              'เราจำเป็นต้องปฏิบัติตามกฎหมายในการยืนยันตัวตนของผู้สมัคร โดยใช้หลักฐานยืนยันตัวตนที่กำหนดเพื่อยืนยันตัวตนของคุณ',
          'Verify Identity': 'ยืนยันตัวตน',
          'Your information will be kept confidential in accordance with the policy handling of personal information.':
              'ข้อมูลของท่านจะถูกรักษาไว้เป็นความลับตามนโยบายการจัดการข้อมูลส่วนบุคคล',
          'Loading Camera...': 'กำลังโหลดกล้องของคุณ...',
          'Check the photo on the front of your ID card.':
              'ตรวจสอบภาพถ่ายด้านหน้าบัตรประชาชน',
          'Check the photo on the front of your Passport.':
              'ตรวจสอบภาพถ่ายด้านหน้าหนังสือเดินทาง',
          '•  Take a photo only in front of your passport.':
              '•  ถ่ายรูปเฉพาะหน้า พาสปอร์ต เท่านั้น',
          '•  The first page of passport must be clearly and fully.':
              '•  รูปถ่ายด้านหน้าหนังสือเดินทางให้ครบถ้วนเต็มหน้า',
          '•  The first page of passport must not have any shadow':
              '•  รูปถ่ายด้านหน้าหนังสือเดินทางไม่มีเงาสะท้อน และเห็นข้อมูล',
          '•  The photo should have a scale of the id card in full.':
              '•  เห็นบัตรครบเต็มใบ',
          '•  No reflection of shadow and see the information clearly on the id card.':
              '•  ไม่มีเงาสะท้อน เห็นข้อมูลชัดเจน',
          'Check the photo on the back of your ID card.':
              'ตรวจสอบภาพถ่ายด้านหลังบัตรประชาชน',
          'Check the photo person couple with ID card.':
              'ตรวจสอบภาพถ่ายคู่กับบัตรประชาชน',
          'Check the photo person couple with Passport.':
              'ตรวจสอบภาพถ่ายคู่กับหนังสือเดินทาง',
          '•  Hold your ID card forward yourself.':
              '•  ถือบัตรประชาชนไว้ข้างหน้า',
          '•  Hold your Passport forward yourself.':
              'ถือหนังสือเดินทางไว้ข้างหน้า',
          '•  See your face clearly': '•  เห็นใบหน้าชัดเจน',
          '•  See your face and passport clearly':
              '•  เห็นหนังสือเดินทางและใบหน้าชัดเจน',
          '•  Passport must not be obscured your face.':
              'หนังสือเดินทางต้องไม่บังหน้า',
          '•  Please remove the wearable on your face while taking photos.':
              '•  กรุณาถอดเครื่องสวมใส่บนใบหน้าขณะถ่ายรูป',
          'Take a picture of the front of your passport.':
              'ถ่ายรูปคู่กับพาสปอร์ต',
          'Place the front of your passport in the frame.':
              'วางด้านหน้าบัตรพาสปอร์ตให้อยู่ในกรอบ',
          //Select Account Page
          'This number has multiple accounts opened.':
              'หมายเลขนี้มีการเปิดหลายบัญชี',
          'Please select the account for which you want to set up a login.':
              'โปรดเลือกบัญชีที่ต้องการตั้งค่าการลงชื่อเข้าใช้งาน',
          'Your chosen account It will be used as the primary account to log in with your phone number next time.':
              'บัญชีที่คุณเลือก จะใช้เป็นบัญชีหลักในการเข้าสู่ระบบด้วยเบอร์โทรศัพท์ในครั้งต่อไป',

          //Business Page
          'AccountPage': 'บัญชีส่วนบุคคล',
          'Add Personal Account': 'เพิ่มบัญชีองค์กร',
          'A personal account is an account that displays information in your organization and can beaccess to services that only applies to the organization you belong to':
              'บัญชีองค์กรเป็นบัญชีที่จะแสดงข้อมูลในองค์กรของคุณและสามารถเข้าถึงบริการต่างๆ ที่ใช้เฉพาะองค์กรที่คุณสังกัด',
          'Juristic Person Registration Number':
              'เลขทะเบียนนิติบุคคล/เลขประจำตัวผู้เสียภาษี',
          'Fill in the corporate registration number/taxpayer identification number.':
              'กรอกเลขทะเบียนนิติบุคคล/เลขประจำตัวผู้เสียภาษี',
          'Use 13 digits': 'ใช้ตัวเลข 13 หลัก',
          'Branch Code': 'รหัสสาขา',
          'Specify Branch Code': 'ระบุรหัสสาขา',
          //QR code
          'QrcodeCreated': 'สร้าง Qrcode',
          'Scan QR Code': 'สแกน QR Code',
          'QR Code': 'คิวอาร์โค้ด',
          'Create QR Code': 'สร้าง QR Code',
          'Enter The Data': 'ใส่ข้อมูล',
          'Register by QR Code': 'สมัครด้วยคิวอาร์โค้ด',
          'Login by QR Code': 'เข้าสู่ระบบด้วยคิวอาร์โค้ด',
          'Login by Enterprise Account': 'เข้าสู่ระบบด้วยบัญชีองค์กร',
          'Hi':'สวัสดี',
          'please enter your phone number.': 'กรุณากรอกเบอร์โทรศัพท์ของท่าน',
          'Please enter the link': 'กรุณากรอกลิงก์',

          'Search': 'ค้นหา',
          // 'Cancel':'Cancel',
          'Check The Organization': 'ตรวจสอบองค์กร',
          'Organization/Company Name': 'ชื่อองค์กร/บริษัท',
          'Check The Organization': 'ตรวจสอบองค์กร',
          'Organization/Company Name': 'ชื่อองค์กร/บริษัท',

          //Fill Personal Data Page
          'Verify Organization Membership': 'ยืนยันสมาชิกองค์กร',
          'Verified Organization': 'ท่านได้รับการอนุมัติเข้าองค์กรแล้ว',
          'Employee ID': 'รหัสพนักงาน/รหัสสมาชิก',
          'Fill in Employee ID / Member Code': 'กรอกรหัสพนักงานหรือรหัสสมาชิก',
          'Firstname': 'ชื่อ',
          'Fill in Firstname': 'กรอกชื่อ',
          'Lastname': 'นามสกุล',
          'Fill in Lastname': 'กรอกนามสกุล',
          'ID Card Number': 'หมายเลขบัตรประจำตัวประชาชน',
          'ID Card': 'บัตรประชาชน',
          'Date of Birth': 'วันเดือนปีเกิด',
          'Day/Month/Year': 'วัน/เดือน/ปี',
          // 'Phone Number':'Telephone Number',
          // 'Email':'Email',
          'Address': 'ที่อยู่',
          'Details': 'รายละเอียด',
          'Fill in Details': 'กรอกรายละเอียดที่อยู่',
          'Province': 'จังหวัด',
          // 'Select Province':'Select Province',
          'District': 'อำเภอ',
          // 'Select District':'Select District',
          'Sub District': 'ตำบล',
          // 'Select Sub District':'Select Sub District',
          'Zip Code': 'รหัสไปรษณีย์',
          // 'Select Zip Code':'Select Zip Code',
          'Accept The Organization Terms And Privacy Policy':
              'ยอมรับข้อตกลงการใช้งาน',
          'Confirm Registration': 'ยืนยันการลงทะเบียน',
          'Role ID': 'กรุณาเลือกตำแหน่ง',
          'Check Role ID': 'ตรวจสอบตำแหน่ง',
          'You have been release from organization': 'คุณถูกปลดจากองค์กร',
          'Roleaccount already have this role.':
              'คุณอยู่ในตำแหน่งนี้ขององค์กรแล้ว',
          'Rolealready_sent_request': 'คุณอยู่ในองค์กรแล้ว',
          'Terms and Conditions': 'ข้อกำหนดและเงื่อนไข',
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.":
              "Lorem Ipsum เป็นเพียงข้อความจำลองของอุตสาหกรรมการพิมพ์และการเรียงพิมพ์ Lorem Ipsum เป็นข้อความจำลองมาตรฐานของอุตสาหกรรมตั้งแต่ช่วงทศวรรษที่ 1500 เมื่อเครื่องพิมพ์ที่ไม่รู้จักใช้ประเภทห้องครัวและช่วงชิงมันเพื่อสร้างหนังสือตัวอย่างประเภท",
          "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.":
              "มันมีชีวิตรอดไม่เพียงแค่ห้าศตวรรษเท่านั้น แต่ยังก้าวกระโดดสู่การเรียงพิมพ์อิเล็กทรอนิกส์ ซึ่งยังคงไม่เปลี่ยนแปลงโดยพื้นฐานแล้ว ได้รับความนิยมในปี 1960 ด้วยการเปิดตัวแผ่น Letraset ที่มีเนื้อเรื่องของ Lorem Ipsum และล่าสุดด้วยซอฟต์แวร์การเผยแพร่บนเดสก์ท็อป เช่น Aldus PageMaker รวมถึง Lorem Ipsum เวอร์ชันต่างๆ",
          // 'Accept':'Accept',
          'Not Accept': 'ไม่ยอมรับ',
          'You Have Added Organization Members':
              'คุณได้ทำการเพิ่มสมาชิกองค์กรแล้ว',
          'Please Wait For Review': 'กรุณารอการตรวจสอบ',
          'If this information is incorrect Please contact your organization for assistance in accessing the service.' : 'หากข้อมูลนี้ไม่ถูกต้อง โปรดติดต่อองค์กรของคุณเพื่อช่วยเหลือในการเข้าถึงบริการ',
          'Back To Home Page': 'กลับสู่หน้าหลัก',
          'Please enter user information. for the system to be used to authenticate access access to corporate accounts' : 'กรุณากรอกข้อมูลผู้ใช้งาน เพื่อให้ระบบนำไปใช้ในการตรวจสอบสิทธิ์เข้า การถึงบัญชีองค์กรต่างๆ',

          // FeedbackPage
          'Please choose your subject': 'กรุณาเลือกประเภท',
          'Feedback ': 'แนะนำติชม',
          'Register ': 'การลงทะเบียน',
          'Sign in': 'การลงชื่อเข้าใช้งาน',
          'Verify identity': 'การยืนยันตัวตน',
          'Setting Profile': 'การจัดการข้อมูลส่วนตัว',
          'RA Permission': 'การกำหนดสิทธิ์ในองค์กร',
          'Public Services ': 'สำหรับภาคประชาชน',
          'Private Services ': 'สำหรับภาคองค์กร',
          'Services ': 'บริการภายในแอป',
          'Add Services ': 'การเพิ่มบริการ',
          'Other': 'อื่นๆ',
          'Verify Identity Success' : 'ยืนยันตัวตนสำเร็จ',

          //Service Detail
          'Remove from Home': 'นำออกจากหน้าหลัก',
          'Open Service': 'เปิดบริการ',
          'Add to Home': 'เพิ่มไปยังหน้าหลัก',
          //Private Services
          'Services Data Not Found.': 'ไม่พบข้อมูลบริการ',

          //Pin
          'Set Pin': 'ตั้งค่า Pin',
          'Lock Pin': 'เปิดการใช้งาน Pin',
          'Unlock Pin': 'ยกเลิกการใช้งาน Pin',
          'Please Enter Pin': 'กรุณากรอกรหัส Pin',
          'Please Confirm Pin': 'กรุณายืนยันรหัส Pin',
          'Please enter the correct Pin': 'กรุณากรอกรหัส Pin ให้ถูกต้อง',
          'Save Pin Success': 'บันทึก Pin สำเร็จ',
          'Activate Touch ID or Face ID' : 'ใช้งาน Touch ID หรือ Face ID',
          'Activate Service' : 'ใช้งานบริการ',
          'Remember: If someone else saved their fingerprint or enrolled their face to this device, they will have access to your account' : 'คำเตือน: ลายนิ้วมือหรือการสแกนใบหน้าที่สามารถเข้าใช้งานทั้งหมด จะเป็นไปตามการตั้งค่าบน Touch ID หรือ Face ID ของอุปกรณ์ของคุณเท่านั้น',
          'Remember: The service is turned on and off only according to the settings on your device.' : 'คำเตือน: การเปิดและปิดบริการจะเป็นไปตามการตั้งค่าบนอุปกรณ์ของคุณเท่านั้น',
          //Delete Account
          'Reason': 'เหตุผล',
          'The user cannot access ths account permanently. After confirmation, the account cannot be recovered.':
              'การลบบัญชี จะทำให้คุณไม่สามารถเข้าใช้งานบัญชีถาวร และบริการที่คุณเคยลงทะเบียนใช้งานด้วย One Platform จะไม่สามารถเข้าถึงได้ผ่าน One Platform Login ได้อีก การลบบัญชีเป็นการกระทำโดยถาวร ระบบจะไม่สามารถกู้คืนข้อมูลกลับมาได้หลังจากการยืนยัน',
          'Conditions of Use': """

    ข้อกำหนดและเงื่อนไขในการใช้งาน OnePlatform

    ข้อกำหนดและเงื่อนไขในการใช้งานที่แสดงไว้ ณ ที่นี้ (ต่อไปนี้เรียกว่า "ข้อกำหนดและเงื่อนไขฯ") ระบุถึงข้อกำหนดระหว่าง วัน เซ็นทริค จำกัด (ต่อไปนี้เรียกว่า "บริษัทฯ") และผู้ใช้ (ต่อไปนี้เรียกว่า "ผู้ใช้") เกี่ยวกับบริการหรือคุณลักษณะใดๆ ของ OnePlatform (ต่อไปนี้เรียกว่า "บริการฯ") ซึ่งบริษัทฯ เป็นผู้ให้บริการ
     
    1. คำนิยาม

    คำและข้อความต่อไปนี้จะมีความหมายตามที่กำหนดไว้ด้านล่างนี้เมื่อมีการใช้ในข้อกำหนดและเงื่อนไขฯ
    1.1 "เนื้อหา" หมายถึง ข้อมูล เช่น ข้อความ ไฟล์เสียง เพลง รูปภาพ วิดีโอ ซอฟต์แวร์ โปรแกรม รหัสคอมพิวเตอร์ และสิ่งอื่นๆ ที่คล้ายคลึงกัน
    1.2 "เนื้อหาฯ" หมายถึง เนื้อหาที่สามารถเข้าถึงได้ผ่านทางบริการฯ
    1.3 "เนื้อหาจากผู้ใช้" หมายถึง เนื้อหาที่ผู้ใช้ได้ส่ง ส่งผ่าน หรือ อัพโหลด
    1.4 "ข้อกำหนดและเงื่อนไขฯ เพิ่มเติม" หมายถึง เอกสารที่บริษัทฯ ออกหรืออัพโหลดซึ่งเกี่ยวกับบริการฯ ภายใต้ชื่อ "ข้อตกลง" "แนวทางปฏิบัติ" "นโยบาย" และอื่นๆ ในทำนองเดียวกัน
     
    2. การตกลงยอมรับข้อกำหนดและเงื่อนไขฯ

    2.1 ผู้ใช้ทุกรายจะต้องใช้บริการฯ ตามข้อกำหนดที่ระบุไว้ในข้อกำหนดและเงื่อนไขฯ ผู้ใช้จะไม่สามารถใช้บริการฯ ได้เว้นเสียแต่ว่า ผู้ใช้ได้ตกลงยอมรับข้อกำหนดและเงื่อนไขฯ การตกลงยอมรับดังกล่าวมีผลสมบูรณ์และเพิกถอนมิได้
    2.2 ผู้เยาว์สามารถใช้บริการฯ ได้ต่อเมื่อได้รับความยินยอมจากบิดามารดาหรือผู้ปกครองตามกฎหมายเท่านั้น นอกจากนี้ หากผู้ใช้ใช้บริการฯ แทน หรือ เพื่อวัตถุประสงค์ขององค์กรธุรกิจใดๆ จะถือว่า องค์กรธุรกิจดังกล่าวได้ตกลงยอมรับข้อกำหนดและเงื่อนไขฯ นี้ด้วยแล้ว การตกลงยอมรับดังกล่าวมีผลสมบูรณ์และเพิกถอนมิได้
    2.3 การที่ผู้ใช้ใช้บริการฯ ถือว่า ผู้ใช้ได้ตกลงยอมรับข้อกำหนดและเงื่อนไขฯ การตกลงยอมรับดังกล่าวมีผลสมบูรณ์และเพิกถอนมิได้
    2.4 หากมีข้อกำหนดและเงื่อนไขฯ เพิ่มเติมสำหรับบริการฯ ผู้ใช้จะต้องปฏิบัติตามข้อกำหนดและเงื่อนไขฯ เพิ่มเติมนั้นด้วยเช่นเดียวกับข้อกำหนดและเงื่อนไขฯ นี้

    3. การแก้ไขข้อกำหนดและเงื่อนไขฯ

    บริษัทฯ อาจแก้ไขข้อกำหนดและเงื่อนไขฯ หรือ ข้อกำหนดและเงื่อนไขฯ เพิ่มเติม เมื่อบริษัทฯ เห็นว่ามีความจำเป็น โดยไม่ต้องให้คำบอกกล่าวล่วงหน้าแก่ผู้ใช้ การแก้ไขจะมีผลบังคับเมื่อมีการประกาศข้อกำหนดและเงื่อนไขฯ ที่แก้ไข หรือข้อกำหนดและเงื่อนไขฯ เพิ่มเติมที่แก้ไขไว้ในสถานที่ที่เหมาะสมภายในเว็บไซต์ที่บริษัทฯ เป็นผู้ดำเนินงาน การที่ผู้ใช้ใช้บริการฯ ต่อไป ถือว่าผู้ใช้ได้ให้การยอมรับที่มีผลสมบูรณ์และเพิกถอนมิได้ต่อข้อกำหนดและเงื่อนไขฯ ที่แก้ไขแล้ว หรือข้อกำหนดและเงื่อนไขฯ เพิ่มเติมที่แก้ไขแล้ว ผู้ใช้ควรตรวจสอบข้อกำหนดและเงื่อนไขฯ เป็นประจำระหว่างการใช้บริการฯ เนื่องจากอาจไม่มีการแจ้งเตือนแยกต่างหากเกี่ยวกับการแก้ไขข้อกำหนดและเงื่อนไขฯ ดังกล่าว

    4. บัญชี

    4.1 เมื่อผู้ใช้ให้ข้อมูลเกี่ยวกับตนเองแก่บริษัทฯ ผู้ใช้จะต้องให้ข้อมูลที่เป็นจริง ถูกต้องและครบถ้วนในขณะที่ใช้บริการฯ และปรับปรุงข้อมูลดังกล่าวให้เป็นปัจจุบันอยู่ตลอดเวลา
    4.2 หากผู้ใช้ลงทะเบียนรหัสผ่านในขณะที่ใช้บริการฯ ผู้ใช้จะต้องใช้ความระมัดระวังและมีความรับผิดชอบตามสมควรเพื่อไม่ให้มีการใช้รหัสผ่านในลักษณะที่ไม่ชอบด้วยกฎหมาย บริษัทฯ สามารถถือว่ากิจกรรมต่างๆ ที่ดำเนินการโดยใช้รหัสผ่านดังกล่าว เป็นกิจกรรมที่ผู้เป็นเจ้าของรหัสผ่านได้ดำเนินการด้วยตนเอง
    4.3 ผู้ใช้งานที่จดทะเบียนใช้บริการฯ สามารถลบบัญชีของตนและเลิกใช้บริการฯ ได้ ไม่ว่าในเวลาใดๆ ก็ตาม
    4.4 บริษัทฯ อาจระงับหรือลบบัญชีของผู้ใช้ได้โดยไม่ต้องให้คำบอกกล่าวล่วงหน้าแก่ผู้ใช้ หากบริษัทฯ เห็นว่าผู้ใช้กำลังละเมิดหรือได้ละเมิดข้อกำหนดและเงื่อนไขฯ
    4.5 บริษัทฯ สงวนสิทธิที่จะลบบัญชีใดๆ ที่ไม่มีการเปิดใช้งานเป็นเวลา 1 ปีหรือนานกว่านั้นนับตั้งแต่วันที่มีการเปิดใช้งานบัญชีดังกล่าวครั้งล่าสุด โดยไม่ต้องให้คำบอกกล่าวล่วงหน้าใดๆ แก่ผู้ใช้
    4.6 สิทธิที่จะใช้บริการของผู้ใช้จะสิ้นสุดลงเมื่อมีการลบบัญชีของผู้ใช้ไม่ว่าด้วยเหตุผลใดๆ ก็ตาม บัญชีจะไม่สามารถกู้คืนมาได้แม้ว่าผู้ใช้จะลบบัญชีของตนโดยไม่ได้ตั้งใจก็ตาม และบริษัทฯ ขอให้ผู้ใช้ตระหนักถึงเรื่องนี้ด้วย
    4.7 บัญชีแต่ละบัญชีในบริการฯ มีไว้เพื่อการใช้งานเฉพาะและเป็นของเจ้าของบัญชีแต่เพียงผู้เดียวเท่านั้น ผู้ใช้ไม่สามารถโอนหรือให้ยืมบัญชีของตนแก่บุคคลภายนอกใดๆ และบุคคลภายนอกใดๆ ไม่สามารถรับช่วงบัญชีจากผู้ใช้ได้

    5. การคุ้มครองข้อมูลส่วนบุคคล

    5.1 บริษัทฯ ให้ความสำคัญแก่ความเป็นส่วนตัวของผู้ใช้ของบริษัทฯ เป็นลำดับแรก
    5.2 บริษัทฯ สัญญาว่าจะคุ้มครองความเป็นส่วนตัวและข้อมูลส่วนบุคคลของผู้ใช้ของบริษัทฯ ตาม "นโยบายของ OnePlatform ว่าด้วยการคุ้มครองข้อมูลส่วนบุคคล"
    5.3 บริษัทฯ สัญญาที่จะใช้ความระมัดระวังและความใส่ใจอย่างสูงสุดเกี่ยวกับมาตรการรักษาความปลอดภัยของบริษัทฯ เพื่อให้มีการรักษาความปลอดภัยของข้อมูลใดๆ ของผู้ใช้ ทั้งหมด
     
    6. การให้บริการฯ

    6.1 ผู้ใช้จะต้องเป็นผู้รับผิดชอบจัดหาเครื่องคอมพิวเตอร์ อุปกรณ์โทรศัพท์เคลื่อนที่ อุปกรณ์สื่อสาร ระบบปฏิบัติการและการเชื่อมต่อข้อมูลที่จำเป็นสำหรับการใช้บริการฯ โดยผู้ใช้เป็นผู้ออกค่าใช้จ่ายเอง
    6.2 บริษัทฯ สงวนสิทธิที่จะจำกัดการเข้าถึงบริการฯ ทั้งหมดหรือเพียงบางส่วน ขึ้นอยู่กับเงื่อนไขที่บริษัทฯ เห็นว่าจำเป็น เช่น อายุ การระบุตัวตน สถานภาพสมาชิกในปัจจุบัน และสิ่งอื่นๆ ที่คล้ายคลึงกัน
    6.3 บริษัทฯ สงวนสิทธิที่จะเปลี่ยนแปลงหรือยุติบริการฯ ทั้งหมดหรือเพียงบางส่วนตามดุลยพินิจของบริษัทฯ ไม่ว่าในเวลาใดๆ ก็ตาม โดยไม่ต้องให้คำบอกกล่าวล่วงหน้าใดๆ แก่ผู้ใช้
     
    7. การไม่สามารถพึ่งพาบริการฯ เพื่อโทรศัพท์ฉุกเฉิน

    ผู้ใช้ไม่สามารถที่จะพึ่งพาบริการฯ เพื่อการโทรศัพท์ฉุกเฉินได้ เช่น การโทรไปหน่วยงานที่บังคับใช้กฎหมาย หน่วยงานด้านความปลอดภัยทางทะเล หน่วยดับเพลิง หรือบริการฉุกเฉินอื่นๆ
     
     
    8. บริการของคู่ค้า

    เนื้อหาหรือบริการอื่นๆ ที่เสนอโดยคู่ค้ารายอื่นที่ร่วมมือกับบริษัทฯ อาจจะรวมอยู่ภายในบริการฯ นี้ด้วย โดยคู่ค้าจะต้องเป็นผู้รับผิดชอบแต่เพียงผู้เดียวเกี่ยวกับเนื้อหา และ/หรือบริการที่เสนอดังกล่าว นอกจากนี้ เนื้อหาและบริการดังกล่าวอาจอยู่ภายใต้บังคับของข้อกำหนดและเงื่อนไขที่ชัดแจ้ง ฯลฯ ซึ่งคู่ค้าได้กำหนดไว้สำหรับเนื้อหาและบริการนั้น ๆ
     
    9. เนื้อหาฯ
     
    9.1 บริษัทฯ อนุญาตให้ผู้ใช้ใช้เนื้อหาฯ ที่บริษัทฯ จัดให้ เพื่อวัตถุประสงค์ในการใช้บริการฯ เท่านั้น โดยเป็นการอนุญาตให้ใช้สิทธิที่โอนต่อไม่ได้ นำไปให้อนุญาตใหม่ไม่ได้  และอนุญาตให้ใช้สิทธิโดยไม่จำกัดแต่เพียงผู้เดียว (non-transferable, non-re-licensable, non-exclusive license)
    9.2 ผู้ใช้จะต้องปฏิบัติตามเงื่อนไขที่เหมาะสมเมื่อใช้เนื้อหาฯ ซึ่งอาจมีค่าใช้จ่ายเพิ่มเติมและขึ้นอยู่กับระยะเวลาในการใช้งาน ถึงแม้ในกรณีที่มีถ้อยคำ เช่น "การซื้อ" "การขาย" และคำอื่นๆ ในทำนองเดียวกันปรากฏบนหน้าจอในการใช้บริการฯ บริษัทฯ จะยังคงเป็นเจ้าของสิทธิในทรัพย์สินทางปัญญาและสิทธิอื่นๆ ในเนื้อหาฯ ที่บริษัทฯ เสนอต่อผู้ใช้ และจะไม่มีการโอนสิทธิต่างๆ ดังกล่าวไปให้แก่ผู้ใช้
    9.3 ผู้ใช้จะต้องไม่ใช้เนื้อหาฯ เกินจากขอบเขตของการใช้งานตามวัตถุประสงค์ของเนื้อหาฯ ในบริการฯ (ยกตัวอย่างเช่น การทำสำเนา การส่ง การทำซ้ำ และการแก้ไข)
    9.4 หากผู้ใช้ต้องการที่จะสำรองเนื้อหาจากผู้ใช้ ไม่ว่าทั้งหมดหรือเพียงบางส่วน ผู้ใช้จะต้องดำเนินการดังกล่าวด้วยตนเอง บริษัทฯ จะไม่มีภาระหน้าที่ในการสำรองเนื้อหาจากผู้ใช้แต่อย่างใด
    9.5 บริการฯ อาจรวมถึง คุณลักษณะการทำงานต่างๆ ที่ผู้ใช้หลายคนสามารถที่จะโพสต์ ตรวจแก้ แก้ไข และลบรายการต่างๆ ได้ ในกรณีดังกล่าว ผู้ใช้ที่โพสต์เนื้อหาจากผู้ใช้จะต้องอนุญาตให้ผู้ใช้รายอื่นๆ แก้ไขเนื้อหาจากผู้ใช้ได้
    9.6 ผู้ใช้จะยังคงมีสิทธิที่เกี่ยวกับเนื้อหาจากผู้ใช้อยู่เช่นเดิม และบริษัทฯ จะไม่ได้มาซึ่งสิทธิใดๆ ในเนื้อหาดังกล่าว อย่างไรก็ตาม หากผู้ใช้รายอื่นๆ นอกจาก "เพื่อน" ของผู้ใช้สามารถมองเห็นเนื้อหาจากผู้ใช้ดังกล่าวได้ ผู้ใช้ที่โพสต์เนื้อหาจากผู้ใช้นั้นจะต้องมอบการอนุญาตให้ใช้สิทธิที่ไม่ผูกขาด ไม่มีค่าสิทธิ และใช้ได้ทุกแห่ง (worldwide, non-exclusive, royalty-free license) แก่บริษัทฯ (พร้อมด้วยสิทธิที่จะช่วงการอนุญาตให้ใช้สิทธิในเนื้อหาดังกล่าวแก่บุคคลภายนอกอื่นๆ ที่ทำงานร่วมกับบริษัทฯ) เป็นระยะเวลาที่ไม่จำกัด เพื่อใช้เนื้อหาดังกล่าว (ภายหลังจากการแก้ไขเนื้อหาดังกล่าว หากบริษัทฯ เห็นว่าจำเป็นและสมควร) เพื่อบริการต่างๆ และ/หรือเพื่อวัตถุประสงค์ในการส่งเสริมการตลาด
    9.7 บริษัทฯ อาจตรวจสอบรายละเอียดของเนื้อหาจากผู้ใช้ หากบริษัทฯ เห็นว่า เนื้อหาจากผู้ใช้อาจฝ่าฝืนกฎหมายหรือข้อกำหนดและเงื่อนไขฯ อย่างไรก็ตาม บริษัทฯ ไม่มีภาระหน้าที่จะต้องดำเนินการตรวจสอบดังกล่าว
    9.8 หากบริษัทฯ เห็นว่า ผู้ใช้ได้ฝ่าฝืนหรืออาจฝ่าฝืนกฎหมาย หรือข้อกำหนดและเงื่อนไขฯ ที่เกี่ยวกับเนื้อหาจากผู้ใช้ บริษัทฯ สงวนสิทธิที่จะตัดสิทธิของผู้ใช้ในการที่จะใช้เนื้อหาจากผู้ใช้ในบางลักษณะ เช่น การลบเนื้อหาจากผู้ใช้ โดยไม่ต้องให้คำบอกกล่าวล่วงหน้าแก่ผู้ใช้
     
     
    10. ข้อจำกัด
     
    ผู้ใช้จะต้องไม่มีส่วนร่วมในกิจกรรมต่างๆ ดังต่อไปนี้เมื่อใช้บริการฯ
    10.1 กิจกรรมที่ฝ่าฝืนกฎหมาย คำพิพากษา มติหรือคำสั่งศาล หรือมาตรการทางปกครองที่มีผลผูกพันทางกฎหมาย
    10.2 กิจกรรมที่อาจขัดต่อความสงบเรียบร้อยหรือศีลธรรมอันดีของประชาชน
    10.3 กิจกรรมที่ละเมิดสิทธิในทรัพย์สินทางปัญญา เช่น ลิขสิทธิ์ เครื่องหมายการค้าและสิทธิบัตร ชื่อเสียง ความเป็นส่วนตัว และสิทธิอื่นๆ ทั้งหมดของบริษัทฯ หรือบุคคลภายนอกที่มีการมอบให้ตามกฎหมายหรือตามสัญญา
    10.4 กิจกรรมที่แสดงหรือส่งต่อซึ่งการแสดงออกที่มีลักษณะรุนแรงหรือเกี่ยวกับเพศ การแสดงออกที่นำไปสู่การเลือกปฏิบัติโดยเชื้อชาติ สัญชาติ ความเชื่อ เพศ สถานะทางสังคม ถิ่นกำเนิดครอบครัว และอื่นๆ การแสดงออกที่ชักชวนหรือส่งเสริมการฆ่าตัวตาย พฤติกรรมการทำร้ายตัวเองหรือการใช้ยาในทางที่ผิด หรือการแสดงออกที่ต่อต้านสังคมซึ่งประกอบด้วยเนื้อหาที่ต่อต้านสังคมและทำให้บุคคลอื่นเกิดความไม่สบายใจ
    10.5 กิจกรรมที่อาจทำให้ผู้อื่นเข้าใจผิดเกี่ยวกับบริษัทฯ หรือบุคคลภายนอก และ การจงใจเผยแพร่ข้อมูลเท็จ
    10.6 กิจกรรมต่างๆ เช่น การส่งข้อความโดยการสุ่มไปให้แก่ผู้ใช้จำนวนมาก (ยกเว้นข้อความที่ได้รับความเห็นชอบจากบริษัทฯ) การเพิ่มผู้ใช้เป็นเพื่อน หรือเข้าไปในกลุ่มพูดคุยโดยการสุ่ม หรือกิจกรรมอื่นใดที่บริษัทฯ ถือว่าเป็นการส่งข้อความรบกวน (spamming)
    10.7 กิจกรรมที่มีการแลกเปลี่ยนสิทธิในการใช้เนื้อหาฯ เป็นเงินสด ทรัพย์สินหรือผลประโยชน์ทางเศรษฐกิจอื่นๆ โดยไม่ได้รับอนุญาตจากบริษัทฯ
    10.8 กิจกรรมที่มีการใช้บริการฯ เพื่อการขาย การตลาด โฆษณา การชักชวน หรือวัตถุประสงค์ทางการค้าอื่นๆ (ยกเว้นวัตถุประสงค์ที่ได้รับความเห็นชอบจากบริษัทฯ) กิจกรรมที่มีการใช้บริการฯ เพื่อการกระทำทางเพศหรือการกระทำที่อนาจาร กิจกรรมที่มีการใช้บริการฯ เพื่อวัตถุประสงค์ในการพบบุคคลเพื่อการมีเพศสัมพันธ์ กิจกรรมที่ใช้บริการฯ เพื่อวัตถุประสงค์ในการคุกคาม หรือการหมิ่นประมาทผู้ใช้รายอื่นๆ หรือกิจกรรมที่ใช้บริการฯ เพื่อวัตถุประสงค์อื่นๆ ที่มิใช่จุดประสงค์ที่แท้จริงของบริการฯ
    10.9 กิจกรรมที่เป็นประโยชน์ต่อหรือเป็นการร่วมมือกับกลุ่มที่ต่อต้านสังคม
    10.10 กิจกรรมที่เกี่ยวกับกิจกรรมทางศาสนาหรือการเชื้อเชิญให้เข้ากลุ่มทางศาสนา
    10.11 กิจกรรมที่นำไปสู่การเก็บรวบรวม การเปิดเผย หรือการให้ข้อมูลส่วนบุคคลของบุคคลอื่น ข้อมูลที่จดทะเบียน ประวัติผู้ใช้ หรือข้อมูลอื่นๆ ในทำนองเดียวกันโดยไม่ชอบด้วยกฎหมายหรือไม่เหมาะสม
    10.12 กิจกรรมที่แทรกแซงเครื่องแม่ข่าย หรือระบบเครือข่ายของบริการฯ กิจกรรมซึ่งเป็นการใช้บริการฯ ในทางที่ผิดด้วยการใช้บ็อท (BOTs) เครื่องมือเพื่อการโกง หรือวิธีการทางเทคนิคอื่นๆ กิจกรรมที่ใช้ข้อบกพร่องของบริการฯ โดยไตร่ตรองไว้ก่อน กิจกรรมที่ทำการสอบถามอย่างไม่สมควร และ/หรือสิทธิเรียกร้องที่ไม่ควรได้ เช่น การถามคำถามเดียวกันซ้ำๆ เกินความจำเป็น และกิจกรรมที่แทรกแซงการให้บริการฯ ของบริษัท หรือการใช้บริการฯ ของผู้ใช้
    10.13 กิจกรรมที่ให้ความช่วยเหลือหรือส่งเสริมกิจกรรมใดๆ ที่ระบุไว้ในข้อ 1 ถึงข้อ 12 ข้างต้น
    10.14 กิจกรรมอื่นๆ ที่บริษัทฯ เห็นว่าไม่เหมาะสม
     
    11. ความรับผิดชอบของผู้ใช้
     
    11.1 ผู้ใช้จะต้องใช้บริการฯ นี้โดยเป็นความเสี่ยงของผู้ใช้เอง และจะต้องรับผิดชอบแต่เพียงผู้เดียวสำหรับการกระทำที่กระทำไปและผลของการกระทำที่มีต่อบริการฯ นี้
    11.2 บริษัทฯ อาจใช้มาตรการที่บริษัทฯ เห็นว่าจำเป็นและเหมาะสมได้ หากบริษัทฯ รับทราบว่าผู้ใช้รายหนึ่งรายใดกำลังใช้บริการฯ ในทางที่ฝ่าฝืนข้อกำหนดและเงื่อนไขฯ อย่างไรก็ตาม บริษัทฯไม่ต้องรับผิดชอบในการแก้ไขหรือป้องกันการฝ่าฝืนดังกล่าวต่อผู้ใช้หรือบุคคลอื่นๆ
    11.3 ในกรณีที่เกิดความสูญเสีย/ความเสียหายแก่บริษัทฯ หรือบริษัทฯ ถูกเรียกเก็บค่าใช้จ่ายใดๆ (ซึ่งรวมถึงโดยไม่จำกัดเพียงค่าทนายความ) ไม่ว่าโดยตรงหรือโดยอ้อม (ซึ่งรวมถึงโดยไม่จำกัดเพียงกรณีที่มีบุคคลภายนอกฟ้องร้องเรียกค่าเสียหายจากบริษัทฯ) อันเนื่องมาจากการที่ผู้ใช้ฝ่าฝืนกฎหมายที่เกี่ยวข้องหรือข้อกำหนดและเงื่อนไขฯ ในขณะที่ใช้บริการฯ ผู้ใช้จะต้องชดใช้ค่าเสียหายให้แก่บริษัทฯ ทันทีที่บริษัทฯ ร้องขอ
     
    12. การยกเว้นความรับผิดของบริษัทฯ

    12.1 บริษัทฯ ไม่รับประกันไม่ว่าโดยชัดแจ้งหรือโดยปริยายว่า บริการฯ (ซึ่งรวมถึงเนื้อหาฯ) จะปราศจากข้อบกพร่องตามจริงหรือตามกฎหมาย (ซึ่งรวมถึงแต่ไม่จำกัดเพียง เสถียรภาพ การไว้วางใจได้ ความถูกต้อง ความสมบูรณ์ การมีประสิทธิผล ความเหมาะสมในการใช้เพื่อวัตถุประสงค์เฉพาะ ข้อบกพร่อง ข้อผิดพลาด จุดบกพร่องที่เกี่ยวกับความปลอดภัย (bug)  หรือการละเมิดสิทธิต่างๆ) และบริษัทฯ ไม่มีความรับผิดชอบในการที่จะต้องจัดหาบริการฯ ที่ไม่มีข้อบกพร่องดังกล่าว
    12.2 บริษัทฯ จะไม่ต้องรับผิดชอบต่อค่าเสียหายใดๆ ที่เกิดขึ้นกับผู้ใช้อันเกี่ยวกับการใช้บริการฯ อย่างไรก็ตาม หากมีการตีความว่าข้อตกลง (ซึ่งรวมถึงแต่ไม่จำกัดเพียงข้อกำหนดและเงื่อนไขฯ) ระหว่างบริษัทฯ และผู้ใช้เกี่ยวกับบริการฯ เป็นสัญญาผู้บริโภคตามกฎหมายว่าด้วยสัญญาผู้บริโภคในประเทศญี่ปุ่น ข้อยกเว้นความรับผิดนี้จะไม่ใช้บังคับ
    12.3 ไม่ว่าเงื่อนไขที่ระบุไว้ในข้อ 12.2 ข้างต้นจะกำหนดไว้อย่างไร บริษัทฯ จะไม่ต้องรับผิดชอบต่อค่าเสียหายโดยอ้อม ค่าเสียหายพิเศษ ค่าเสียหายเนื่องจากการผิดสัญญา ค่าเสียหายต่อเนื่องหรือค่าเสียหายเชิงลงโทษใดๆ (ซึ่งรวมถึงแต่ไม่จำกัดเพียงค่าเสียหายที่บริษัทฯ หรือผู้ใช้สามารถคาดการณ์หรือน่าจะคาดการณ์ได้) ในส่วนที่เกี่ยวกับการผิดสัญญาหรือการกระทำละเมิดของบริษัทฯ เนื่องจากความประมาทเลินเล่อของบริษัทฯ (ยกเว้นความประมาทเลินเล่ออย่างร้ายแรง) ค่าชดเชยสำหรับค่าเสียหายตามปกติในส่วนที่เกี่ยวกับการผิดสัญญาหรือการกระทำละเมิดของบริษัทฯ เนื่องจากความประมาทเลินเล่อของบริษัทฯ (ยกเว้นความประมาทเลินเล่ออย่างร้ายแรง) จะจำกัดไว้ที่จำนวนเงินรวมของค่าบริการที่ได้รับจากผู้ใช้ในเดือนปฏิทินที่เกิดค่าเสียหายดังกล่าวขึ้น
     
    13. การแจ้งเตือนและการติดต่อ
     
    13.1 เมื่อบริษัทฯ แจ้งหรือติดต่อผู้ใช้เกี่ยวกับบริการฯ บริษัทอาจใช้วิธีการที่บริษัทฯ เห็นว่าเหมาะสม เช่น การประกาศไว้ในเว็บไซต์ซึ่งบริษัทฯ เป็นผู้ดำเนินงาน
    13.2 เมื่อผู้ใช้แจ้งหรือติดต่อบริษัทฯ เกี่ยวกับบริการฯ ผู้ใช้จะต้องใช้แบบฟอร์มสอบถามสำหรับลูกค้าที่มีอยู่ในเว็บไซต์ซึ่งบริษัทฯ เป็นผู้ดำเนินงานหรือโดยวิธีการอื่นๆ ที่บริษัทฯ กำหนด
     
    จบข้อความ
    ปรับปรุงล่าสุดเมื่อวันที่ 15 สิงหาคม 2565

""",
          'BusinessUsTerms': """
          ข้อกำหนดการใช้บริการ ONE ID

            วัตถุประสงค์ของข้อกำหนดการใช้งานบัญชีระบบยืนยันตัวตนกลาง (ONE ID Account Terms of Use) (ต่อไปนี้เรียกว่า “ข้อกำหนด”) มีไว้เพื่อวางข้อกำหนดและเงื่อนไข สำหรับการใช้บริการทั้งหมดที่เกี่ยวกับบัญชีระบบยืนยันตัวตนกลาง (ONE ID Account) (ต่อไปนี้เรียกว่า “บัญชีกลาง”)  ซึ่งให้บริการโดยไทย ไอเด็นติตี้ส์ (THAI IDENTITIES) และบริษัทในเครือ (ต่อไปนี้เรียกรวมกันว่า “บริษัท”) 

            ลูกค้าจะต้องใช้บัญชีกลางโดยเป็นไปตามข้อกำหนดนี้ และข้อกำหนดและระเบียบการ (Terms and Conditions) นอกจากนี้ ลูกค้าจะต้องรับผิดชอบในการปฏิบัติตามกฎหมายและข้อบังคับทั้งหมดที่เกี่ยวข้องเมื่อใช้งานบัญชีกลาง

ข้อ 1  การสมัครใช้งาน การยืนยันตัวตน การปฏิเสธการยืนยันตัวตน  และการยกเลิกการยืนยันตัวตน  

            1.1 ไม่ว่าลูกค้าจะเป็นบุคคลธรรมดาหรือนิติบุคคล ลูกค้าจะได้รับบัญชี (ต่อไปนี้เรียกว่า “บัญชีกลาง”) เพื่อใช้งานบัญชีกลาง โดยการสมัครขอใช้งานบัญชีกลางผ่านทางวิธีการที่บริษัทกำหนด

            1.2 เมื่อลูกค้าได้สมัครใช้งานบัญชีกลางผ่านทางวิธีการที่บริษัทกำหนดและได้รับการอนุมัติจากบริษัทแล้ว บริษัทอาจจะดำเนินการยืนยันบัญชีกลางของลูกค้าดังกล่าว (ต่อไปนี้จะเรียกบัญชีซึ่งได้รับการยืนยันจากบริษัทว่า “บัญชีกลางที่ได้รับการยืนยันแล้ว”) 

            1.3 ในกรณีที่บริษัทเห็นว่ามีข้อใดข้อหนึ่งดังต่อไปนี้เกิดขึ้นกับลูกค้า บริษัทสามารถปฏิเสธคำขอของลูกค้าดังกล่าวสำหรับบัญชีกลางที่ได้รับการยืนยันแล้ว หรือยกเลิกการยืนยันตัวตนของบัญชีกลางที่ได้รับการยืนยันแล้วของลูกค้าดังกล่าวก็ได้

                        (1) ในกรณีที่ลูกค้าให้ข้อมูลเท็จแก่บริษัท

                        (2) ในกรณีที่ไม่เป็นไปตามมาตรฐานของการตรวจสอบ (ซึ่งบริษัทไม่มีหน้าที่ต้องเปิดเผยมาตรฐานดังกล่าว) ที่บริษัทกำหนดขึ้น

                        (3) นอกจากนี้ ในกรณีที่บริษัทเห็นว่าเป็นเรื่องไม่เหมาะสมที่ลูกค้าจะใช้งานบัญชีกลาง

ข้อ 2  การปรับปรุงข้อกำหนด

            บริษัทสามารถปรับปรุงข้อกำหนดนี้และลักษณะของการบริการ และอื่น ๆ ที่ให้บริการโดยบัญชีกลางได้โดยแจ้งให้ลูกค้าทราบถึงการปรับปรุงดังกล่าวโดยการประกาศหรือการบอกกล่าวตามที่บริษัทเห็นว่าจำเป็นโดยดุลพินิจฝ่ายเดียวของบริษัทหรือตามที่กฎหมายที่เกี่ยวข้องกำหนด ในกรณีที่ลูกค้ายังคงใช้งานบัญชีกล่งต่อไปหลังจากการปรับปรุง ให้ถือว่าลูกค้าดังกล่าวได้ให้ความยินยอมในการปรับปรุงข้อกำหนดนี้และลักษณะการบริการ และอื่น ๆ แล้ว

ข้อ 3  ระยะเวลาการใช้งาน

            3.1ระยะเวลาใช้งานสำหรับบัญชีกลาง จะเริ่มต้นตั้งแต่วันที่ลูกค้ามีคำขอใช้งานบัญชีดังกล่าวจนถึงวันที่บัญชีนั้นถูกลบอย่างเสร็จสมบูรณ์

ข้อ 4  ค่าบริการ

            4.1 บริษัทจะกำหนดลักษณะ ค่าบริการ และวันที่ถึงกำหนดชำระค่าบริการสำหรับแผนการบริการที่ต้องชำระค่าบริการ และอื่น ๆ และจะประกาศหรือบอกกล่าวลูกค้าเกี่ยวกับเรื่องดังกล่าว โปรดตรวจสอบเรื่องดังกล่าวข้างต้นในเวลาที่สมัครใช้งานแผนการบริการที่ต้องชำระค่าบริการ

            4.2 บริษัทสามารถเปลี่ยนแปลงหรือเพิ่มเติม แผนการบริการที่ต้องชำระค่าบริการโดยแจ้งให้ลูกค้าทราบโดยการประกาศหรือบอกกล่าวเกี่ยวกับเรื่องดังกล่าว

            4.3 เมื่อลูกค้าประสงค์จะเปลี่ยนแปลงแผนการบริการจากแบบไม่มีค่าบริการเป็นแผนการบริการที่ต้องชำระค่าบริการ ลูกค้าดังกล่าวจะต้องมีคำขอเปลี่ยนแปลงดังกล่าวผ่านทางวิธีการที่บริษัทกำหนดขึ้น และลูกค้า จะสามารถทำการเปลี่ยนแปลงดังกล่าวได้ในวันที่บริษัทได้รับคำขอเช่นว่านั้นแล้ว นอกจากนี้ เมื่อลูกค้าประสงค์จะเปลี่ยนแปลงจากแผนการบริการที่ต้องชำระค่าบริการแผนหนึ่งเป็นอีกแผนหนึ่ง หรือเป็นแบบไม่มีค่าบริการ ลูกค้าจะสามารถทำการเปลี่ยนแปลงดังกล่าวได้ในเดือนถัดจากวันที่บริษัทได้รับคำขอเปลี่ยนแปลงเช่นว่านั้น

            4.4 แม้ว่าลูกค้าจะได้ทำการยกเลิกบัญชีทางการสำหรับแผนการบริการที่ต้องชำระค่าบริการภายในเดือนใดแล้วก็ตาม ลูกค้าดังกล่าวยังจะต้องชำระค่าบริการรายเดือนสำหรับเดือนดังกล่าวเต็มจำนวนและค่าบริการดังกล่าวจะไม่ถูกคำนวณเป็นรายวัน นอกจากนี้ แม้ว่าบัญชีทางการจะถูกยกเลิกแล้ว บริษัทจะไม่คืนค่าบริการที่ลูกค้าได้ชำระไว้ล่วงหน้าให้แก่ลูกค้า

            4.5 ในเวลาที่ชำระค่าบริการให้แก่บริษัท หากค่าบริการดังกล่าวจะต้องเสียภาษีการบริโภคตามบทบัญญัติของพระราชบัญญัติภาษีธุรกิจว่าด้วยภาษีมูลค่าเพิ่มและที่ไม่ใช่ภาษีมูลค่าเพิ่ม (Value-added and Non-value-added Business Tax Act) รวมถึงกฎหมาย และ/หรือ ข้อบังคับที่เกี่ยวข้องกับพระราชบัญญัติดังกล่าว หรือกฎหมายหรือข้อบังคับใด ๆ ที่เกี่ยวข้อง ลูกค้าจะต้องชำระค่าบริการนั้นพร้อมด้วยจำนวนเงินซึ่งเท่ากับภาษีที่เกี่ยวข้อง

ข้อ 5  บัญชีกลาง

          5.1 ลูกค้าจะต้องจัดการรหัสผ่านสำหรับบัญชีกลางด้วยความรับผิดชอบของตนเองอย่างเคร่งครัดเพื่อมิให้ถูกนำไปใช้โดยไม่ได้รับอนุญาต ทั้งนี้ บริษัทจะถือว่าการกระทำใด ๆ และทั้งหลายที่ได้กระทำขึ้นผ่านทางรหัสผ่านที่ได้ลงทะเบียนไว้นั้นเป็นการกระทำของลูกค้า

          5.2 บริษัทไม่ต้องรับผิดชอบสำหรับความเสียหายหรือการเสียประโยชน์ที่เกิดขึ้นกับลูกค้าจากการกระทำที่ได้กระทำผ่านบัญชีกลางไม่ว่าด้วยเหตุใดก็ตาม

          5.3 หากลูกค้ามีความประสงค์ บริษัทอาจให้ความช่วยเหลือลูกค้าในการดำเนินการเกี่ยวกับบัญชีกลางในขอบเขตที่สมเหตุสมผลได้ในบางกรณี ในกรณีดังกล่าว บริษัทสามารถเข้าถึงและดำเนินการเกี่ยวกับบัญชีกลางในขอบเขตที่จำเป็นสำหรับการให้ความช่วยเหลือก็ได้ นอกจากนี้ บริษัทจะไม่รับผิดชอบใด ๆ สำหรับความเสียหายที่เกิดขึ้นแก่ลูกค้าหรือผู้ใช้งานบัญชีกลาง (ต่อไปนี้เรียกว่า “ผู้ใช้งาน”) ซึ่งเกิดขึ้นจากการดำเนินการดังกล่าวข้างต้น

          5.4 ในกรณีที่สัญญาที่เกี่ยวกับการใช้งานบัญชีกลางถูกยกเลิกหรือเสร็จสมบูรณ์ หรือการให้การบริการบัญชีกลางเสร็จสมบูรณ์ บริษัทสามารถลบข้อมูลเกี่ยวกับบัญชีกลางที่เกี่ยวข้องและเนื้อหาที่มีการเผยแพร่ผ่านทางบัญชีกลาง (หมายถึง ข้อมูลหรือเนื้อหาในรูปแบบที่ลูกค้าอนุญาตให้มีการส่งผ่านหรือเข้าถึงได้โดยผู้ใช้งานผ่านการใช้งานบัญชีกลาง รวมถึงแต่ไม่จำกัดเพียง ไอคอน ข้อมูลในโปรไฟล์ ข้อความ รูปภาพและภาพเคลื่อนไหวซึ่งส่งโดยลูกค้า ต่อไปนี้จะเรียกรวมกันว่า “เนื้อหา”) โดยดุลพินิจของบริษัท และลูกค้าจะต้องให้ความยินยอมเพื่อการดำเนินการดังกล่าวด้วย

ข้อ 6  หน้าที่ในการรายงานข้อมูล

          ในกรณีที่ลูกค้าเปลี่ยนแปลงชื่อ นามสกุล ที่อยู่อีเมล์ ภูมิลำเนา เบอร์โทรศัพท์ หรือข้อมูลทางการติดต่อสื่อสารอื่น ๆ ซึ่งได้ลงทะเบียนไว้กับบัญชีกลาง ลูกค้าดังกล่าวจะต้องรายงานการเปลี่ยนแปลงเช่นว่านั้นผ่านทางวิธีการที่บริษัทกำหนดไว้โดยทันที และในกรณีที่ได้มีการรายงานข้อมูลดังกล่าวแล้ว บริษัทอาจร้องขอให้ลูกค้าดังกล่าวนำส่งหลักฐานของการเปลี่ยนแปลงดังกล่าวและลูกค้าจะต้องปฏิบัติตามคำร้องขอเช่นว่านั้นด้วย

ข้อ 7  ความรับผิดชอบของลูกค้า

          7.1 ในกรณีที่บุคคลที่สามได้มีการร้องเรียนหรือเรียกร้อง หรือยื่นฟ้องคดี และอื่น ๆ ต่อบริษัทเนื่องจากการใช้งานบัญชีกลางโดยลูกค้า ลูกค้าจะต้องตอบสนองต่อเรื่องดังกล่าวด้วยค่าใช้จ่ายของตนเองและต้องรับผิดชอบแต่เพียงฝ่ายเดียว และลูกค้าจะต้องไม่สร้างความยุ่งยากให้แก่บริษัทเกี่ยวกับเรื่องดังกล่าว ทั้งนี้ ลูกค้าจะต้องรับผิดชอบต่อความรับผิดทางกฎหมายใด ๆ ที่เกิดขึ้นจากการใช้งานบัญชีทางการโดยลูกค้า ซึ่งผู้บริหารจัดการ (administrators) และบุคลากรผู้ดำเนินการบัญชีกลางจะต้องรับผิดร่วมกันและแทนกันในเรื่องดังกล่าวด้วย ทั้งนี้ ลูกค้าตกลงว่าบริษัทจะไม่ต้องรับผิดชอบ ในความเสียหายหรือความรับผิดใด ๆ ที่เกิดขึ้นแก่บุคคลที่สามใด ๆ ซึ่งเกิดจากการใช้งานบัญชีกลาง

          7.2 หากลูกค้าละเมิดสิทธิใด ๆ หรือก่อให้เกิดความเสียหายใด ๆ แก่บุคคลที่สามโดยการฝ่าฝืนกฎหมายที่เกี่ยวข้องหรือละเมิดข้อกำหนดนี้ นอกเหนือจากข้อ 10.1 ดังกล่าวข้างต้นแล้ว บริษัทสามารถ (1) จำกัดหรือห้ามผู้บริหารจัดการหรือบุคลากรผู้ดำเนินการบัญชีกลางดังกล่าว มิให้ดำเนินการบัญชีทางการอื่นใดที่มีอยู่อีกต่อไป และ (2) ปฏิเสธการขอใช้บริการบัญชีกลางโดยผู้บริหารจัดการหรือบุคลากรผู้ดำเนินการบัญชีกลางที่จะมีขึ้นใหม่ในอนาคตโดยไม่ต้องบอกกล่าวล่วงหน้าหรือชี้แจงเหตุผล

          7.3 ลูกค้าต้องชดใช้ความเสียหายใด ๆ (รวมถึง ค่าทนายความที่เกิดขึ้น) ต่อบริษัทซึ่งเกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าโดยทันที

ข้อ 8  การปฏิบัติต่อข้อมูลซึ่งระบุตัวตนของลูกค้า

          8.1 บริษัทต้องใช้ข้อมูลซึ่งระบุตัวตนของลูกค้าซึ่งลูกค้าดังกล่าวได้ให้ไว้แก่บริษัทภายในขอบเขตซึ่งสอดคล้องกับคำอธิบายที่ระบุไว้ในนโยบายความเป็นส่วนตัวของวันไอดี (One ID Privacy Policy) และการประมวลผลของบัญชีกลาง

          8.2 เว้นแต่จะมีกฎหมาย ข้อบังคับ และ/หรือ นโยบายความเป็นส่วนตัวของวันไอดี (One ID Privacy Policy) และเว้นแต่จะได้มีการขอรับความยินยอมของลูกค้าที่เกี่ยวข้องเป็นรายคนแยกจากกัน บริษัทต้องไม่ให้ข้อมูลซึ่งระบุตัวตนของลูกค้าแก่บุคคลที่สามโดยไม่ได้รับความยินยอมจากลูกค้าดังกล่าว

          8.3 ลูกค้าสามารถร้องขอให้บริษัทเปิดเผย แก้ไข เพิ่มเติม และ/หรือ ลบข้อมูลซึ่งระบุตัวตนซึ่งบริษัทได้รวบรวมไว้จากลูกค้า โดยที่อย่างไรก็ตาม การเปิดเผย การแก้ไข การเพิ่มเติม และ/หรือ การลบข้อมูลนั้นจะต้องเป็นไปตามขั้นตอนที่กำหนดขึ้นต่างหากโดยบริษัท และอาจจะมีค่าใช้จ่ายแยกต่างหากในบางกรณีด้วย ทั้งนี้ โปรดติดต่อ ณ ที่อยู่ของบริษัทดังต่อไปนี้สำหรับคำถามเกี่ยวกับการการเปิดเผย การแก้ไข การเพิ่มเติมและ/หรือการลบหรือการร้องเรียนต่าง ๆ (02-257-7198)

          8.4 ลูกค้าตกลงล่วงหน้าว่าข้อมูลทั้งหมดซึ่งได้ลงทะเบียนไว้โดยลูกค้าเกี่ยวกับการบริการภายใต้ข้อบังคับนี้จะถูกลบเมื่อมีการเลิกสัญญา

          8.5 ลูกค้าตกลงว่า บริษัทสามารถได้รับข้อมูลเชิงสถิติเกี่ยวกับการใช้การบริการของลูกค้า (รวมถึงแต่ไม่จำกัดเพียง ข้อมูลเชิงสถิติ เช่น จำนวนผู้ใช้เฉพาะและจำนวนข้อความ) เพื่อวัตถุประสงค์ในการดำเนินการและปรับปรุงบัญชีและการบริการ

ข้อ 9  การโอนและพันธมิตรทางธุรกิจ

          9.1 บริษัทสามารถโอนการให้การบริการบัญชีกลางบางส่วนให้แก่บริษัทในกลุ่มของบริษัทหรือแก่บุคคลที่สามก็ได้

          9.2 บริษัทสามารถให้ข้อมูลเกี่ยวกับบัญชีกลางแก่คู่ค้าทางธุรกิจและบุคคลที่สามอื่น ๆ (อย่างไรก็ตาม ไม่รวมถึงข้อมูลส่วนบุคคล) เกี่ยวกับลูกค้าเพื่อจัดให้ซึ่งการทำงานของบัญชีกลางแก่คู่ค้าทางธุรกิจและเว็บไซต์ แอพพลิเคชั่น และอื่น ๆ เป็นต้น ของบุคคลที่สามอื่น ๆ ในการนี้ การเชื่อมโยงของลูกค้ากับบัญชีทางการ และอื่น ๆ อาจถูกแสดงอยู่บนเว็บไซต์ของคู่ค้าทางธุรกิจหรือบุคคลที่สามอื่น ๆ ก็ได้ ยิ่งไปกว่านั้น บริษัทสามารถแสดงตัวชี้แหล่งในอินเทอร์เน็ตของเว็บไซต์ (URL) ซึ่งรวมถึงข้อมูลของลูกค้าไว้ที่หุ้นส่วนทางธุรกิจ เผยแพร่การเชื่อมต่อสู่เว็บไซต์ดังกล่าว เป็นต้น ในหน้าบัญชีกลางของลูกค้านั้นด้วย

ข้อ 10  การระงับ การเปลี่ยนแปลง และการเสร็จสมบูรณ์ของการบริการ

            10.1 ในกรณีของข้อใดข้อหนึ่งดังต่อไปนี้ บริษัทสามารถระงับการให้การบริการบัญชีกลางได้ในบางกรณี ถึงแม้ว่าบริษัทจะได้ระงับบัญชีทางการเป็นการชั่วคราว บริษัทจะไม่รับผิดชอบใด ๆ สำหรับการระงับดังกล่าวต่อลูกค้า

                         (1) ในกรณีของการบำรุงรักษา ตรวจสอบ หรือเรื่องอื่นในทำนองเดียวกัน เกี่ยวกับสิ่งอำนวยความหรืออุปกรณ์ที่จำเป็นสำหรับการให้การบริการบัญชีทางการ ซึ่งได้มีขึ้นตามปกติหรือในกรณีฉุกเฉิน

                         (2) ในกรณีที่มีความล้มเหลว การหยุดทำงาน หรือเรื่องอื่นในทำนองเดียวกัน เกิดขึ้นกับสิ่งอำนวยความสะดวกหรืออุปกรณ์ที่ใช้ในการให้การบริการบัญชีทางการ

                        (3) ในกรณีที่เป็นไปไม่ได้ที่จะใช้งานการบริการโทรคมนาคมซึ่งดำเนินการโดยผู้ประกอบธุรกิจโทรคมนาคม

                        (4) ในกรณีที่มีความยุ่งยากในการให้การบริการบัญชีทางการเนื่องจากไฟดับ ไฟไหม้ แผ่นดินไหวการประท้วงของแรงงาน หรือเหตุสุดวิสัยในรูปแบบอื่น

                        (5) ในกรณีที่มีสาเหตุเกี่ยวกับการดำเนินการหรือสาเหตุทางเทคนิคที่เกี่ยวข้องกับบัญชีทางการอย่างสมเหตุสมผล

            10.2 บริษัทสามารถเปลี่ยนแปลงหรือสิ้นสุดการดำเนินการบัญชีกลางทั้งหมดหรือบางส่วนได้โดยการประกาศหรือแจ้งให้ลูกค้าทราบในเรื่องดังกล่าว แม้ว่าบริษัทจะได้เปลี่ยนแปลงหรือสิ้นสุดการดำเนินการบัญชีกลางแล้วไม่ว่าทั้งหมดหรือบางส่วน บริษัทจะไม่รับผิดชอบใด ๆ ในเรื่องดังกล่าวต่อลูกค้าทั้งสิ้น

ข้อ 11   ความเสียหาย

            11.1 ในกรณีที่ลูกค้าได้ละเมิดข้อกำหนดนี้และก่อให้เกิดความเสียหายแก่บริษัท (รวมถึงแต่ไม่จำกัดเพียง ค่าทนายความที่สมเหตุสมผล) ลูกค้าจะต้องรับผิดชดใช้ความเสียหายนั้นให้แก่บริษัทโดยทันที

            11.2 ในกรณีที่ลูกค้าได้รับการการร้องเรียน การอ้างสิทธิ การร้องขอ การเรียกร้อง การคัดค้าน และอื่น ๆ เป็นต้น (ต่อไปนี้จะเรียกว่า “การร้องเรียน และอื่น ๆ”) จากบุคคลที่สาม เกี่ยวกับบัญชีกลาง โดยอ้างว่าสิทธิของบุคคลที่สามนั้นถูกละเมิด ลูกค้าดังกล่าวจะต้องดำเนินการและแก้ไขการร้องเรียน และอื่น ๆ นั้นด้วยค่าใช้จ่ายและความรับผิดชอบของตน ทั้งนี้ ลูกค้าต้องรับผิดชอบในความรับผิดทางกฎหมายใด ๆ ที่เกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าด้วยตนเอง และลูกค้าตกลงว่าบริษัทจะไม่ต้องรับผิดสำหรับความเสียหายและการรับผิดใด ๆ ซึ่งเกิดขึ้นจากการใช้งานบัญชีกลางโดยลูกค้าไม่ว่าในกรณีใดก็ตาม ซึ่งในกรณีที่มีความเสียหายเกิดขึ้นต่อบริษัทที่เกี่ยวข้องกับการร้องเรียน และอื่น ๆ ลูกค้าจะต้องชดใช้ความเสียหายดังกล่าวทั้งหมดให้แก่บริษัท นอกจากนี้ ในกรณีที่บริษัทดำเนินการหรือแก้ไขการร้องเรียน และอื่น ๆ ดังกล่าวในนามของลูกค้าที่เกี่ยวข้อง ลูกค้าที่เกี่ยวข้องต้องรับผิดชอบค่าใช้จ่ายทั้งหมดสำหรับการดำเนินการและการแก้ไขนั้นด้วย

            11.3 บริษัทจะไม่รับผิดชอบต่อความเสียหายใด ๆ ที่เกิดขึ้นแก่ลูกค้าจากการใช้งานบัญชีกลางโดยลูกค้า โดยที่กรณีดังกล่าวจะไม่บังคับใช้กับความเสียหายซึ่งเกิดขึ้นเนื่องจากการจงใจก่อให้เกิดความเสียหายหรือความประมาทเลินเล่ออย่างร้ายแรงโดยบริษัท ในกรณีดังกล่าว บริษัทจะรับผิดชอบในการชดใช้ความเสียหายทั่วไปและความเสียหายโดยตรงที่บริษัทก่อให้เกิดแก่ลูกค้า เป็นจำนวนสูงสุดไม่เกินค่าบริการสำหรับบัญชีทางการที่ได้ชำระแล้วโดยลูกค้านั้นในเดือนที่ความเสียหายนั้นได้มีขึ้น

ข้อ 12  การระงับการใช้และการบอกเลิก

            12.1 ในกรณีที่บริษัทเห็นว่าข้อใดข้อหนึ่งดังต่อไปนี้เกิดขึ้นกับลูกค้าหรืออาจจะเกิดขึ้นกับลูกค้า บริษัทสามารถระงับบัญชีกลาง โดยการระงับการใช้งานบัญชีกลางโดยลูกค้าเป็นการชั่วคราว หรือบอกเลิกสัญญาต่าง ๆ (ต่อไปนี้จะเรียกว่า “สัญญา”) กับลูกค้าภายใต้ข้อกำหนดนี้ โดยไม่จำเป็นต้องแจ้งให้ทราบแต่อย่างใด และหากมีความเสียหายเกิดขึ้นแก่ลูกค้าจากการระงับการใช้งานหรือการบอกเลิกสัญญาดังกล่าว บริษัทจะไม่รับผิดชอบใด ๆ ในเรื่องดังกล่าวแก่ลูกค้านั้น

                        (1)  ในกรณีที่บริษัทได้ทราบถึงการมีอยู่ของเหตุในการปฏิเสธคำขอตามที่ระบุไว้ในข้อ 1.3 หลังจากการเริ่มต้นการใช้งานบัญชีกลาง (ไม่ว่าบัญชีที่เกี่ยวข้องนั้นจะเป็นบัญชีที่ได้รับการยืนยันแล้วหรือไม่ก็ตาม)

                        (2)  ในกรณีที่ลูกค้าได้ใช้บัญชีทางการสำหรับวัตถุประสงค์ที่ไม่ชอบด้วยกฎหมาย

                        (3)  ในกรณีที่บริษัทเชื่อว่ามีการขาดความน่าเชื่อถือของลูกค้า

                        (5)  ในกรณีที่ไม่สามารถติดต่อลูกค้าได้ด้วยสาเหตุที่ไม่ใช่ความผิดของบริษัท

                        (6)  ในกรณีที่ลูกค้าไม่เข้าสู่บัญชีของตนภายในระยะเวลาหนึ่งที่กำหนดขึ้นโดยบริษัท

                        (7)  นอกเหนือจากกรณีที่ได้ระบุไว้ข้างต้น ในกรณีที่ลูกค้าได้ดำเนินการที่บริษัทเห็นว่าไม่เหมาะสม

ข้อ 13 การรักษาข้อมูลความลับ

ลูกค้าตกลงที่จะดูแลรักษาข้อมูลความลับของคู่สัญญาอีกฝ่ายเพื่อให้เป็นความลับต่อไป จะไม่เปิดเผยข้อมูลความลับหรือยินยอมให้บุคคลอื่นรับทราบ หรือใช้ข้อมูลความลับ โดยจะใช้มาตรฐานการดูแลข้อมูลความลับนั้นเสมือนกับการดูแลรักษาข้อมูลความลับที่สุดของตนเองเป็นอย่างน้อย เว้นแต่ จะได้รับความยินยอมเป็นลายลักษณ์อักษรจากบริษัท

This application will be able to:
(บริการนี้ต้องการข้อมูล)

Account Description ( ข้อมูลส่วนตัว )
Title Name ( คำนำหน้าชื่อ )
First Name ( ชื่อจริง )
Last Name ( นามสกุล )
ID Card ( เลขบัตรประชาชน )
Date of Birth ( วันเกิด )
Email ( อีเมล )
Telephone Number ( เบอร์โทร )
Profile Picture ( รูปโปรไฟล์ )
""",
          //Chat Page
          'Chat': 'แชท',
          'Share': 'แชร์',
          'Error': 'ข้อผิดพลาด',
          'Forward': 'ส่งต่อ',
          'Friend search': 'ค้นหาเพื่อน',
          'Group search': 'ค้นหากลุ่ม',
          'Friend search or Group search':'ค้นหาเพื่อน หรือ ค้นหากลุ่ม',
          'Friend': 'เพื่อน',
          'Group': 'กลุ่ม',
          'Select Message': 'เลือกข้อความ',
          'Video': 'วีดีโอ',
          'Location': 'ตำแหน่งที่ตั้ง',
          'Library': 'คลังวีดีโอ',
          'Unsend': 'ยกเลิกข้อความ',
          'Reply': 'ตอบกลับ',
          'baht': 'บาท',
          'Free Download': 'ฟรี ดาวน์โหลด',
          'Search Term': 'คำค้นหา',
          'Reset': 'รีเซ็ต',
          'Select all companies': 'เลือกบริษัททั้งหมด',
          'Select friends': 'เลือกเพื่อน',
          'Next': 'ถัดไป',
          'Member': 'สมาชิก',
          'person': 'คน',
          'Create a group': 'สร้างกลุ่ม',
          'Create': 'สร้าง',
          'Group name': 'พิมพ์ชื่อกลุ่ม',
          'Add': 'เพิ่ม',
          'Start a conversation': 'เริ่มต้นการสนทนา',
          'You have left this conversation': 'คุณออกจากการสนทนาแล้ว',
          'Send pictures': 'ส่งรูปภาพ',
          'Send file': 'ส่งไฟล์',
          'Send video': 'ส่งวิดีโอ',
          'Send place': 'ส่งสถานที่',
          'Send contact': 'ส่งผู้ติดต่อ',
          'Send audio file': 'ส่งไฟล์เสียง',
          'Send a sticker': 'ส่งสติกเกอร์',
          'Photo': 'รูป',
          'Video': 'วิดีโอ',
          'Sticker': 'สติกเกอร์',
          'Agree': 'ตกลง',
          'Edit': 'แก้ไข',
          'Contact information': 'ส่งข้อมูลติดต่อ',
          'Are you sure': 'คุณแน่ใจหรือไม่',
          'You want to cancel the message': 'คุณต้องการยกเลิกข้อความ',
          'You want to delete the message': 'คุณต้องการลบข้อความ',
          'Location': 'ตำแหน่งที่ตั้ง',
          'Seek your location here': 'ค้นหาตำแหน่งของคุณที่นี่',
          'Invite': 'เชิญ',
          'in the group': 'ในกลุ่ม',
          'edit permissions': 'แก้ไขสิทธิ์',
          'delete': 'ลบ',
          'leave the group': 'ออกจากกลุ่ม',
          'delete album': 'ลบอัลบั้ม',
          'change group name': 'เปลี่ยนชื่อกลุ่ม',
          'change group picture': 'เปลี่ยนรูปกลุ่ม',
          'Change name album': 'เปลี่ยนชื่ออัลบั้ม',
          'Create album': 'สร้างอัลบั้ม',
          'Add photo': 'เพิ่มรูปภาพ',
          'Album': 'อัลบั้ม',
          'Read': 'อ่านแล้ว',
          'Note': 'โน้ต',
          'You Unsend Message': 'คุณได้ยกเลิกข้อความ',
          'Unsend Message': 'ได้ยกเลิกข้อความ',
          'Photo and Video': 'รูปภาพ และ วิดีโอ',
          'File': 'ไฟล์',
          'Link': 'ลิงก์',
          'Setting': 'ตั้งค่า',
          'Turn off noti': 'ปิดแจ้งเตือน',
          'Turn on noti': 'เปิดแจ้งเตือน',
          'Block Friend': 'บล็อกเพื่อน',
          'Unblock Friend': 'ปลดบล็อกเพื่อน',
          'Leave': 'ออก',
          'Photo and videos were not found': 'ไม่พบรูปและวิดีโอ',
          'Album not found': 'ไม่พบอัลบั้ม',
          'Do you want to leave the group': 'คุณต้องการออกจากกลุ่มหรือไม่',
          'Apologize': 'ขออภัย',
          'Unable to leave group': 'ไม่สามารถออกจากกลุ่มได้',
          'Please manage admin privileges': 'กรุณาจัดการสิทธิ์แอดมิน',
          'Complete': 'เรียบร้อย',
          'Set Admin': 'ตั้งผู้ดูแล',
          'Release': 'ปลดผู้ดูแล',
          'Invite friends': 'เชิญเพื่อน',
          'You want to delete': 'คุณต้องการลบ',
          'Leave the group ?': 'ออกจากกลุ่มหรือไม่',
          'Photo & Video': 'รูปภาพ และ วิดีโอ',
          'No photos or videos': 'ไม่มีรูปภาพหรือวีดีโอ',
          'Photos and videos in chat rooms will be shown here': 'รูปภาพและวีดีโอในห้องแชทจะแสดงที่นี่',
          'No File': 'ไม่มีไฟล์',
          'Files in chat rooms will be displayed here': 'ไฟล์ในห้องแชทจะแสดงที่นี่',
          'No Link': 'ไม่มีลิงก์',
          'Links in chat rooms will be displayed here': 'ลิงก์ในห้องแชทจะแสดงที่นี่',
          'Download': 'ดาวน์โหลด',
          'No Album': 'ไม่มีอัลบั้ม',
          'Albums in the chat room will be displayed here': 'อัลบั้มในห้องแชทจะแสดงที่นี่',
          'Add Photo': 'เพิ่มรูปภาพ',
          'Edit Album Name': 'แก้ไขชื่ออัลบั้ม',
          'Delete Album': 'ลบอัลบั้ม',
          'All photos in the album will be deleted permanently. Want to continue?': 'รูปทั้งหมดในอัลบั้มจะถูกลบอย่างถาวร ต้องการดำเนินการต่อหรือไม่',
          'This album has been deleted': 'อัลบั้มถูกลบแล้ว',
          'Change Name': 'เปลี่ยนชื่อ',
          'No Note': 'ไม่มีโน้ต',
          'Note in chat rooms will be displayed here': 'โน้ตในห้องแชทจะแสดงที่นี่',
          'Edit Note': 'แก้ไขโน้ต',
          'Delete Note': 'ลบโน้ต',
          'Note will be deleted permanently. Want to continue ?': 'โน้ตจะถูกลบอย่างถาวร ต้องการดำเนินการต่อหรือไม่',
          'Save': 'บันทึก',
          'The note has been deleted': 'โน้ตถูกลบแล้ว',
          'Type Text': 'พิมพ์ข้อความ',
          'Create Note': 'สร้างโน้ต',
          'Unable to type text': 'ไม่สามารถพิมพ์ข้อความได้',
          'Open in': 'เปิดใน',
          'Group Setting': 'ตั้งค่ากลุ่ม',
          'Group Name': 'ชื่อกลุ่ม',
          'Member & Management': 'สมาชิก & การจัดการ',
          'Leave Group': 'ออกจากกลุ่ม',
          'Create group': 'สร้างกลุ่ม',
          'Do you want to delete photo from this album ?': 'คุณต้องการลบรูปในอัลบั้มนี้ใช่หรือไม่',
          'Contacts':'รายชื่อ',
          'delete photos in album':'ลบรูปในอัลบั้ม',
          'Download Sticker':'ดาวน์โหลดสติกเกอร์',
          'All':'ทั้งหมด',
          'Text':'ข้อความ',
          'Keep will be deleted permanently. Want to continue ?': 'Keep นี้จะถูกลบอย่างถาวร ต้องการดำเนินการต่อหรือไม่',
          'Select from photos' : 'เลือกจากรูปภาพ',
          'Select from video' : 'เลือกจากวีดีโอ',
          'Keep' : 'Keep',
          'Save at Keep' : 'บันทึกที่ Keep',
          'No Keep' : 'ไม่มี Keep',
          'Save Successed' : 'บันทึกสำเร็จ',
          'search for messages' : 'ค้นหาข้อความ',
          'Search not found' : 'ไม่พบการค้นหา',
          'File size must not exceed 25 MB' : 'ขนาดไฟล์ต้องไม่เกิน 25 MB',
          'Call ended' : 'การโทร',
          'Cancled' : 'ยกเลิกการโทร',
          'Missed call' : 'ไม่ได้รับสาย',
          'No response' : 'ไม่มีการตอบรับ',
          'Call' : 'กำลังโทร',
          'Calling' : 'กำลังสนทนา',
          'Video Call' : 'วิดีโอคอล',
          'Emoji' : 'อิโมจิ',
          'Message not found' : 'ไม่พบข้อความ',
          'Do you want to delete this chat room' : 'คุณต้องการลบห้องแชทนี้หรือไม่',
          'Allow OnePlatform to access photos and media on your device?' : 'คุณยังไม่ได้อนุญาตให้มีการเข้าถึงไฟล์กรุณาตั้งค่า',
          'Created album' : 'สร้างอัลบั้ม',
          'Add a photo to the album' : 'เพิ่มรูปในอัลบั้ม',
          'Clear All' : 'ยกเลิกทั้งหมด',
          'Select All' : 'เลือกทั้งหมด',

          //ChatBot Page
          'Chat Bot' : 'แชทบอท',
        },
  };
}
