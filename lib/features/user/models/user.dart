class User {
  String? id;
  String? userName;
  String? email;
  String? firstName;
  String? lastName;
  String? middleName;
  String? fullName;
  String? avatar;
  String? banner;
  String? bio;
  String? field;
  String? userId;
  String? countryCode;
  String? country;
  String? city;
  List<String>? projectImages;
  String? phoneNumber;
  num? userBalance;
  String? iso;
  bool? isActive;
  bool? isEmailVerified;
  bool? isPhoneNumberVerified;
  bool? optActive;
  int? otpCodeExpiry;
  String? registerType;
  bool? newUser;
  num? rating;
  int? milestoneCompleted;
  int? milestonePaid;
  num? totalEarning;
  num? totalSpending;
  String? successRatePercentage;
  bool? openToWork;
  String? averageRate;
  int? updatedAt;
  int? createdAt;
  int? kycLevel;

  User(
      {this.id,
      this.userName,
      this.email,
      this.firstName,
      this.lastName,
      this.middleName,
      this.fullName,
      this.avatar,
      this.banner,
      this.bio,
      this.field,
      this.userId,
      this.countryCode,
      this.city,
      this.country,
      this.projectImages,
      this.phoneNumber,
      this.userBalance,
      this.iso,
      this.isActive,
      this.isEmailVerified,
      this.isPhoneNumberVerified,
      this.optActive,
      this.otpCodeExpiry,
      this.registerType,
      this.newUser,
      this.rating,
      this.milestoneCompleted,
      this.milestonePaid,
      this.totalEarning,
      this.totalSpending,
      this.successRatePercentage,
      this.openToWork,
      this.averageRate,
      this.updatedAt,
      this.createdAt,
      this.kycLevel});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    fullName = json['fullName'];
    avatar = json['avatar'];
    banner = json['banner'];
    bio = json['bio'];
    field = json['field'];
    userId = json['userId'];
    countryCode = json['countryCode'];
    country = json['country'];
    city = json['city'];
    projectImages = json['projectImages'] != null
        ? json['projectImages'].cast<String>()
        : [];
    phoneNumber = json['phoneNumber'];
    if (json['userBalance'] is String) {
      userBalance = num.parse(json['userBalance']);
    } else {
      userBalance = json['userBalance'];
    }
    iso = json['iso'];
    isActive = json['isActive'];
    isEmailVerified = json['isEmailVerified'];
    isPhoneNumberVerified = json['isPhoneNumberVerified'];
    optActive = json['optActive'];
    otpCodeExpiry = json['otpCodeExpiry'];
    registerType = json['registerType'];
    newUser = json['newUser'];
    rating = json['rating'];
    milestoneCompleted = json['milestoneCompletedCount'];
    milestonePaid = json['milestonePaidCount'];
    totalEarning = json['totalEarning'];
    totalSpending = json['totalSpending'];
    successRatePercentage = json['successRatePercentage'];
    openToWork = json['openToWork'];
    averageRate = json['averageRate'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    kycLevel = json['kycLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['middleName'] = middleName;
    data['fullName'] = fullName;
    data['avatar'] = avatar;
    data['banner'] = banner;
    data['bio'] = bio;
    data['field'] = field;
    data['userId'] = userId;
    data['countryCode'] = countryCode;
    data['country'] = country;
    data['city'] = city;
    data['projectImages'] = projectImages;
    data['phoneNumber'] = phoneNumber;
    data['userBalance'] = userBalance;
    data['iso'] = iso;
    data['isActive'] = isActive;
    data['isEmailVerified'] = isEmailVerified;
    data['isPhoneNumberVerified'] = isPhoneNumberVerified;
    data['optActive'] = optActive;
    data['otpCodeExpiry'] = otpCodeExpiry;
    data['registerType'] = registerType;
    data['newUser'] = newUser;
    data['rating'] = rating;
    data['milestoneCompletedCount'] = milestoneCompleted;
    data['milestonePaidCount'] = milestonePaid;
    data['totalEarning'] = totalEarning;
    data['totalSpending'] = totalSpending;
    data['successRatePercentage'] = successRatePercentage;
    data['openToWork'] = openToWork;
    data['averageRate'] = averageRate;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    data['kycLevel'] = kycLevel;
    return data;
  }
}
