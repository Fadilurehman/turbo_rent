class Urls {
  static String baseUrl = "https://fastrack-backend.onrender.com/api";
  static String bearer = "Bearer ";

  static String user = "/users";
  static String driver = "/driver";
  static String admin = "/admin";

  static String userLogin = "/userLogin";
  static String userSignup = "/userSignup";
  static String userOtp = "/otp";
  static String showAllCars = "/cars";
  static String showSingleCar = "/car";
  static String userCarBook = "/bookCar";
  static String userBookings = "/myBookings";
  static String userPayment = "/payment";

// DRIVER
  static String driverLogIn = "/login";
  static String driverSignUp = "/signup";

  // ADMIN
  static String getAllPlaces = "/getPlaces";

  //payment
  static String payment = "https://api.stripe.com/v1/payment_intents";
}
